//
//  Liko_TAApp.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/03/23.
//

import SwiftUI
import FirebaseCore
//import FirebaseDatabase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
//    let databaseUrl = "https://liko-ta-be5f1-default-rtdb.asia-southeast1.firebasedatabase.app"
//    Database.database(url: databaseUrl).reference()
    return true
  }
}


@main
struct Liko_TAApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "hasShownOnboarding") {
                LoginPage()
            } else {
                OnboardingView()
                    .onAppear {
                        UserDefaults.standard.set(true, forKey: "hasShownOnboarding")
                    }
            }
        }
    }
}
