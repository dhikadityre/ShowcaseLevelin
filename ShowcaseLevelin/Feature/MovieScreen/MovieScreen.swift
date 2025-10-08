//
//  MovieScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

import SwiftUI
import SLHomePageModule

struct MovieScreen: View {
    let data: SLHomeEntity?
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Movie Screen")
                .font(.title)
                .fontWeight(.bold)
            
            Text(data?.title ?? "No Title")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(data?.description ?? "No Description")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // Navigation buttons
            VStack(spacing: 16) {
                NavigationBackButton()
                NavigationRootButton()
            }
        }
        .padding()
        .navigationTitle("Movie Details")
        .navigationBarTitleDisplayMode(.inline)
        .withNavigationDebugging()
    }
}
