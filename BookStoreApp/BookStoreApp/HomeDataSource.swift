//
//  HomeDataSource.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class HomeDataSource: NSObject {
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    var booksList: [BookModel]?
    
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
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


extension HomeDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == 0 {
            let cell = tableView.deque(HeaderCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])

            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.deque(StoryCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.deque(BestsellingCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.deque(SeriesCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])
            return cell
        }
//        if indexPath.row == 4 {
//            let cell = tableView.deque(FriendReadingCell.self, for: indexPath)
//            return cell
//        }
        if indexPath.row == 4 {
            let cell = tableView.deque(AudioBooksCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])
            return cell
        }
  
        if indexPath.row == 5 {
            let cell = tableView.deque(NewReleasesCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])
            return cell
        }
        
        if indexPath.row == 6 {
            let cell = tableView.deque(YouMayAlsoLikeCell.self, for: indexPath)
            cell.configureBookList(books: booksList ?? [])

            return cell
        }
//        if indexPath.row == 8 {
//            let cell = tableView.deque(ComingSoonCell.self, for: indexPath)
//            return cell
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 463
        }
        if indexPath.row == 1 {
            return 314
        }
        if indexPath.row == 2 {
            return 406
        }
        if indexPath.row == 3 {
            return 352
        }
        if indexPath.row == 4 {
            return 386
        }
        if indexPath.row == 5 {
            return 272
        }
        if indexPath.row == 6 {
            return 232
        }
        
        
        return 0
    }
    
}
