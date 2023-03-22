//
//  HomePresenter.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

class HomePresenter: HomeViewToPresenter{
    
    var interactor: HomePresenterToInteractor?
    var router: HomePresenterToRouter?
    var view: HomePresenterToView?
    
    var pokemonViewModels: [PokemonViewModel]?
    
    func notifyViewDidLoad() {
        view?.setupView()
        interactor?.loadPokemons()
    }
    func didSelectRow(at index: Int) {
        guard let pokemonViewModel = self.pokemonViewModels?[index] else{ return }
        router?.routeToDetails(viewModel: pokemonViewModel)
    }
}

//MARK: - InteractorToPresenter
extension HomePresenter: HomeInteractorToPresenter{
    
    func loadedPokemonsSuccessfully(pokemons: [Pokemon]) {
        
        var pokemonViewModels = [PokemonViewModel]()
        let group = DispatchGroup()
        
        for pokemon in pokemons {
            group.enter()
            self.interactor?.loadDetails(for: pokemon, completion: { result in
                
                switch result{
                case .success(let detailsResponse):
                    let viewModel = PokemonViewModel(name: pokemon.name ?? "",
                                                     imageURL: detailsResponse.sprites.frontDefault,
                                                     abilities: detailsResponse.abilities)
                    
                    pokemonViewModels.append(viewModel)
                    
                case .failure(let error):
                    self.view?.displayErrorMessage(error.customMessage)
                }
                group.leave()
            })
            
        }
        group.notify(queue: .main){
            self.pokemonViewModels = pokemonViewModels
            guard let viewModels = self.pokemonViewModels else{ return }
            self.view?.displayViewModels(viewModels: viewModels)
        }
    }
    
    func requestFailedWithError(errorMessage: String) {
        view?.displayErrorMessage(errorMessage)
    }
}
