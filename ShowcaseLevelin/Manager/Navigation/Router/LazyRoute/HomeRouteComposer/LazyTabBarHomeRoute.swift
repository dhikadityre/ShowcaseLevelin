//
//  LazyTabBarHomeRoute.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

enum LazyTabBarHomeRoute: LazyRoute {
    case home(router: AppRouter)
    case detailInfo
    case about
    
    var identifier: String {
        switch self {
        case .home:
            return "home"
        case .detailInfo:
            return "detailInfo"
        case .about:
            return "about"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .detailInfo:
            return "Detail Info"
        case .about:
            return "About"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .detailInfo:
            return "info.circle"
        case .about:
            return "person"
        }
    }
    
    @MainActor
    func buildView() -> AnyView {
        switch self {
        case let .home(router):
            return LazyViewBuilder.buildHomeView(router: router)
        case .detailInfo:
            return LazyViewBuilder.buildDetailInfoView()
        case .about:
            return LazyViewBuilder.buildAboutView()
        }
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    // MARK: - Equatable
    static func == (lhs: LazyTabBarHomeRoute, rhs: LazyTabBarHomeRoute) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
