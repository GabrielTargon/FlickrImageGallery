//
//  HomeWorkerSpy.swift
//  FlickrImageGalleryTests
//
//  Created by Gabriel Targon on 03/12/20.
//

import XCTest
@testable import FlickrImageGallery

class HomeWorkerSpy {
    var resultType = HomeWorkerSpyResultType.success
    var getFlickrImagesCalled = false
    var getImageCalled = false
}

extension HomeWorkerSpy: HomeWorkerLogic {
    func getFlickrImages(completion: @escaping (Result<Home.ImagesArray.Response, ServiceError>) -> Void) {
        switch resultType {
        case .success:
            getFlickrImagesCalled = true
            completion(.success(Home.ImagesArray.Response(images: HomeSeeds.imagesArray)))
        case .failure:
            completion(.failure(ServiceError.systemUnavailable))
        }
    }
    
    func getImage(photo: String, completion: @escaping (Result<Home.Image.Response, ServiceError>) -> Void) {
        switch resultType {
        case .success:
            getImageCalled = true
            completion(.success(Home.Image.Response(imageURL: HomeSeeds.image)))
        case .failure:
            completion(.failure(ServiceError.systemUnavailable))
        }
    }
    
    
}
