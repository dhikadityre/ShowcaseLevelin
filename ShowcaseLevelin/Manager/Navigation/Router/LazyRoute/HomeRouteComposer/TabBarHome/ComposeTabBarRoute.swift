//
//  ComposeTabBarRoute.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI
import SLHomePageModule
import GeneralAboutPageModule
import CoreNetworkNative

extension LazyViewBuilder {
    static func buildHomeView(router: AppRouter) -> AnyView {
        return AnyView(
            SLHomeFactory.makeHomeView(
                environment: EnvironmentManager.shared.current,
                firebaseAnalytics: FirebaseAnalyticsManager.shared.analytics,
                visibilityLogger: ClientAppLoggerVisibility.shared,
                didTapItem: { data in
                    let index = getItemIndex(for: data)
                    router.handleItemSelection(data, index: index)
                }
            )
        )
    }
    
    static func buildDetailInfoView() -> AnyView {
        return AnyView(
            DetailInfoScreen(
                viewModel: DetailInfoScreenViewModel(
                    useCase: DetailInfoRepositoryImpl(
                        apiClient: DefaultAPIClient(
                            baseURL: URL(string: EnvironmentManager.shared.current.baseURL)!,
                            visibilityLogger: ClientAppLoggerVisibility.shared
                        )
                    )
                )
            )
        )
    }
    
    static func buildAboutView() -> AnyView {
        return AnyView(
            GeneralAboutView(
                viewModel: GeneralAboutViewModel(
                    aboutAppsModels: .init(
                        productImage: nil,
                        productName: "ShowCaseLevelin",
                        compatibility: "iOS 14",
                        technology: "Swift 6, Combine, SwiftUI, Modular",
                        version: "1.0.0"),
                    aboutDeveloperModel: .init(
                        name: "Dhika Aditya",
                        github: "https.github.com/DhikaAditya",
                        linkedIn: "https://www.linkedin.com/in/dhika-aditya/"
                    ),
                    baseUrl: EnvironmentManager.shared.current.baseURL
                )
            )
        )
    }
    
    // MARK: - Helper Methods
    static func getItemIndex(for data: SLHomeEntity) -> Int {
        // Implementasi logic untuk menentukan index berdasarkan data
        // Ini bisa berdasarkan ID, title, atau property lain dari SLHomeEntity
        return abs(data.title.hashValue) % 2
    }
}
