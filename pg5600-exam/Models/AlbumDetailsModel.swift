//
//  AlbumDetailsModel.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 23.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//


import UIKit

struct Album: Decodable {
    let album: [AlbumDetailsModel]
}

struct AlbumDetailsModel: Decodable {
    
    let strAlbumThumb: String
    let strAlbum: String
    let strArtist: String
    let intYearReleased: Int
    // #TODO Add Tracklist from API with track name and length
    
}
