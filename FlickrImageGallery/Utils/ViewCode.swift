//
//  ViewCode.swift
//  FlickrImageGallery
//
//  Created by Gabriel Targon on 29/11/20.
//

import Foundation

protocol ViewCode {
    
    func setupHierarchy()
    
    func setupConstraints()
    
    func setupConfigurations()
    
}

extension ViewCode {
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
}
