//
//  AlbumService.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 19.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import Foundation
import Alamofire


extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        debugPrint("=======================================")
        #endif
        return self
    }
}


class AlbumService {
    func getTop(completion: @escaping ([AlbumModel]?) -> Void) {
        Alamofire.request("https://theaudiodb.com/api/v1/json/1/mostloved.php?format=album").validate().response { response in
            guard let data = response.data else { return }
            do {
                    let albums = try JSONDecoder().decode(LovedAlbums.self, from: data)
                    completion(albums.loved)
                } catch {
                    print(error)
                }
            }
    }
    
    func getSpecificAlbum(artist: String, album: String, completion: @escaping ([AlbumDetailsModel]?) -> Void) {
        let urlArtist = artist.replacingOccurrences(of: " ", with: "%20")
        let urlAlbum = album.replacingOccurrences(of: " ", with: "%20")
         let urlRequest: String = "https://theaudiodb.com/api/v1/json/1/searchalbum.php?s=\(urlArtist)&a=\(urlAlbum)"
        Alamofire.request(urlRequest).debugLog()
            .validate().response { response in
                guard let data = response.data else { return }
                do {
                    let album = try JSONDecoder().decode(DetailsAlbum.self, from: data)
                    completion(album.album)
                } catch {
                    print(error)
                }
        }
        
    }
    
    /*
    func getAlbumTracks(trackId: String, completion: @escaping ([TrackModel]?) -> Void) {
    Alamofire.request("https://theaudiodb.com/api/v1/json/1/track.php?m=\(trackId)")
        .validate().response { response in
        guard let data = respone.data else {return}
        do {
            let tracks = try JSONDecoder().decode(, from: <#T##Data#>)
        }
        
        }
    
}
    
    func getTopAlbums(completion: @escaping ([AlbumModel]?) -> Void) {
        Alamofire.request("https://theaudiodb.com/api/v1/json/1/mostloved.php?format=album")
            .validate()
            .responseJSON { response in
            guard response.result.isSuccess else {
                print("Error fetching data from api")
                return
            }
                guard let albums = response.result.value as? LovedAlbums else {return}
                
                albums.loved.forEach { print($0.strAlbum ) }
                completion(albums.loved)
        }
    } */
}
