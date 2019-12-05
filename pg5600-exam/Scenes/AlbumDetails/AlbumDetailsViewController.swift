//
//  AlbumDetailsViewController.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 23.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class AlbumDetailsViewController : UIViewController {
    var albumName: String?
    var albumArtist: String?
    var albumDetailsData: [AlbumDetailsModel]?
    var detailsView = AlbumDetailsView()

    
    override func loadView() {
        super.view = detailsView
    }
    

  override func viewDidLoad() {
    getAlbumDetails()
}
    
    
    func getAlbumDetails() {
      AlbumService().getSpecificAlbum(
        artist: self.albumArtist!,
        album: self.albumName!,
        completion: { album in
            self.albumDetailsData = album
            self.updateViewWithData()
      })
    }
    
    func updateViewWithData() {
        guard let albumDetails: AlbumDetailsModel = self.albumDetailsData?.first else {print("error updateViewWithData"); return}
        detailsView.albumNameLabel.text = albumDetails.strAlbum
        detailsView.albumPublishingYear.text = albumDetails.intYearReleased
        detailsView.artistNameLabel.text = albumDetails.strArtist
        if let imageUrl = URL(string: albumDetails.strAlbumThumb) {
            detailsView.albumImage.kf.setImage(with: imageUrl)
        }
        self.view.setNeedsDisplay()
    }
}
