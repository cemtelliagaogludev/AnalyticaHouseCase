//
//  DetailsConfigurator.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class DetailsConfigurator{
    static func createModule() -> DetailsViewController{
        let viewController = DetailsViewController()
        let presenter = DetailsPresenter()
        let router = DetailsRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        
        return viewController
    }
}
