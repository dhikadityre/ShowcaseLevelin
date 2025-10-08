//
//  TabBarGameScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

import SwiftUI

struct TabBarGameScreen: View {
    @State private var isReady = false
    @State private var selectedtab: TabGameIdentifier = .dashboard
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        render()
            .withNavigationDebugging()
    }
    
    private func renderDashboardGameView() -> some View {
        DashboardGameScreen()
    }
    
    private func renderTabDashboardView() -> some View {
        renderDashboardGameView()
            .tabItem {
                Label(TabGameIdentifier.dashboard.rawValue, systemImage: TabGameIdentifier.dashboard.toIconSystemName())
            }
            .tag(TabGameIdentifier.dashboard)
    }
    
    private func renderTabFavouriteInfoView() -> some View {
        FavouriteGameScreen()
            .tabItem {
                Label(TabGameIdentifier.favourite.rawValue, systemImage: TabGameIdentifier.favourite.toIconSystemName())
            }
            .tag(TabGameIdentifier.favourite)
    }
    
    private func render() -> some View {
        TabView(selection: $selectedtab) {
            renderTabDashboardView()
            renderTabFavouriteInfoView()
        }.accentColor(Color.primary)
    }
}
