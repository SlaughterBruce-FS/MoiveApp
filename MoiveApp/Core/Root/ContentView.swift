//
//  ContentView.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    var body: some View {
        TabarView()
            .onAppear{
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 5) {
                        launchScreenManager.dismiss()
                    }
            }
    }
}

#Preview {
    ContentView()
        .environmentObject(LaunchScreenManager())
}
