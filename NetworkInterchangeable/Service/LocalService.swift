//
//  LocalService.swift
//  NetworkInterchangeable
//
//  Created by Mark Santoro on 9/5/24.
//

import Foundation

class LocalService {

    func download(_ resource: String) async throws -> [User] {
      
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
                fatalError("Resource not found")
            
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
        
        
    }
    
}
