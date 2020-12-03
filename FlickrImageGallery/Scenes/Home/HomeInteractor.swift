//
//  HomeInteractor.swift
//  FlickrImageGallery
//
//  Created by Gabriel Targon on 29/11/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic {
    func loadImagesArray(request: Home.ImagesArray.Request)
    func loadImage(request: Home.Image.Request, completion: @escaping (UIImage) -> Void)
}

protocol HomeDataStore {
    //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorkerLogic
    
    init(presenter: HomePresentationLogic, worker: HomeWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Load images
    func loadImagesArray(request: Home.ImagesArray.Request) {
        worker.getFlickrImages { (result) in
            switch result {
            case .success(let response):
                self.presenter?.presentImagesArray(response: response)
            case .failure(_):
                self.presenter?.presentServiceError()
            }
        }
    }
    
    func loadImage(request: Home.Image.Request, completion: @escaping (UIImage) -> Void) {
        worker.getImage(photo: request.imageURL) { (result) in
            switch result {
            case .success(let response):
                completion(response.imageURL)
            case .failure(_):
                guard let imageDefault = UIImage(named: "imageDefault") else { return }
                completion(imageDefault)
            }
        }
        
    }
    
}
