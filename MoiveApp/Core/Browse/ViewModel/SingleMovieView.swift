//
//  SingleMovieView.swift
//  MoiveApp
//
//  Created by J C on 11/11/23.
//

import Foundation

class SingleMovieView: ObservableObject{
    @Published var movieDetails: MovieDetails?
    @Published var isLoading = true
    
    
    
    init(movieListType: String = "now_playing"){
       
    }
    
    func fetchMovieData(movieId: Int) {
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMmIwMzdkMTUxMTQwOTYyODgxOTg5M2FiMjIwYzdiMiIsInN1YiI6IjY0MWZkMzFhMjNiZTQ2MDA4MmIyM2E0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vvl519zmgv5hGyjFXcjX_AwnKRZMuTHyFfSoEsxmy0g"
        ]
        print("DEBUG what is the movie id \(movieId)")
        print("DEBUG whats going in my url https://api.themoviedb.org/3/movie/\(movieId)?language=en-US")
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/\(movieId)?append_to_response=credits&language=en-US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { (resdata, res, error) in
                   DispatchQueue.main.async {
                       if let error = error {
                           print("DEBUG: Error \(error.localizedDescription)")
                           self.isLoading = false
                           return
                       }

                       if let response = res as? HTTPURLResponse {
                           print("DEBUG: MovieDetails Response code \(response.statusCode)")
                       }

                       guard let data = resdata else {
                           self.isLoading = false
                           return
                       }
                       print("DEBUG MovieData did we get the data \(data)")

                       do {
                           let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
                           self.movieDetails = movieDetails
                           print(movieDetails)
                       } catch let DecodingError.dataCorrupted(context) {
                           print("Data corrupted: \(context)")
                       } catch let DecodingError.keyNotFound(key, context) {
                           print("Key '\(key)' not found: \(context.debugDescription)")
                           print("codingPath: \(context.codingPath)")
                       } catch let DecodingError.valueNotFound(value, context) {
                           print("Value '\(value)' not found: \(context.debugDescription)")
                           print("codingPath: \(context.codingPath)")
                       } catch let DecodingError.typeMismatch(type, context)  {
                           print("Type '\(type)' mismatch: \(context.debugDescription)")
                           print("codingPath: \(context.codingPath)")
                       } catch {
                           print("Error: \(error.localizedDescription)")
                       }

                       self.isLoading = false
                   }
               }.resume()
    }
}
