//
//  HomeRouter.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import UIKit

class HomeRouter: HomePresenterToRouter{
    var viewController: HomeViewController?
    
    func routeToDetails(viewModel: PokemonViewModel) {
        let viewController = DetailsConfigurator.createModule()
        viewController.pokemonViewModel = viewModel
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showAlert(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        DispatchQueue.main.async {
            self.viewController?.present(alert, animated: true)
        }
    }
}
