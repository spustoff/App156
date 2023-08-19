//
//  App156App.swift
//  App156
//
//  Created by Вячеслав on 8/7/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_hP5yjWmcMTXAat2ZNKJGJa2EpNSGRP")
        Amplitude.instance().initializeApiKey("3623913db110bf08fa657d5dc1d0b694")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App156App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
