//
//  LibraryCoordinator.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

final class LibraryCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        
        let vc = LibraryViewController.instantiateFromStoryboard()
        vc.tabBarItem.image = UIImage(named: "ic-library")
        vc.title = "Library"
        
        self.navigationController?.viewControllers = [vc]
    }
    
    func start() {
        
    }
}
