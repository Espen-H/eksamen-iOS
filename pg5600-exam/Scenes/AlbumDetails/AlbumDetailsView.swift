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
        viewSetup()
        layoutSetup()
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        viewSetup()
        layoutSetup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewSetup() {
        albumImage = UIImageView.init(frame: .zero)
        albumNameLabel = UILabel.init(frame: .zero)
        artistNameLabel = UILabel.init(frame: .zero)
        albumPublishingYear = UILabel.init(frame: .zero)
        trackListTableView = UITableView.init(frame: .zero)
        
        self.addSubview(albumImage)
        self.addSubview(albumNameLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(albumPublishingYear)
        self.addSubview(trackListTableView)
        
        albumImage.backgroundColor = .red
        
        albumNameLabel.backgroundColor = .blue
        albumNameLabel.font = albumNameLabel.font.withSize(35)
        albumNameLabel.text = "Test album"
        albumNameLabel.textAlignment = .center
        
        artistNameLabel.backgroundColor = .green
        artistNameLabel.text = "test Artist"
        artistNameLabel.font = artistNameLabel.font.withSize(35)

        albumPublishingYear.backgroundColor = .purple
        albumPublishingYear.text = "1993"
        albumPublishingYear.font = albumPublishingYear.font.withSize(35)
        albumPublishingYear.textAlignment = .right
    }
    
    func layoutSetup() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumPublishingYear.translatesAutoresizingMaskIntoConstraints = false
        trackListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Image
            albumImage.topAnchor.constraint(equalTo: self.topAnchor),
            albumImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            albumImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            albumImage.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            
            // Artist
            artistNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Album
            albumNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor),
            albumNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            albumNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // Year
            albumPublishingYear.topAnchor.constraint(equalTo: albumImage.bottomAnchor),
            albumPublishingYear.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            albumPublishingYear.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            
            // TableView
            trackListTableView.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor),
            trackListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            trackListTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trackListTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
    
    
}

