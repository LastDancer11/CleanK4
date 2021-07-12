//
//  StoryItem.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit
import Kingfisher

class StoryItem: UICollectionViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var imageSmall: UIImageView!
    @IBOutlet weak var imagePoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imagePoster.layer.cornerRadius = 8
        
        imageSmall.makeRounded()

    }
    
    func configure(with book: BookModel?) {
        labelDescription.text = book?.summary
        let imageURL = book?.image ?? ""
        let httpsUrl = imageURL.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        imagePoster.kf.setImage(with: url)
        imageSmall.image = UIImage(named: "avatar")
        
        
    }

}



