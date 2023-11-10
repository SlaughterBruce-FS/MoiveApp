//
//  BrowseView.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI

struct BrowseView: View {
   @State private var searchText = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    MovieRow(viewModel: MovieViewModel(movieListType: "now_playing"), sectionTitle: "Now Playing")
                    MovieRow(viewModel: MovieViewModel(movieListType: "upcoming"), sectionTitle: "Upcoming")
                    MovieRow(viewModel: MovieViewModel(movieListType: "popular"), sectionTitle: "Popular")
                    MovieRow(viewModel: MovieViewModel(movieListType: "top_rated"), sectionTitle: "Top Rated")
                    MovieRow(viewModel: MovieViewModel(movieListType: "28"), sectionTitle: "Action")
                }
            }
            .background(.black)
            .foregroundColor(.white)
            .navigationBarTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
        

    }
}

#Preview {
    BrowseView()
}
