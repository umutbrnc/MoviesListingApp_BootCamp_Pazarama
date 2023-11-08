//
//  MoviesApiManager.swift
//  MoviesListingApp
//
//  Created by chvck on 8.11.2023.
//

import Foundation

protocol MoviesViewModelOutput: AnyObject {
    func onMoviesFetched(movies: [Movie])
    func onError(_ error: Error)
}

class MoviesViewModel {
    
    private let movieService: APIManager
    weak var output: MoviesViewModelOutput?
    
    init(movieService: APIManager, output: MoviesViewModelOutput? = nil) {
        self.movieService = movieService
        self.output = output
    }
    
    func fetchMovies(forTitle title: String) {
        movieService.fetchMovieData(forTitle: title) { [weak self] (result: Result<Movie, Error>) in
            switch result {
            case .success(let movie):
                self?.output?.onMoviesFetched(movies: [movie])
            case .failure(let error):
                self?.output?.onError(error)
            }
        }
    }
}
