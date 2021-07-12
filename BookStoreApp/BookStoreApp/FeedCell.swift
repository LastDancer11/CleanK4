//
//  FeedCell.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageCover: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.blueView.layer.cornerRadius = 30
        imageAvatar.makeRounded()
    }

    func configure(with book: BookModel?) {
        imageAvatar.image = UIImage(named: "avatar")
        labelAuthor.text = book?.author
        labelTitle.text = book?.title
        labelDescription.text = book?.summary
        imageCover.image = UIImage(named: "cover")
        let imageURL = book?.image ?? ""
        let httpsUrl = imageURL.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        imagePoster.kf.setImage(with: url)

    }
    
}
