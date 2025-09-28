//
//  SLConfiguration.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 13/07/25.
//

import SLCoreEnvironment
import CoreFirebase
import CoreSecurity
import Foundation

public final class SLConfiguration {
    public static var didLoadRemoteConfig = false
    public static var didDecryptRemoteConfig = false

    @MainActor
    public static func loadAsync() async -> EnvironmentConfiguration {
        let flavor =  EnvironmentFlavorManager.shared.flavor
        let defaultConfig = SLCoreEnvironment.buildConfiguration(
            for: EnvironmentFlavorManager.shared.flavor
        )
        SLCoreEnvironment.register(configuration: defaultConfig)

        let fetchInterval: TimeInterval = {
            switch flavor {
            case .mock, .development: return 0
            case .staging: return 300
            case .mirorring, .production: return 3600
            }
        }()

        let remoteConfig = RemoteConfigService(minimumFetchInterval: fetchInterval)
        let success = await withCheckedContinuation { continuation in
            remoteConfig.fetchAndActivate { success in
                continuation.resume(returning: success)
            }
        }

        guard success else {
            return defaultConfig
        }

        let rawJSONString = remoteConfig.getValue(forKey: "env_payload")
        guard !rawJSONString.isEmpty,
              let data = rawJSONString.data(using: .utf8),
              let remote = try? JSONDecoder().decode([String: String].self, from: data),
              let rBaseURL = remote["base_url"]?.trimmingCharacters(in: .whitespacesAndNewlines),
              let rApiKey = remote["api_key"]?.trimmingCharacters(in: .whitespacesAndNewlines),
              !rBaseURL.isEmpty, !rApiKey.isEmpty,
              let overrideBaseUrl = CoreSecurity.AESCrypto.decrypt(
                  Data(base64Encoded: rBaseURL) ?? Data(),
                  key: "0123456789012345",
                  iv: "abcdefghijklmnop"
              ) else {
            return defaultConfig
        }

        let finalConfig = EnvironmentConfiguration(baseURL: overrideBaseUrl, apiKey: rApiKey)
        SLCoreEnvironment.register(configuration: finalConfig)
        return finalConfig
    }
}
