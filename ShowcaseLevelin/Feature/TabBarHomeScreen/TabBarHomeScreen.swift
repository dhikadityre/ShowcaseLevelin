//
//  TabBarHomeScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

import SwiftUI
import SLHomePageModule
import CoreNetworkNative
import GeneralAboutPageModule

struct TabBarHomeScreen: View {
    @State private var isReady = false
    @State private var selectedtab: Tabidentifier = .home
    
    var body: some View { render() }
    
    private func renderHomeView() -> some View {
        return SLHomeFactory.makeHomeView(
            environment: EnvironmentManager.shared.current,
            firebaseAnalytics: FirebaseAnalyticsManager.shared.analytics,
            visibilityLogger: ClientAppLoggerVisibility.shared
        )
    }
    
    private func renderTabHomeView() -> some View {
        renderHomeView()
            .tabItem {
                Label(Tabidentifier.home.rawValue, systemImage: Tabidentifier.home.toIconSystemName())
            }
            .tag(Tabidentifier.home)
    }
    
    private func renderTabDetailInfoView() -> some View {
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
        .tabItem {
            Label(Tabidentifier.detailInfo.rawValue, systemImage: Tabidentifier.detailInfo.toIconSystemName())
        }
        .tag(Tabidentifier.detailInfo)
    }
    
    private func renderTabAboutView() -> some View {
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
        .tabItem {
            Label(Tabidentifier.about.rawValue, systemImage: Tabidentifier.about.toIconSystemName())
        }
        .tag(Tabidentifier.about)
    }
    
    private func render() -> some View {
        TabView(selection: $selectedtab) {
            renderTabHomeView()
            renderTabDetailInfoView()
            renderTabAboutView()
        }.accentColor(Color.primary)
    }
}
