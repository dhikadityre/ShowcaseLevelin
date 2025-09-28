//
//  ClientAppLoggerVisibility.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 07/08/25.
//

import AlgoreadMeCoreLogger

final class ClientAppLoggerVisibility: AppLoggerVisibility {
    let isLoggingEnabled: Bool
    let minimumLogLevel: LogLevel

    private static var _shared: ClientAppLoggerVisibility?
    
    /// Akses global ke instance
    static var shared: ClientAppLoggerVisibility {
        guard let instance = _shared else {
            fatalError("❌ ClientAppLoggerVisibility has not been initialized. Call `configure(...)` once before accessing `shared`.")
        }
        return instance
    }

    /// Konfigurasi awal yang hanya bisa dipanggil sekali
    static func configure(isLoggingEnabled: Bool, minimumLogLevel: LogLevel) {
        guard _shared == nil else {
            print("⚠️ ClientAppLoggerVisibility is already configured. Ignoring reconfiguration.")
            return
        }
        _shared = ClientAppLoggerVisibility(isLoggingEnabled: isLoggingEnabled, minimumLogLevel: minimumLogLevel)
    }

    private init(isLoggingEnabled: Bool, minimumLogLevel: LogLevel) {
        self.isLoggingEnabled = isLoggingEnabled
        self.minimumLogLevel = minimumLogLevel
    }
}
