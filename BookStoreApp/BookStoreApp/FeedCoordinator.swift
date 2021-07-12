//
//  FeedCoordinator.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

final class FeedCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        
        let vc = FeedViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic-feed")
        vc.title = "Feed"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    func start() {
        
    }
    
}
