//
//  AlbumModel.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 19.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import UIKit

struct LovedAlbums: Decodable {
    let loved: [AlbumModel]
}

struct AlbumModel: Decodable {
    
    let strAlbumThumb: String
    let strAlbum: String
    let strArtist: String
    
}

