//
//  ContentView.swift
//  Liko_TA
//
//  Created by Liko Setiawan on 17/03/23.
//

import SwiftUI
import FirebaseCore


//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

struct ContentView: View {
    
//    // register app delegate for Firebase setup
//      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("halo, github  dan firebase bisa please!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

