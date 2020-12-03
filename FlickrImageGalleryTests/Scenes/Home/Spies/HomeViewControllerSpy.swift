//
//  HomeViewControllerSpy.swift
//  FlickrImageGalleryTests
//
//  Created by Gabriel Targon on 03/12/20.
//

import XCTest
@testable import FlickrImageGallery

class HomeViewControllerSpy {
    var displayImagesCalled = false
    var displayServiceErrorAlertCalled = false
}

extension HomeViewControllerSpy: HomeDisplayLogic {
    func displayImages(viewModel: Home.ImagesArray.ViewModel) {
        displayImagesCalled = true
    }
    
    func displayServiceErrorAlert() {
        displayServiceErrorAlertCalled = true
    }
}
