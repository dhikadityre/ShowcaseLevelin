//
//  ShowcaseLevelinApp.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/06/25.
//

import SwiftUI
import SLHomePageModule
import CoreFirebase
import SLCoreEnvironment
import AlgoreadMeCoreLogger

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseFactoryManager.shared.initialize()
        FirebaseNotificationManager.shared.setupNotification()
        RefreshTokenFactory.saveAndSeedToken(accessToken: "", refreshToken: "")
        RefreshTokenFactory.serviceConfigure(phoneNumber: "0878222222")
        return true
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        print("[*] deviceToken", deviceToken)
        FirebaseNotificationManager.shared.setApnsTokenOnClient(with: deviceToken)
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        // AppLogger.log(level: .warning, message: "❌ Gagal register APNs: \(error)")
    }
}

@main
struct ShowcaseLevelinApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            AppInitializeScreen()
        }
    }
}
