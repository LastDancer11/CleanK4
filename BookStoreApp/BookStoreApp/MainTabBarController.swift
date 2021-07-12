//
//  MainTabBarController.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    
    private var homeCoordinator = HomeCoordinator()
    private var feedCoordinator = FeedCoordinator()
    private var libraryCoordinator = LibraryCoordinator()
    
    var coordinator: CoordinatorProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            homeCoordinator.navigationController!,
            feedCoordinator.navigationController!,
            libraryCoordinator.navigationController!
        ]
    }
    


}
