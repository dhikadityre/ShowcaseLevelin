//
//  MainConfiguration.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 16/07/25.
//

import Foundation

public struct AppConfiguration {
    static var BUNDLE_ID: String {
        Bundle.main.bundleIdentifier ?? ""
    }
    static var FLAVOR: String {
        Bundle.main.object(forInfoDictionaryKey: "FLAVOR") as? String ?? ""
    }
    static var FIREBASE_CONFIG_PLIST_PATH: String {
        let fileName = Bundle.main.object(forInfoDictionaryKey: "FIREBASE_CONFIG_PLIST_NAME") as? String ?? ""
        return Bundle.main.path(forResource: fileName, ofType: "plist") ?? ""
    }
}
