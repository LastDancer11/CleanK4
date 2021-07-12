//
//  BestselingCell.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class BestsellingCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var booksList: [BookModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
     setUpCollectionView()
        
    }

    
    
    private func setUpCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(class: BestsellingItem.self)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 294)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
    }
     func configureBookList(books: [BookModel]) {
        booksList = books
        self.collectionView.reloadData()
        
    }
    
}

extension BestsellingCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(BestsellingItem.self, for: indexPath)
        cell.configure(with: booksList?[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
}

