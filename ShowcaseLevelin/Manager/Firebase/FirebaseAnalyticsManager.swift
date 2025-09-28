//
//  FirebaseAnalyticsManager.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 17/07/25.
//

import CoreFirebase

final class FirebaseAnalyticsManager {
    static let shared = FirebaseAnalyticsManager()
    
    private(set) var analytics: AnalyticsService = AnalyticsService()
    
    private init() {}
}
