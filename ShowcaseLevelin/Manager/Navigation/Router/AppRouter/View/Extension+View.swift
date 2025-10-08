//
//  Extension+View.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

extension View {
    func withRouter() -> some View {
        self.environmentObject(AppRouter())
    }
    
    func withNavigationDebugging() -> some View {
        self.modifier(RouterNavigationModifier())
    }
}
