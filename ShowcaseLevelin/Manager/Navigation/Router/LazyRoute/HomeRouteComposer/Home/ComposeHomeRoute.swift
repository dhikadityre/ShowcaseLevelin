//
//  ComposeHomeRoute.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI
import SLHomePageModule

extension LazyViewBuilder {
    static func buildGameScreenView() -> AnyView {
        return AnyView(TabBarGameScreen())
    }
    
    static func buildMovieScreenView(with data: SLHomeEntity) -> AnyView {
        return AnyView(MovieScreen(data: data))
    }
}
