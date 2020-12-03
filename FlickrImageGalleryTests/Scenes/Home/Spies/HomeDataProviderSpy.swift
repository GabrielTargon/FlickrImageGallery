//
//  HomeDataProviderSpy.swift
//  FlickrImageGalleryTests
//
//  Created by Gabriel Targon on 03/12/20.
//

@testable import FlickrImageGallery

enum HomeWorkerSpyResultType {
    case success
    case failure
}

class HomeDataProviderSpy {
    var resultType = HomeWorkerSpyResultType.success
}
