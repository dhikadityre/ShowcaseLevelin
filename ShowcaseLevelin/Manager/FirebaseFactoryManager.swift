//
//  FirebaseFactoryManager.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 14/07/25.
//

import CoreFirebase
import Foundation

final class FirebaseFactoryManager {
    static var shared = FirebaseFactoryManager()
    
    func initialize() {
        guard
            let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: Any],
            let googleAppID = dict["GOOGLE_APP_ID"] as? String,
            let gcmSenderID = dict["GCM_SENDER_ID"] as? String
        else {
            return
        }

        let config = FirebaseAppConfiguration(
            googleAppID: googleAppID,
            gcmSenderID: gcmSenderID,
            apiKey: dict["API_KEY"] as? String ?? "",
            projectID: dict["PROJECT_ID"] as? String ?? "",
            bundleID: dict["BUNDLE_ID"] as? String ?? "",
            clientID: dict["CLIENT_ID"] as? String ?? "",
            trackingID: dict["TRACKING_ID"] as? String ?? "",
            databaseURL: dict["DATABASE_URL"] as? String ?? "",
            storageBucket: dict["STORAGE_BUCKET"] as? String ?? ""
        )

        FirebaseManagers.initialize(with: config)
    }
}
