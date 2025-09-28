//
//  FirebaseCrashlytics.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 17/07/25.
//

import CoreFirebase

final class FirebaseCrashlytics {
    static let shared = FirebaseCrashlytics()
    
    private(set) var crashlytics: CrashlyticsService = CrashlyticsService()
    
    private init() {}
}
