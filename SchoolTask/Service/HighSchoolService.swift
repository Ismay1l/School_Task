//
//  HighSchoolService.swift
//  SchoolTask
//
//  Created by Ismayil Ismayilov on 3/9/24.
//

import Foundation
import Combine

protocol Service {
    
    func fetchData<T: Decodable>(_ url: URL, parameters: [String: String]?) -> AnyPublisher<T, Error>
}

final class HighSchoolService: Service {
    
    private enum NetworkError: Error {
        case invalidURL
        case decodingError
    }
    
    func fetchData<T: Decodable>(_ url: URL, parameters: [String: String]? = nil) -> AnyPublisher<T, Error> {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        if let parameters = parameters, !parameters.isEmpty {
            components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let finalURL = components?.url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: finalURL)
            .map(\.data)
            .tryMap { data in
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    return decodedObject
                } catch {
                    do {
                        let decodedArray = try JSONDecoder().decode([T].self, from: data)
                        guard let firstElement = decodedArray.first else {
                            throw NetworkError.decodingError
                        }
                        return firstElement
                    } catch {
                        throw NetworkError.decodingError
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
