//
//  albumCell.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 19.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import UIKit
import Kingfisher
import Foundation

class albumCell: UICollectionViewCell {
   
    @IBOutlet var image: UIImageView!
    @IBOutlet var albumName: UILabel!
    @IBOutlet var artistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: AlbumModel){
        
        if let imageUrl = URL(string: model.strAlbumThumb) {
            image.kf.setImage(with: imageUrl)
        }
        albumName.text = model.strAlbum
        artistName.text = model.strArtist
    }
}
