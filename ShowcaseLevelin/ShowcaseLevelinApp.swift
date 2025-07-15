//
//  ShowcaseLevelinApp.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 30/06/25.
//

import SwiftUI
import SLHomePageModule
import CoreFirebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//            FirebaseFactoryManager.shared.initialize()
            FirebaseFactoryManager.shared.initialize()
        return true
    }
}

@main
struct ShowcaseLevelinApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let environment = SLConfiguration.load()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SLHomeFactory.makeHomeView(environment: environment)
        }
    }
}
