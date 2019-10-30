//
//  AlbumDetailsView.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 30.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import UIKit

class AlbumDetailsView: UIView {
    
    
    var albumImage: UIImageView!
    var albumNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var albumPublishingYear: UILabel!
    var trackListTableView: UITableView!
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        albumImage = UIImageView.init(frame: .zero)
        albumNameLabel = UILabel.init(frame: .zero)
        artistNameLabel = UILabel.init(frame: .zero)
        albumPublishingYear = UILabel.init(frame: .zero)
        trackListTableView = UITableView.init(frame: .zero)

        self.addSubview(albumNameLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(albumPublishingYear)
        self.addSubview(trackListTableView)
        
        NSLayoutConstraint.activate([
            // Image
            albumImage.topAnchor.constraint(equalTo: self.topAnchor),
            
            albumImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            albumImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            // Artist
            
            artistNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            // Album
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor),
            albumNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            // Year
            albumPublishingYear.topAnchor.constraint(equalTo: albumImage.bottomAnchor),
            albumPublishingYear.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // TableView
            trackListTableView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor),
            trackListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            trackListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trackListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
/*
 
 */

