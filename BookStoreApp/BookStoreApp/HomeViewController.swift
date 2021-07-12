//
//  HomeViewController.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    private var dataSource: HomeDataSource!
    private var viewModel: HomeViewModelProtocol!
    private var bookManager: BookManagerProtocol!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureViewModel()
        
        
    }
    private func setupTableView() {
        tableView.registerNib(class: HeaderCell.self)
        tableView.registerNib(class: StoryCell.self)
        tableView.registerNib(class: BestsellingCell.self)
        tableView.registerNib(class: SeriesCell.self)
        tableView.registerNib(class: AudioBooksCell.self)
        tableView.registerNib(class: NewReleasesCell.self)
        tableView.registerNib(class: YouMayAlsoLikeCell.self)
        tableView.separatorStyle = .none
   
    }
    
    
    private func configureViewModel() {
        bookManager = BookManager()
        viewModel = HomeViewModel(with: bookManager, controller: self)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }

}
