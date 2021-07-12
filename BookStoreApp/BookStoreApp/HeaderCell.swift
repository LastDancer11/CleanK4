//
//  HeaderCell.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class HeaderCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var booksList: [BookModel]?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
        setUpCollectionView()
    }

    
   private func setUpCollectionView() {

            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.registerNib(class: HeaderItem.self)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.contentInset = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 160, height: 250)
            layout.minimumLineSpacing = 68
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
            
   }
    
    func configureBookList(books: [BookModel]) {
       booksList = books
       self.collectionView.reloadData()
       
   }
    
}

extension HeaderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(HeaderItem.self, for: indexPath)
        cell.configure(with: (booksList?[indexPath.row]))
        return cell
    }
    
    
}

extension HeaderCell: UICollectionViewDelegate {
 
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
        

    }
}
