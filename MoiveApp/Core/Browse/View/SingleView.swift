//
//  SingleView.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI
import Kingfisher


struct SingleView: View {
    let id: Int
    @StateObject var viewsingleModel: SingleMovieView
    
//    let genres = ["comedy", "drama", "romance"]
    
    init(movieId: Int) {
           self.id = movieId
        self._viewsingleModel = StateObject(wrappedValue: SingleMovieView())
       }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    VStack {
                        ZStack{
                            if let backdrop = viewsingleModel.movieDetails?.backdropPath {
                                KFImage(URL(string: ("https://image.tmdb.org/t/p/original/\(backdrop)")))
                                    .resizable()
                                    .scaledToFit()
                                    .ignoresSafeArea()
                                
                                
                                Rectangle()
                                    .fill(Color.black)
                                    .opacity(0.4)
                                
                            }
                            HStack{
                                KFImage(URL(string: ("https://image.tmdb.org/t/p/original/\(viewsingleModel.movieDetails?.posterPath ?? "")")))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                
                                // info
                                VStack(alignment: .leading){
                                    HStack{
                                        Text(viewsingleModel.movieDetails?.title ?? "not working")
                                        
                                    }
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    
                                    HStack{
                                        Text(viewsingleModel.movieDetails?.releaseDate ?? "not found")
                                        Text("\(viewsingleModel.movieDetails?.runtime ?? 0) minutes")
                                        
                                    }
                                    .font(.subheadline)
                                    HStack{
                                        if let generes = viewsingleModel.movieDetails?.genres {
                                            ForEach(generes) { genre in
                                                Text("\(genre.name)")
                                            }
                                        }
                                        
                                    }
                                    
                                }
                                
                                Spacer()
                                
                            }
                            .padding(.leading)
                        }
                        
                        
                        // overview
                        VStack(alignment: .leading){
                            Text("Overview")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            DividerGrade(colors: [Color("darkGrade"), Color("lightGrade")])
                            
                            Text(viewsingleModel.movieDetails?.overview ?? "not found")
                                .font(.subheadline)
                        }
                        .padding(.vertical)
                        .padding(.leading)
                        
                        
                        
                        // movie info
                        VStack(alignment: .leading){
                            Text("Info")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            DividerGrade(colors: [Color("darkGrade"), Color("lightGrade")])
                            
                            VStack{
                                
                            }
                        }
                        .padding(.vertical)
                        .padding(.leading)
                        
                        // cast
                        VStack(alignment: .leading){
                            Text("Cast")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            DividerGrade(colors: [Color("darkGrade"), Color("lightGrade")])
                            
                            ScrollView(.horizontal){
                                HStack{
                                    if let casts = viewsingleModel.movieDetails?.credits.cast {
                                        ForEach(casts) { cast in
                                            VStack{
                                                KFImage(URL(string: ("https://image.tmdb.org/t/p/original\(cast.profilePath ?? "")")))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 150)
                                                    .clipped()
                                                
                                                Text(cast.name)
                                                    .frame(width: 100)
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                                
                                                
                                                Text(cast.character )
                                                    .font(.caption)
                                                    .frame(width: 100)
                                            }
                                            
                                            
                                            
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                        .padding(.leading)
                        
                    }
                    
                    .onAppear {
                        viewsingleModel.fetchMovieData(movieId: id)
                    }
                    
                }
            }
            .navigationTitle(viewsingleModel.movieDetails?.title ?? "")
            .background(Color.black)
            
        }
        .foregroundStyle(Color.white)
    }
    
}

//#Preview {
//    SingleView(id: 2323, viewsingleModel: Movie)
//}
