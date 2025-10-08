//
//  NavigationRootButton.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

struct NavigationRootButton: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        Button(action: {
            router.navigateToRoot()
        }) {
            HStack {
                Image(systemName: "house")
                Text("Home")
            }
        }
        .disabled(router.isAtRoot())
        .buttonStyle(RouterNavigationButtonStyle(isEnabled: !router.isAtRoot()))
    }
}
