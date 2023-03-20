//
//  DetailsConfigurator.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class DetailsConfigurator{
    static func createModule() -> DetailsViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController: DetailsViewController = storyboard.instantiateViewController(identifier: "DetailsViewController")
        let presenter = DetailsPresenter()
        let router = DetailsRouter()
        let interactor = DetailsInteractor()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
