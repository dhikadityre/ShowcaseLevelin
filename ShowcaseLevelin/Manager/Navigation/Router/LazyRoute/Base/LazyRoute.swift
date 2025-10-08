//
//  LazyRoute.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

protocol LazyRoute: Hashable {
    var identifier: String { get }
    var title: String { get }
    var icon: String { get }
    @MainActor func buildView() -> AnyView
}
