//
//  SearchView.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import SwiftUI

struct SearchMovieView: View {

    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 2) {
                    ForEach(viewModel.movies) { movie in
                        MovieCell(movie: movie)
                    }
                }
            }
            .background(.black)
            .searchable(text: $searchText)
            .onChange(of: searchText) { oldValue, newValue in
                viewModel.fetchMovieData(searchText: newValue)
            }
        }
    }
}

#Preview {
    SearchMovieView()
}
