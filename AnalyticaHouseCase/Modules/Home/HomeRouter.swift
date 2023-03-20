//
//  HomeRouter.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

class HomeRouter: HomePresenterToRouter{
    var viewController: HomeViewController?
    
    func routeToDetails(viewModel: PokemonViewModel) {
        let viewController = DetailsConfigurator.createModule()
        viewController.pokemonViewModel = viewModel
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
