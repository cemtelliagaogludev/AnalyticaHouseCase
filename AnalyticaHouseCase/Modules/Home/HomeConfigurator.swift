//
//  HomeConfigurator.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class HomeConfigurator{
    
    static func createModule() -> HomeViewController{
        let viewController = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
