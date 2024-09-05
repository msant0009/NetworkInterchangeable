//
//  NetworkService.swift
//  NetworkInterchangeable
//
//  Created by Mark Santoro on 9/5/24.
//

import Foundation

protocol NetworkService {
    
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
}

