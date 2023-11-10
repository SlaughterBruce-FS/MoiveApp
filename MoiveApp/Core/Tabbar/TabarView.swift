//
//  TabView.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI

struct TabarView: View {
    var body: some View {
        TabView{
            
            BrowseView()
                .tabItem {
                    Label("Movies", systemImage: "movieclapper.fill")
                }
                
            
            TvBrowseView()
                .tabItem {
                    Label("TV Shows", systemImage: "tv.fill")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("favorites", systemImage: "house")
                }
            
           SearchMovieView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
        }
        .tint(Color("darkGrade"))
        .foregroundStyle(.white)
    }
}

#Preview {
    TabarView()
}
