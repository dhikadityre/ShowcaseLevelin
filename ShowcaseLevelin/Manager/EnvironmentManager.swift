//
//  EnvironmentManager.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 16/07/25.
//

import Foundation
import SLCoreEnvironment

public final class EnvironmentManager: ObservableObject {
    public static let shared = EnvironmentManager()

    @Published public private(set) var current: EnvironmentConfiguration

    private init() {
        self.current = EnvironmentConfiguration.empty()
    }

    @MainActor
    public func loadAsync() async {
        let config = await SLConfiguration.loadAsync()
        self.current = config
    }
}
