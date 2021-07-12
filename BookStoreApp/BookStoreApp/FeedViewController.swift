//
//  FeedViewController.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class FeedViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    private var dataSource: FeedDataSource!
    private var viewModel: FeedViewModelProtocol!
    private var bookManager: BookManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        setupTableView()
    }
    
    
    private func setupTableView() {
        tableView.registerNib(class: UsersCell.self)
        tableView.registerNib(class: FeedCell.self)
        tableView.separatorStyle = .none
   
    }
    
    
    private func configureViewModel() {
        bookManager = BookManager()
        viewModel = FeedViewModel(with: bookManager, controller: self)
        dataSource = FeedDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }
}
