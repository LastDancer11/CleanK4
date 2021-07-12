//
//  SeriesCell.swift
//  UI_Bookstore_Eka Altunashvili
//
//  Created by MacBook  on 02.06.21.
//

import UIKit


class SeriesCell: UITableViewCell {

    @IBOutlet weak var labelSeries: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var booksList: [BookModel]?

    


    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCollectionView()
    
    }
    
    func setupCollectionView(){
        collectionView.registerNib(class: SeriesItem.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 320, height: 240)
        collectionView.collectionViewLayout = layout
    }
    
    func configureBookList(books: [BookModel]) {
       booksList = books
       self.collectionView.reloadData()
       
   }


    
    
}

extension SeriesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(SeriesItem.self, for: indexPath)
        cell.configure(with: booksList?[indexPath.row])
        return cell
    }
    
    
}


extension SeriesCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
  
}
