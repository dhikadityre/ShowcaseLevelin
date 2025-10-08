//
//  FavouriteGameScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 28/09/25.
//

import SwiftUI

struct FavouriteGameScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Favourite Game Screen")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
        .navigationTitle("Favourite Game")
        .navigationBarTitleDisplayMode(.inline)
    }
}
