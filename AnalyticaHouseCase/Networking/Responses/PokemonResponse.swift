//
//  PokemonResponse.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

public struct PokemonResponse: Codable{
    let results: [Pokemon]
}

public struct Pokemon: Codable{
    let name: String
    let url: String
}
