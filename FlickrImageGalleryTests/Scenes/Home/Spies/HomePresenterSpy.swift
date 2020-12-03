//
//  HomePresenterSpy.swift
//  FlickrImageGalleryTests
//
//  Created by Gabriel Targon on 03/12/20.
//

import XCTest
@testable import FlickrImageGallery

class HomePresenterSpy {
    var presentImagesArrayCalled = false
    var presentServiceErrorCalled = false
}

extension HomePresenterSpy: HomePresentationLogic {
    func presentImagesArray(response: Home.ImagesArray.Response) {
        presentImagesArrayCalled = true
    }
    
    func presentServiceError() {
        presentServiceErrorCalled = true
    }
}
