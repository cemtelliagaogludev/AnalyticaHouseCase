//
//  HTTPClient.swift
//  AnalyticaHouseCase
//
//  Created by admin on 20.03.2023.
//

import Foundation
import Alamofire

public protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type,
                                   completion: @escaping (Result<T, RequestError>) -> Void)
    func sendRequest<T: Decodable>(withURL url: URL,
                                   responseModel: T.Type,
                                   completion: @escaping (Result<T, RequestError>) -> Void)
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type,
        completion: @escaping (Result<T,RequestError>) -> Void
    ) {
        
        let urlComponents = prepareURLComponents(with: endpoint)
        
        guard let url = urlComponents.url else {
            return completion(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        AF.request(url, method: .get).response { response in
            do{
                guard let data = response.data else { return }
                guard let response = response.response else { return }
                switch response.statusCode {
                        case 200...299:
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                            return completion(.success(decodedResponse))
                        case 401:
                            return completion(.failure(.unauthorized))
                        default:
                            return completion(.failure(.unexpectedStatusCode))
                    }
            }catch {
                return completion(.failure(.decode))
            }
        }
    }
    
    func sendRequest<T: Decodable>(withURL url: URL,
                                   responseModel: T.Type,
                                   completion: @escaping (Result<T, RequestError>) -> Void){
        AF.request(url, method: .get).response { response in
            do{
                guard let data = response.data else{ return }
                guard let response = response.response else{ return }
                switch response.statusCode{
                case 200...299:
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return completion(.success(decodedResponse))
                case 401:
                    return completion(.failure(.unauthorized))
                default:
                    return completion(.failure(.unexpectedStatusCode))
            }
            }catch{
                return completion(.failure(.decode))
            }
        }
    }

    private func prepareURLComponents(
        with endpoint: Endpoint
    ) -> URLComponents {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        if let queryItems = endpoint.queryItems {
            urlComponents.queryItems = queryItems
        }
        return urlComponents
    }
}


