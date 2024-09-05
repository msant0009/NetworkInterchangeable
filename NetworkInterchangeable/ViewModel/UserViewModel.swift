//
//  UserViewModel.swift
//  NetworkInterchangeable
//
//  Created by Mark Santoro on 9/4/24.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
    
    let webservice = Webservice()
    
    func downloadUsers() async {
        
        do {
            let users = try await webservice.download(Constants.Urls.userExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch {
            print(error)
        }
        
    }
}

struct UserViewModel {
    
    let user : User
    
    var id : Int{
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }
    
    
}



