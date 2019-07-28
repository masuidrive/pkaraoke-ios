//
//  PresentationWindow.swift
//  PKaraoke
//
//  Created by Yuichiro MASUI on 2019/07/27.
//  Copyright © 2019 Yuichiro MASUI. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class PresentationWindowManager {
    static let shared = PresentationWindowManager()
    
    var window: UIWindow!
    var presentationView: PresentationView?
    
    private init() {
        print("OK1")
        NotificationCenter.default.addObserver(forName: UIScene.willConnectNotification, object: nil, queue: nil) { notification in
            let screens = UIScreen.screens
            if screens.count > 1 {
                self.initializeExternalScreen(externalScene: notification.object as! UIWindowScene)
            }
        }
    }
    
    func initializeExternalScreen(externalScene: UIWindowScene) {
        self.presentationView = PresentationView()
        self.window = UIWindow(frame: externalScene.screen.bounds)
        self.window.windowScene = externalScene
        self.window.rootViewController = UIHostingController(rootView: self.presentationView)
        self.window.isHidden = false
        self.window.makeKeyAndVisible()
    }
    
    func setData(data:PresentationData) {
        self.presentationView?.setData(data: data)
    }
}
