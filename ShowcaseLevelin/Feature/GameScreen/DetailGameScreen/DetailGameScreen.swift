//
//  DetailGameScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

import SwiftUI

struct DetailGameScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Detail Game Screen")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .navigationTitle("Detail Game")
        .navigationBarTitleDisplayMode(.inline)
    }
}
