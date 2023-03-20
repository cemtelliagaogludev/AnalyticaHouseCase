//
//  HomeInteractor.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

class HomeInteractor: HomePresenterToInteractor, HTTPClient{
    
    var pokemons: [Pokemon]?
    
    var presenter: HomeInteractorToPresenter?
    
    func loadDetails(for pokemon: Pokemon, completion: @escaping((Result<DetailsResponse, RequestError>)) -> ()) {
        self.sendRequest(withURL: URL(string: pokemon.url)!, responseModel: DetailsResponse.self) { result in
            switch result{
            case .success(let detailsResponse):
                completion(.success(detailsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadPokemons() {
        sendRequest(endpoint: PokemonEndpoint.all, responseModel: PokemonResponse.self) { result in
            switch result{
            case .success(let pokemonsResponse):
                self.pokemons = pokemonsResponse.results
                guard let pokemons = self.pokemons else{ return }
                self.presenter?.loadedPokemonsSuccessfully(pokemons: pokemons)
            case .failure(let error):
                self.presenter?.requestFailedWithError(errorMessage: error.customMessage)
            }
        }
    }
}
