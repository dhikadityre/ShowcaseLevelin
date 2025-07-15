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

    @MainActor public static func load() -> EnvironmentConfiguration {
        // 1. Ambil flavor dari Info.plist (ditentukan via xcconfig)
        let raw = Bundle.main.object(forInfoDictionaryKey: "FLAVOR") as? String ?? "development"
        let flavor = EnvironmentFlavor(rawValue: raw) ?? .development
        print("[*] Flavor: \(flavor) (\(raw))")

        // 2. Buat konfigurasi default dari flavor
        let config = SLCoreEnvironment.buildConfiguration(for: flavor)
        SLCoreEnvironment.register(configuration: config)

        /*
        // 3. Tentukan interval fetch sesuai flavor
        let fetchInterval: TimeInterval = {
            switch flavor {
            case .mock, .development:
                return 0 // realtime
            case .staging:
                return 300 // 5 menit
            case .production:
                return 3600 // 1 jam
            }
        }()

//         4. Inisialisasi RemoteConfig
        let remoteConfig = RemoteConfigService(minimumFetchInterval: fetchInterval)

//         5. Fetch & override jika ada payload
        remoteConfig.fetchAndActivate { success in
            guard success else {
                print("⚠️ Remote config fetch failed")
                return
            }

            didLoadRemoteConfig = true

            let base64 = remoteConfig.getValue(forKey: "env_payload")
            guard let data = Data(base64Encoded: base64) else {
                print("⚠️ env_payload kosong atau bukan base64")
                return
            }

            do {
                let decrypted = try CoreSecurity.decrypt(data: data)
                didDecryptRemoteConfig = true

                let remote = try JSONDecoder().decode([String: String].self, from: decrypted)

                if let rBaseURL = remote["base_url"]?.trimmingCharacters(in: .whitespacesAndNewlines),
                   let rApiKey = remote["api_key"]?.trimmingCharacters(in: .whitespacesAndNewlines),
                   !rBaseURL.isEmpty, !rApiKey.isEmpty {
                    SLCoreEnvironment.register(configuration: .init(baseURL: rBaseURL, apiKey: rApiKey))
                    print("✅ Konfigurasi berhasil dioverride dari RemoteConfig")
                }

            } catch {
                print("⚠️ Gagal decrypt atau parse JSON RemoteConfig: \(error)")
            }
        }
        */
        
        return SLCoreEnvironment.current
    }
}
