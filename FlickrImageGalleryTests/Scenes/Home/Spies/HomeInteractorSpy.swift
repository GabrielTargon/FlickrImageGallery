//
//  HomeInteractorSpy.swift
//  FlickrImageGalleryTests
//
//  Created by Gabriel Targon on 03/12/20.
//

import XCTest
@testable import FlickrImageGallery

class HomeInteractorSpy {
    var loadImagesArrayCalled = false
    var loadImageCalled = false
}

extension HomeInteractorSpy: HomeBusinessLogic {
    func loadImagesArray(request: Home.ImagesArray.Request) {
        loadImagesArrayCalled = true
    }
    
    func loadImage(request: Home.Image.Request, completion: @escaping (UIImage) -> Void) {
        loadImageCalled = true
    }
}
