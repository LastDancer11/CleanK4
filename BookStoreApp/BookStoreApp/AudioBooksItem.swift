//
//  AudioBooksItem.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class AudioBooksItem: UICollectionViewCell {

    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        backView.layer.cornerRadius = 8
        imagePoster.layer.cornerRadius = 8
        
        
    }
    
    
    func configure(with book: BookModel?) {
        backView.backgroundColor = UIColor.random
        labelAuthor.text = book?.author
        labelTitle.text = book?.title
        let imageURL = book?.image ?? ""
        let httpsUrl = imageURL.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        imagePoster.kf.setImage(with: url)
        
    }
    
    

}
