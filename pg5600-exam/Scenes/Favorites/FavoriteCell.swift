//
//  FavoriteCell.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 11.12.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import Foundation
import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var trackDuration: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

