//
//  UserDefaultsTokenStore.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 11/08/25.
//

import Foundation
import AlgoreadMePackageData

actor UserDefaultsTokenStore: TokenStore {
    private let defaults: UserDefaults
    private let accessKey = "com.myapp.token.access"
    private let refreshKey = "com.myapp.token.refresh"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func readAccessToken() -> String? {
        defaults.string(forKey: accessKey)
    }
    
    func readRefreshToken() -> String? {
        defaults.string(forKey: refreshKey)
    }
    
    func write(accessToken: String?, refreshToken: String?) {
        if let accessToken {
            defaults.set(accessToken, forKey: accessKey)
        } else {
            defaults.removeObject(forKey: accessKey)
        }
        
        if let refreshToken {
            defaults.set(refreshToken, forKey: refreshKey)
        } else {
            defaults.removeObject(forKey: refreshKey)
        }
        // defaults.synchronize() // not needed anymore
    }
}
