//
//  ViewModel.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit
protocol FeedViewModelProtocol: AnyObject {
    func fetchBooks(completion: @escaping ([BookModel]) -> Void)

    
    var controller: CoordinatorDelegate { get }
    
    init(with bookManager: BookManagerProtocol, controller: CoordinatorDelegate)
}

class FeedViewModel: FeedViewModelProtocol {
   
    private(set) var controller: CoordinatorDelegate
    private var bookManager: BookManagerProtocol!

    
    required init(with bookManager: BookManagerProtocol, controller: CoordinatorDelegate) {
        self.controller = controller
        self.bookManager = bookManager
    }
    
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void) {
        bookManager.fetchBooks { books in
            completion(books)
        }
    }
}
