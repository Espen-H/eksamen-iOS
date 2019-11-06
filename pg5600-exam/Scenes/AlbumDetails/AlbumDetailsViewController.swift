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
    var albumData: [AlbumDetailsModel]?
    
    override func loadView() {
        super.view = AlbumDetailsView()
    }
    
    
  /*  override func viewDidAppear(_ animated: Bool) {
        AlbumService().getSpecificAlbum(album: albumName, completion: { album in
            self.albumData = album
        }) */
    
    
}
