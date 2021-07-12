//
//  SeriesItem.swift
//  UI_Bookstore_Eka Altunashvili
//
//  Created by MacBook  on 02.06.21.
//

import UIKit

class SeriesItem: UICollectionViewCell {
    
   
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var labelContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backView.layer.cornerRadius = 8
        img1.layer.cornerRadius = 8
        img2.layer.cornerRadius = 8
        img3.layer.cornerRadius = 8
        img4.layer.cornerRadius = 8

    }

    func configure(with book: BookModel?) {
      
        labelContent.text = book?.summary
        let imageURL = book?.image ?? ""
        let httpsUrl = imageURL.replacingOccurrences(of: "http:", with: "https:")
        let url = URL(string: httpsUrl)
        img1.kf.setImage(with: url)
        img2.kf.setImage(with: url)
        img3.kf.setImage(with: url)
        img4.kf.setImage(with: url)
        backView.backgroundColor = UIColor.random


        
    }
    
    
}

