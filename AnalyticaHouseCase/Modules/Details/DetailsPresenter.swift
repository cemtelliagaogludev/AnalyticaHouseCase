//
//  DetailsPresenter.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

class DetailsPresenter: DetailsViewToPresenter{
    var router: DetailsPresenterToRouter?
    var view: DetailsPresenterToView?
    
    func notifyViewDidLoad() {
        view?.setupView()
    }
}
