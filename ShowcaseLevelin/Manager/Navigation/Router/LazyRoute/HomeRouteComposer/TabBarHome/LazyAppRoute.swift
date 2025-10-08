//
//  LazyAppRoute.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

enum LazyAppRoute: Hashable {
    case home(LazyHomeRoute)
    case tabBarHome(LazyTabBarHomeRoute)
    
    var identifier: String {
        switch self {
        case .home(let route):
            return "home.\(route.identifier)"
        case .tabBarHome(let route):
            return "tabBarHome.\(route.identifier)"
        }
    }
    
    var title: String {
        switch self {
        case .home(let route):
            return route.title
        case .tabBarHome(let route):
            return route.title
        }
    }
    
    @MainActor
    func buildView() -> AnyView {
        switch self {
        case .home(let route):
            return route.buildView()
        case .tabBarHome(let route):
            return route.buildView()
        }
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    // MARK: - Equatable
    static func == (lhs: LazyAppRoute, rhs: LazyAppRoute) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
