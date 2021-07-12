//
//  AudioBooksCell.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class AudioBooksCell: UITableViewCell {

    var booksList: [BookModel]?

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    
    func setupCollectionView(){
        collectionView.registerNib(class: AudioBooksItem.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 274)
        collectionView.collectionViewLayout = layout
    }
    
    func configureBookList(books: [BookModel]) {
       booksList = books
       self.collectionView.reloadData()
       
   }

    
}

extension AudioBooksCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(AudioBooksItem.self, for: indexPath)
        cell.configure(with: booksList?[indexPath.row])
        return cell
    }
    
    
}


extension AudioBooksCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
  
}
