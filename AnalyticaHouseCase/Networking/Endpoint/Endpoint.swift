//
//  Endpoint.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    public var scheme: String {
        return "http"
    }

    public var host: String {
        return "pokeapi.co"
    }
}
