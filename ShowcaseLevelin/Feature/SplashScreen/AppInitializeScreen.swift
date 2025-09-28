//
//  AppInitializeScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 16/07/25.
//

import SwiftUI
import SLHomePageModule

struct AppInitializeScreen: View {
    @State private var isReady = false

    var body: some View {
        Group {
            if isReady {
                TabBarHomeScreen()
            } else {
                ProgressView("Loading Environment...")
                    .task {
                        await EnvironmentManager.shared.loadAsync()
                        RefreshTokenFactory.saveAndSeedToken(accessToken: "", refreshToken: "")
                        RefreshTokenFactory.serviceConfigure(baseUrl: EnvironmentManager.shared.current.baseURL, phoneNumber: "0878222222")
                        print("[*] EnvironmentManager.shared.current: ", EnvironmentManager.shared.current)
                        isReady = true
                        FirebaseAnalyticsManager.shared.analytics.log(
                            event: "LOADING_ENVIRONMENT_COMPLETED",
                            parameters: nil
                        )
                    }
            }
        }
    }
}
