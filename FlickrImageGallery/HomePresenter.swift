//
//  HomePresenter.swift
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

protocol HomePresentationLogic {
  func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresentationLogic {
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Home.Something.Response) {
    let viewModel = Home.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
