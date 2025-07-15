//
//  ContentView.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/06/25.
//

import SwiftUI
import SLHomePageModule

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            SLHomePageModule.HomepageModule.hello()
        }
    }
}

#Preview {
    ContentView()
}
