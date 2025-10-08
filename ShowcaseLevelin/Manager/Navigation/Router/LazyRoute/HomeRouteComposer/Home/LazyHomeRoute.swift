//
//  LazyHomeRoute.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI
import SLHomePageModule

enum LazyHomeRoute: LazyRoute {
    case home
    case gameScreen
    case movieScreen(data: SLHomeEntity)
    
    var identifier: String {
        switch self {
        case .home:
            return "home"
        case .gameScreen:
            return "gameScreen"
        case .movieScreen:
            return "movieScreen"
        }
    }
    
    var title: String {
        switch self {
        case .home: 
            return "Home"
        case .gameScreen: 
            return "Game Screen"
        case .movieScreen: 
            return "Movie Screen"
        }
    }
    
    var icon: String {
        switch self {
        case .home: 
            return "house"
        case .gameScreen: 
            return "gamecontroller"
        case .movieScreen: 
            return "tv"
        }
    }
    
    @MainActor
    func buildView() -> AnyView {
        switch self {
        case .home:
            return AnyView(EmptyView())
        case .gameScreen:
            return LazyViewBuilder.buildGameScreenView()
        case .movieScreen(let data):
            return LazyViewBuilder.buildMovieScreenView(with: data)
        }
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        if case .movieScreen(let data) = self {
            hasher.combine(data.title)
        }
    }
    
    // MARK: - Equatable
    static func == (lhs: LazyHomeRoute, rhs: LazyHomeRoute) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home),
            (.gameScreen, .gameScreen):
            return true
        case (.movieScreen(let lhsData), .movieScreen(let rhsData)):
            return lhsData.title == rhsData.title
        default:
            return false
        }
    }
}
