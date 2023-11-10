//
//  LaunchScreenView.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var firstPhasIsAnimating: Bool = false
    @State private var secondPhasIsAnimating: Bool = false
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            background
             logo
        }
        .onReceive(timer) { input in
            switch launchScreenManager.state {
            case .first:
                withAnimation(.spring()){
                    firstPhasIsAnimating.toggle()
                }
            case .second:
                withAnimation(.spring()){
                    secondPhasIsAnimating.toggle()
                }
            default: break
            }
        }
        .opacity(secondPhasIsAnimating ? 0 : 1)
    }
}

#Preview {
    LaunchScreenView()
        .environmentObject(LaunchScreenManager())
}

private extension LaunchScreenView {
    var background: some View {
        Color("launchbg")
            .ignoresSafeArea()
    }
    
    
    var logo: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .scaleEffect(firstPhasIsAnimating ? 0.6 : 1 )
            .scaleEffect(secondPhasIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
    }
}

