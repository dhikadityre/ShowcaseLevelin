//
//  NavigationBackButton.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 08/10/25.
//

import SwiftUI

struct NavigationBackButton: View {
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        Button(action: {
            router.navigateBack()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
        .disabled(!router.canNavigateBack())
        .buttonStyle(RouterNavigationButtonStyle(isEnabled: router.canNavigateBack()))
    }
}
