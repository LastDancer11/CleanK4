//
//  NewReleasesCell.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class NewReleasesCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var booksList: [BookModel]?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    
    func setupCollectionView(){
        collectionView.registerNib(class: NewReleasesItem.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 320, height: 160)
        collectionView.collectionViewLayout = layout
    }

    func configureBookList(books: [BookModel]) {
       booksList = books
       self.collectionView.reloadData()
       
   }

}
extension NewReleasesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(NewReleasesItem.self, for: indexPath)
        cell.configure(with: booksList?[indexPath.row])
        return cell
    }
    
    
}

extension NewReleasesCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
  
}
