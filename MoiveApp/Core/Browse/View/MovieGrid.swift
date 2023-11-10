//
//  MovieGrid.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI

struct MovieGrid: View {
    @StateObject var viewModel: MovieViewModel
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2),
        .init(.flexible(), spacing: 2)
    ]
    
    private let imageDemension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItems, spacing: 2) {
                ForEach(viewModel.movies) { movie in
                    MovieCell(movie: movie)
                    
                }
            }
            
        }
        .background(.black)
        
    }
}

#Preview {
    MovieGrid(viewModel: MovieViewModel())
}
