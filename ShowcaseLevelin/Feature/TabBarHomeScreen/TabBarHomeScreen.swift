//
//  TabBarHomeScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

import SwiftUI
import GeneralAboutPageModule

struct TabBarHomeScreen: View {
    @StateObject private var router = AppRouter()
    @State private var selectedtab: Tabidentifier = .home
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            render()
                .navigationDestination(for: AppRoute.self) { route in
                    route.buildView()
                        .withNavigationDebugging()
                }
        }
        .environmentObject(router)
    }
    
    private func renderTabHomeView() -> some View {
        renderHomeView()
            .tabItem {
                Label(Tabidentifier.home.rawValue, systemImage: Tabidentifier.home.toIconSystemName())
            }
            .tag(Tabidentifier.home)
    }
    
    private func renderTabDetailInfoView() -> some View {
        renderDetailInfoView()
            .tabItem {
                Label(Tabidentifier.detailInfo.rawValue, systemImage: Tabidentifier.detailInfo.toIconSystemName())
            }
            .tag(Tabidentifier.detailInfo)
    }
    
    private func renderTabAboutView() -> some View {
        renderAboutView()
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
        }
        .accentColor(Color.primary)
    }
}

extension TabBarHomeScreen {
    private func renderHomeView() -> some View {
        return LazyAppRoute.tabBarHome(
            .home(router: router)
        ).buildView()
    }
    
    private func renderDetailInfoView() -> some View {
        return LazyAppRoute.tabBarHome(.detailInfo).buildView()
    }
    
    private func renderAboutView() -> some View {
        LazyAppRoute.tabBarHome(.about).buildView()
    }
}
