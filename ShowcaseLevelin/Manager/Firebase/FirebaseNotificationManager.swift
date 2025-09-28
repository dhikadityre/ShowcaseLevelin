//
//  FirebaseNotificationManager.swift
//  ShowcaseLevelin
//
//  Created by @algoreadme on 17/07/25.
//

import CoreFirebase
import UIKit

final class FirebaseNotificationManager {

    static let shared = FirebaseNotificationManager()

    private init() {}

    @MainActor func setupNotification() {
        /// Configuration Delegate
        NotificationService.shared.configure()

        /// Get permission from user
        NotificationService.shared.registerForRemoteNotifications()

        /// Assign token callback
        NotificationService.shared.onReceiveToken = { token in
            print("[*] 📦 Token diterima di MainApp: \(token)")

            /// Send token to server or save to UserDefault
            // MyTokenUploader.sendToServer(token)
        }

        /// Manual fetching (optional, for safety if needed)
        NotificationService.shared.getFCMToken()
    }
    
    @MainActor func setApnsTokenOnClient(with deviceToken: Data) {
        NotificationService.shared.setAPNsToken(deviceToken)
    }
}
