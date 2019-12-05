//
//  AlbumDetailsModel.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 23.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//


import UIKit

struct DetailsAlbum: Decodable {
    let album: [AlbumDetailsModel]
}

struct AlbumDetailsModel: Decodable {
    
    let idAlbum: String
    let strAlbum: String
    let strArtist: String
    let intYearReleased: String
    let strAlbumThumb: String
}
