//
//  BookManager.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import Foundation
protocol BookManagerProtocol: AnyObject {
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void)
    

}

 class BookManager: BookManagerProtocol {


    func fetchBooks(completion: @escaping ([BookModel]) -> Void) {
        let url = "https://run.mocky.io/v3/0f23e7a0-e72a-43e8-b107-659e809eb0d0"
        NetworkManager.shared.get(url: url) { (result: Result<[BookModel], Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(response)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
