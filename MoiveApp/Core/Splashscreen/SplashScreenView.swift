//
//  SplashScreenView.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State var animate: Bool = false

    var body: some View {
        VStack{
            ZStack{
               // Content
                ZStack{
                    ContentView()
                }
                
                // Spalsh
                ZStack{
                    Color("launchbg")
                        .ignoresSafeArea(.all)
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 85)
                        .scaleEffect(animate ? 3 : 1)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: 2)
                      

                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
