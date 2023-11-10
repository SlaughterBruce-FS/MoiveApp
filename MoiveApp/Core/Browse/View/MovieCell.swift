//
//  MovieCell.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    let movie: Movie
    @ObservedObject var viewModel = MovieViewModel()
   @ObservedObject var singleViewModel = SingleMovieView()
    
    private let imageDemension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        NavigationLink {
            
            SingleView(movieId: movie.id)
        } label: {
            VStack{
                if viewModel.isLoading {
                    ShimmerView()
                } else {
                    if let poster = movie.posterPath {
                        KFImage(URL(string: ("https://image.tmdb.org/t/p/original/\(String(describing: poster))")))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: imageDemension)
                            
                    }
        
                }
                
            }
        }

     
    }
}



//#Preview {
//    MovieCell(movie: <#Movie#>)
//}
