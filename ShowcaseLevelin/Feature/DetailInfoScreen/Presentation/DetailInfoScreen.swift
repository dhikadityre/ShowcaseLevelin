//
//  DetailInfoScreen.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/07/25.
//

import SwiftUI
import CoreFirebaseInterfaces

public struct DetailInfoScreen: View {
    @StateObject private var viewModel: DetailInfoScreenViewModel

    public init(viewModel: DetailInfoScreenViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack {
            Text("Detail Info!")
            List(viewModel.items) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                }
            }
            .task {
                await viewModel.fetch()
            }
        }
    }
}

