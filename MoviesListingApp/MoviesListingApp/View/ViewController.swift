//
//  ViewController.swift
//  MoviesListingApp
//
//  Created by chvck on 8.11.2023.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var movies = [Movie]()
    var moviesCollectionView: UICollectionView?
    
    var viewModel: MoviesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel = MoviesViewModel(movieService: APIManager(), output: self)
        viewModel.fetchMovies(forTitle: "yourMovieTitle")
    }
    
    private func setupUI() {
        self.navigationItem.title = "Movies App"
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 180, height: 160)
        
        moviesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        moviesCollectionView?.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "moviesCollectionCell")
        moviesCollectionView?.backgroundColor = .black
        
        view.addSubview(moviesCollectionView ?? UICollectionView())
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, MoviesViewModelOutput {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let moviesViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCollectionCell", for: indexPath) as! MoviesCollectionViewCell
        moviesViewCell.titleLabel.text = movies[indexPath.row].title
        moviesViewCell.yearLabel.text = movies[indexPath.row].year
        moviesViewCell.moviesImageView.image = UIImage(named: movies[indexPath.row].poster)
        return moviesViewCell
    }
    
    func onMoviesFetched(movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.moviesCollectionView?.reloadData()
        }
    }
    
    func onError(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

