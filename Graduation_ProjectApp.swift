//
//  Graduation_ProjectApp.swift
//  Graduation_Project
//
//  Created by Mac on 2023/8/17.
//

import SwiftUI
@main

struct Graduation_ProjectApp: App {
    @AppStorage("colorScheme") private var colorScheme: Bool=false

    var body: some Scene {
        WindowGroup {
            LoginView()
                .preferredColorScheme(self.colorScheme ? .light:.dark)
            //SigninView()
            //SideView()
            
        }
    }
}
