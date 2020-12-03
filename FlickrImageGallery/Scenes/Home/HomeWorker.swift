//
//  HomeWorker.swift
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
import Foundation

protocol HomeWorkerLogic: class {
    func getFlickrImages(completion: @escaping (Result<Home.ImagesArray.Response, ServiceError>) -> Void)
    func getImage(photo: String, completion: @escaping (Result<Home.Image.Response, ServiceError>) -> Void)
}

class HomeWorker: HomeWorkerLogic {
    
    // MARK: HomeWorkerLogic
    
    func getFlickrImages(completion: @escaping (Result<Home.ImagesArray.Response, ServiceError>) -> Void) {
        let request = NSMutableURLRequest(url: URL(string: FlickrConstants.Flickr.imagesArrayURL)!)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if error != nil {
                completion(.failure(ServiceError.custom(message: error.debugDescription)))
                return
            }
            
            let range = Range(uncheckedBounds: (14, data!.count - 1))
            let newData = data?.subdata(in: range)
            
            if let json = try? JSONSerialization.jsonObject(with: newData!) as? [String:Any],
               let photosMeta = json["photos"] as? [String:Any],
               let photos = photosMeta["photo"] as? [Any] {
                
                var flickrImages:[FlickrImage] = []
                
                for photo in photos {
                    
                    if let flickrImage = photo as? [String:Any],
                       let id = flickrImage["id"] as? String,
                       let secret = flickrImage["secret"] as? String,
                       let server = flickrImage["server"] as? String,
                       let farm = flickrImage["farm"] as? Int {
                        flickrImages.append(FlickrImage(id: id, secret: secret, server: server, farm: farm))
                    }
                }
                completion(.success(Home.ImagesArray.Response(images: flickrImages)))
                
            } else {
                completion(.failure(ServiceError.dataUnavailable))
            }
        }
        
        task.resume()
    }
    
    func getImage(photo: String, completion: @escaping (Result<Home.Image.Response, ServiceError>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: photo)!) { (data, response, error) in
            if error == nil {
                guard let image = UIImage(data: data! as Data) else { return }
                completion(.success(Home.Image.Response(imageURL: image)))
            } else {
                completion(.failure(ServiceError.dataUnavailable))
            }
        }.resume()
    }
    
}
