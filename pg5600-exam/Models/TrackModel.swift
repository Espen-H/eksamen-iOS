//
//  TrackModel.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 03.12.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import UIKit

struct TrackList: Decodable {
    let track: [TrackListModel]
}

struct TrackListModel: Decodable {
    
    let strTrack: String
    let intDuration: String
    let strAlbum: String
    
}
