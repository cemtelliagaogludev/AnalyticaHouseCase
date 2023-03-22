//
//  DetailsProtocols.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

protocol DetailsViewToPresenter{
    var router: DetailsPresenterToRouter?{ get set }
    var view: DetailsPresenterToView? { get set }
    
    func notifyViewDidLoad()
}

protocol DetailsPresenterToView{
    func setupView()
}

protocol DetailsPresenterToRouter{
    var viewController: DetailsViewController?{ get set }
}
