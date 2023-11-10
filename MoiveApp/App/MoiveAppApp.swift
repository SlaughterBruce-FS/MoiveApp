//
//  MoiveAppApp.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI

@main
struct MoiveAppApp: App {
    @StateObject var launchScreenManager = LaunchScreenManager()
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContentView()

                if launchScreenManager.state != .completed{
                    LaunchScreenView()
                }
                
            }
            .environmentObject(launchScreenManager)
        }
    }
}
