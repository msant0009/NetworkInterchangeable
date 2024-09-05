//
//  ContentView.swift
//  NetworkInterchangeable
//
//  Created by Mark Santoro on 9/4/24.
//

import SwiftUI
//var serviceType = Webservice()
var serviceType = LocalService()


struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {

        self.userListViewModel = UserListViewModel(service: serviceType)
        // maybe add a button to do this in the future?
    }
    
    var body: some View {
        
        
        
        List(userListViewModel.userList,id: \.id) {user in
                VStack{
                    Text(user.name)
                        .font(.title3)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    Text(user.username)
                        .foregroundColor(.green)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    Text(user.email)
                        .foregroundColor(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                }
                
                
            }.task {
                await userListViewModel.downloadUsers()
            }
        
        
        }
 
        
    }





#Preview {
    
    ContentView()
}
