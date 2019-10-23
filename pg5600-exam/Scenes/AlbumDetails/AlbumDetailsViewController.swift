//
//  AlbumDetailsViewController.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 23.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailsViewController : UIViewController {
    
    weak var albumDetailsView: UIView!
    var albumImage = UIImageView.init()
    var albumNameLabel = UILabel.init()
    var artistNameLabel = UILabel.init()
    var albumPublishingYear = UILabel.init()
    var trackListTableView = UITableView.init()

    
    
    override func loadView() {
        let albumDetailsView = UIView(frame: .zero)
        albumDetailsView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(albumDetailsView)
        
        albumDetailsView.addSubview(albumImage)
        albumDetailsView.addSubview(artistNameLabel)
        albumDetailsView.addSubview(albumNameLabel)
        albumDetailsView.addSubview(albumPublishingYear)
        albumDetailsView.addSubview(trackListTableView)
        
        NSLayoutConstraint.activate([
            // View
            albumDetailsView.topAnchor.constraint(equalTo:
                self.view.safeAreaLayoutGuide.topAnchor),
            
            albumDetailsView.leadingAnchor.constraint(equalTo:
                self.view.safeAreaLayoutGuide.leadingAnchor),
            
            albumDetailsView.trailingAnchor.constraint(equalTo:
            self.view.safeAreaLayoutGuide.trailingAnchor),
            
            albumDetailsView.bottomAnchor.constraint(equalTo:
            self.view.safeAreaLayoutGuide.bottomAnchor),
            
            // Image
            albumImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            albumImage.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            // Artist
            
            // Album
            
            // Year
            
            // TableView
            
            ])
        
    }
    
    
    
    var albumData: [AlbumDetailsModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
  /*  override func viewDidAppear(_ animated: Bool) {
        AlbumService().getSpecificAlbum(album: albumName, completion: { album in
            self.albumData = album
        }) */
    
    
}
