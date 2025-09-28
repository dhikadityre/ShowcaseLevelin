//
//  EnvironmentFlavorManager.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 16/07/25.
//

import Foundation
import SLCoreEnvironment

public final class EnvironmentFlavorManager {
    public static let shared = EnvironmentFlavorManager()
    
    public let flavor: EnvironmentFlavor

    private init() {
        let rawFlavor = AppConfiguration.FLAVOR
        self.flavor = EnvironmentFlavor(rawValue: rawFlavor) ?? .development
        setLogger()
    }
    
    private func setLogger() {
        ClientAppLoggerVisibility.configure(
            isLoggingEnabled: flavor != .production,
            minimumLogLevel: flavor == .production
                ? .critical
                : .debug
        )
    }
}
