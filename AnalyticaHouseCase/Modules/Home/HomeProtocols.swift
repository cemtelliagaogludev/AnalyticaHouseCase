//
//  HomeProtocols.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

protocol HomeViewToPresenter{
    var interactor: HomePresenterToInteractor? { get set }
    var router: HomePresenterToRouter?{ get set }
    var view: HomePresenterToView? { get set }
    
    func notifyViewDidLoad()
    func didSelectRow(at index: Int)
}

protocol HomePresenterToInteractor{
    var presenter: HomeInteractorToPresenter? { get set }
    
    func loadPokemons()
    func loadDetails(for pokemon: Pokemon, completion: @escaping((Result<DetailsResponse, RequestError>)) -> ())
}

protocol HomeInteractorToPresenter{
    func loadedPokemonsSuccessfully(pokemons: [Pokemon])
    func requestFailedWithError(errorMessage: String)
}

protocol HomePresenterToView{
    func setupView()
    func displayViewModels(viewModels: [PokemonViewModel])
    func displayErrorMessage(_ errorMessage: String)
}

protocol HomePresenterToRouter{
    var viewController: HomeViewController?{ get set }
    func routeToDetails(viewModel: PokemonViewModel)
}
