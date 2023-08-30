//
//  Graduation_ProjectApp.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/23.
//

import SwiftUI
import FirebaseCore

@main

struct GraduationProjectApp: App {


    @AppStorage("colorScheme") private var colorScheme: Bool = true

    init()
    {
        FirebaseApp.configure()
        // 執行移除 "colorScheme" 鍵的操作
        UserDefaults.standard.removeObject(forKey: "colorScheme")
    }

    var body: some Scene
    {
        WindowGroup
        {
            LoginView()
                .preferredColorScheme(self.colorScheme ? .light:.dark)
            //SwiftUIView()
            //SigninView()
            //SideView()
        }
    }
}
