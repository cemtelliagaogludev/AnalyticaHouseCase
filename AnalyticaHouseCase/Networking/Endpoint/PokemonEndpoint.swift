//
//  PokemonEndpoint.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

public enum PokemonEndpoint {
    case all
}

extension PokemonEndpoint: Endpoint {
    public var queryItems: [URLQueryItem]? {
        return nil
    }
    
    public var path: String {
        return "/api/v2/pokemon"
    }
    
    public var method: RequestMethod {
        return .get
    }
    
    public var body: [String : String]? {
        return nil
    }

    public var header: [String: String]? {
        return nil
    }
}
