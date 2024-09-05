//
//  WebService.swift
//  NetworkInterchangeable
//
//  Created by Mark Santoro on 9/4/24.
//

import Foundation

enum NetworError : Error {
    case invalidUrl
    case invalidServerResponse
}


class Webservice {

    func download(_ resource: String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            throw NetworError.invalidUrl
        }
        
        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworError.invalidServerResponse
            }
            
        return try JSONDecoder().decode([User].self, from: data)
        
    }
    
    
}
