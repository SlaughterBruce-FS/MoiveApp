//
//  MovieRow.swift
//  MoiveApp
//
//  Created by J C on 11/10/23.
//

import SwiftUI


struct MovieRow: View {
    @StateObject var viewModel: MovieViewModel
    let sectionTitle: String
    var body: some View {
        VStack{
            HStack{
                Text(sectionTitle)
                    .fontWeight(.semibold)
                Spacer()
                
                NavigationLink {
                    MovieGrid(viewModel: viewModel)
                } label: {
                    Text("All")
                }
            }
            .padding(.trailing)
            
            
            DividerGrade(colors: [Color("darkGrade"), Color("lightGrade")])
                .padding(.bottom)
            
        ScrollView(.horizontal){
          
                HStack{
                    ForEach(viewModel.movies) { movie in
                  
                        MovieCell(movie: movie)
                    }
                        
                }
            }
        
        }
        .padding(.leading)
    }
}

#Preview {
    MovieRow(viewModel: MovieViewModel(), sectionTitle: "now playing")
}
