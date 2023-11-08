//
//  MoviesApiManager.swift
//  MoviesListingApp
//
//  Created by chvck on 8.11.2023.
//

import Foundation


class APIManager {
    
    func fetchMovieData(forTitle title: String, completion: @escaping (Result<Movie, Error>) -> Void) {

        let apiKey = "2274adee"
        let urlString = "http://www.omdbapi.com/?i=tt3896198&apikey=2274adee"

    
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError()))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError()))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Movie.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



