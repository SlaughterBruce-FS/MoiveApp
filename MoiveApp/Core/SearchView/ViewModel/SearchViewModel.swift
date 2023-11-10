//
//  SearchViewModel.swift
//  MoiveApp
//
//  Created by J C on 11/12/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var movies = [Movie]()
    @Published var isLoading = true
    
  
    init(searchText: String = "now_playing"){
        fetchMovieData(searchText: searchText)
    }
    
    func fetchMovieData(searchText: String) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMmIwMzdkMTUxMTQwOTYyODgxOTg5M2FiMjIwYzdiMiIsInN1YiI6IjY0MWZkMzFhMjNiZTQ2MDA4MmIyM2E0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vvl519zmgv5hGyjFXcjX_AwnKRZMuTHyFfSoEsxmy0g"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/search/multi?query=\(searchText)&include_adult=false&language=en-US&page=1")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        print("DEBUG THE URL IS \(request)")
        
        
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
             
            }     catch let DecodingError.dataCorrupted(context) {
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
            
            
        }).resume()
    }
}
