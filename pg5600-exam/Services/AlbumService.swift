//
//  AlbumService.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 19.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import Foundation
import Alamofire

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
    
    func getTopAlbums(completion: @escaping ([AlbumModel]?) -> Void) {
        Alamofire.request("https://theaudiodb.com/api/v1/json/1/mostloved.php?format=album")
            .validate()
            .responseJSON { response in
            guard response.result.isSuccess else {
                print("Error fetching data from api")
                return
            }
                guard let albums = response.result.value as? LovedAlbums else {
                    return
                }
                
                albums.loved.forEach { print($0.strAlbum ) }
                
                completion(albums.loved)
        }
    }
}
