//
//  YouMayAlsoLikeItem.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class YouMayAlsoLikeItem: UICollectionViewCell {

    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imagePoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imagePoster.layer.cornerRadius = 8
        categoryView.layer.cornerRadius = 30
        
    }

    func configure(with book: BookModel?) {
        labelAuthor.text = book?.author
        labelTitle.text = book?.title
        let imageURL = book?.image ?? ""
        let httpsUrl = imageURL.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        imagePoster.kf.setImage(with: url)
        
    }
    
    
    
}
