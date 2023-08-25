//
//  Graduation_ProjectApp.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI
import Firebase

@main

struct Graduation_ProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @AppStorage("colorScheme") private var colorScheme: Bool = true
    
    init()
    {
        // 執行移除 "colorScheme" 鍵的操作
        UserDefaults.standard.removeObject(forKey: "colorScheme")
    }
    var body: some Scene
    {
        WindowGroup
        {
            LoginView()
                .preferredColorScheme(self.colorScheme ? .light:.dark)
            //SigninView()
            //SideView()

        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        FirebaseApp.configure()
        return true
  }
}
