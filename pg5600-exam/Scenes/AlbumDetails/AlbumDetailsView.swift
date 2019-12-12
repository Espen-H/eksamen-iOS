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
    
    
    
    private func viewSetup() {
        albumImage = UIImageView(frame: .zero)
        albumNameLabel = UILabel(frame: .zero)
        artistNameLabel = UILabel(frame: .zero)
        albumPublishingYear = UILabel(frame: .zero)
        trackListTableView = UITableView(frame: .zero)
        
        self.addSubview(albumImage)
        self.addSubview(albumNameLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(albumPublishingYear)
        self.addSubview(trackListTableView)
        
        artistNameLabel.font = artistNameLabel.font.withSize(16)
        artistNameLabel.textAlignment = .left
        artistNameLabel.numberOfLines = 1
        artistNameLabel.minimumScaleFactor = 0.1
        artistNameLabel.adjustsFontSizeToFitWidth = true
        
        albumNameLabel.font = albumNameLabel.font.withSize(16)
        albumNameLabel.textAlignment = .center
        albumNameLabel.numberOfLines = 1
        albumNameLabel.minimumScaleFactor = 0.1
        albumNameLabel.adjustsFontSizeToFitWidth = true
        
        albumPublishingYear.font = albumPublishingYear.font.withSize(16)
        albumPublishingYear.textAlignment = .right
        albumPublishingYear.numberOfLines = 1
        albumPublishingYear.minimumScaleFactor = 0.1
        albumPublishingYear.adjustsFontSizeToFitWidth = true
    }
    
    private func layoutSetup() {
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
    
    func populate(with viewModel: AlbumDetailsModel) {
        albumNameLabel.text = viewModel.strAlbum
        albumPublishingYear.text = viewModel.intYearReleased
        artistNameLabel.text = viewModel.strArtist
        if let imageUrl = URL(string: viewModel.strAlbumThumb) {
            albumImage.kf.setImage(with: imageUrl)
        }
        
        setNeedsDisplay()
    }
}

