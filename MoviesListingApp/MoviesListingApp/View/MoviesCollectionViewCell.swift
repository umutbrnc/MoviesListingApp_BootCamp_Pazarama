//
//  MoviesCollectionViewCell.swift
//  MoviesListingApp
//
//  Created by chvck on 8.11.2023.
//


import Foundation
import UIKit


class MoviesCollectionViewCell : UICollectionViewCell {
    
    let moviesImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.backgroundColor = UIColor.white
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
      }()
      
      
      let titleLabel: UILabel = {
          let label = UILabel()
          label.textColor = UIColor.white
          label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      
      let yearLabel: UILabel = {
          let label = UILabel()
          label.textColor = UIColor.white
          label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
    
       func addViews(){
           
           backgroundColor = UIColor.white
           
           addSubview(moviesImageView)
           addSubview(titleLabel)
           addSubview(yearLabel)
           
           moviesImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
           moviesImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
           moviesImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
           moviesImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
           
           titleLabel.topAnchor.constraint(equalTo: moviesImageView.bottomAnchor, constant: 10).isActive = true
           titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
           titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
           titleLabel.textAlignment = .center
           
           yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
           yearLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
           yearLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
           yearLabel.textAlignment = .center
           
       }
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            addViews()
        }
 

       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    
   }


