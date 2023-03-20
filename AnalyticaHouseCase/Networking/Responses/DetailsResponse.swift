//
//  DetailsResponse.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

public struct DetailsResponse: Codable{
    let abilities: [Abilities]
    let sprites: Sprite
}
public struct Sprite: Codable{
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
    }
}
public struct Abilities: Codable{
    let ability: Ability
}
public struct Ability: Codable{
    let name: String
}
