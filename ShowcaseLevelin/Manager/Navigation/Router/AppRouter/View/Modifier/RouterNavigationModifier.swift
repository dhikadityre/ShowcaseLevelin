//
//  RouterNavigationModifier.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

struct RouterNavigationModifier: ViewModifier {
    @EnvironmentObject var router: AppRouter
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                router.printNavigationState()
            }
    }
}
