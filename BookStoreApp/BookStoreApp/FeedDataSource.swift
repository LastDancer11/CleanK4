//
//  FeedDataSource.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit


class FeedDataSource: NSObject {
    private var tableView: UITableView!
    private var viewModel: FeedViewModelProtocol!
    var booksList: [BookModel]?
    
    init(with tableView: UITableView, viewModel: FeedViewModelProtocol) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.viewModel = viewModel
     
    }
    
    func refresh() {
        viewModel.fetchBooks { [weak self] books in
            self?.booksList = books
            self?.tableView.reloadData()
        }
    }
    
}

extension FeedDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksList?.count ?? 0 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.deque(UsersCell.self, for: indexPath)
            return cell
        } else {
            let cell = tableView.deque(FeedCell.self, for: indexPath)
            cell.configure(with: booksList?[indexPath.row])
            return cell
        }
        
        
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 44
        }
        return 572
    }
}
