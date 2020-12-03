//
//  HomePhotoCollectionViewCell.swift
//  FlickrImageGallery
//
//  Created by Gabriel Targon on 29/11/20.
//

import UIKit

class HomePhotoCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
}

extension HomePhotoCollectionViewCell: ViewCode {
    func setupHierarchy() {
        addSubview(imageView)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupConfigurations() {
        activityIndicator.startAnimating()
    }
}
