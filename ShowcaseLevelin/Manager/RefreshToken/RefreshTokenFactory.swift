//
//  RefreshTokenFactory.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 11/08/25.
//

import AlgoreadMePackageData
import AlgoreadMeCoreLogger

struct RefreshTokenFactory {
    @MainActor static func saveAndSeedToken(accessToken: String, refreshToken: String) {
        AlgoreadMeNetworkModule.shared.seedTokens(
            accessToken: accessToken,
            refreshToken: refreshToken
        )
    }
    
    /// hit after get personal data
    @MainActor
    static func serviceConfigure(
        baseUrl: String = "google.com",
        visibilityLogger: AppLoggerVisibility = DefaultAppLoggerVisibility(),
        phoneNumber: String
    ) {
        AlgoreadMeNetworkModule.shared.configure(
            baseUrl: baseUrl,
            visibilityLogger: DefaultAppLoggerVisibility(),
            refreshConfig: .init(
                phoneNoProvider: { phoneNumber },
                deviceCodeProvider: { "" },
                adidProvider: { "" },
                gpsAdidProvider: { "" }
            )
        )
    }
}
