//
//  DashboardGameScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

import SwiftUI

struct DashboardGameScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Dashboard Game Screen")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .navigationTitle("Dashboard Game")
        .navigationBarTitleDisplayMode(.inline)
    }
}
