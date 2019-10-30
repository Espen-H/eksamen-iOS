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
    
    
    override func loadView() {
        let albumDetailsView = AlbumDetailsView.init(frame: .zero)
        self.view.addSubview(albumDetailsView)
        albumDetailsView.translatesAutoresizingMaskIntoConstraints = false
        albumDetailsView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        albumDetailsView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        albumDetailsView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
