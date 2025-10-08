//
//  AppRouter+HomeScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SLHomePageModule

extension AppRouter {
    public func handleItemSelection(
        _ item: SLHomeEntity,
        index: Int
    ) {
        switch index {
        case 0:
            navigate(to: .home(.gameScreen))
        case 1:
            let movieRoute = LazyHomeRoute.movieScreen(data: item)
            navigate(to: .home(movieRoute))
        default:
            navigate(to: .home(.gameScreen))
        }
    }
}
