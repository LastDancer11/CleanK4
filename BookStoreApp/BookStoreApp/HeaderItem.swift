//
//  HeaderItem.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class HeaderItem: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageCell.layer.cornerRadius = 8
    }
    
    
    func configure(with book: BookModel?) {
        let imageUrl = book?.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        imageCell.kf.setImage(with: url)
    }

}
