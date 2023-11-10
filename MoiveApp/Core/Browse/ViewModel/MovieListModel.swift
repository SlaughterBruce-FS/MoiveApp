//
//  MovieListModel.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import Foundation

class MovieListModel: ObservableObject{
    @Published var movies = [Movie]()
    @Published var isLoading = true
  
    init(movieListType: Int){
        fetchMovieData(movieListType: movieListType)
    }
    
    func fetchMovieData(movieListType: Int) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMmIwMzdkMTUxMTQwOTYyODgxOTg5M2FiMjIwYzdiMiIsInN1YiI6IjY0MWZkMzFhMjNiZTQ2MDA4MmIyM2E0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vvl519zmgv5hGyjFXcjX_AwnKRZMuTHyFfSoEsxmy0g"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(movieListType)/lists?language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (resdata, res, error) -> Void in
            if let error = error{
                print("DEBUG: Error\(error.localizedDescription)")
                return
            }
            
            if let response = res as? HTTPURLResponse {
                print("DEBUG: Response code\(response.statusCode) ")
            }
            
            guard let data = resdata else { return }
            
            print(data)
            
            do{
             
                
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                          DispatchQueue.main.async {
                              self.movies = movieResponse.results
                              self.isLoading = false
                          }
             
            } catch {
                print("DEBUG: Failed to decode with error: \(error.localizedDescription)")
            }
            
            
        }).resume()
    }
}
