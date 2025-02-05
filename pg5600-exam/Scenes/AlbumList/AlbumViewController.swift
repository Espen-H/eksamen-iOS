//
//  AlbumViewControllerCollectionViewController.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 19.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "albumCell"
private let sectionInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)




class AlbumViewController: UICollectionViewController {
    
    var albumData: [AlbumModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.bounds.inset(by: sectionInsets)
        collectionView.layoutIfNeeded()
        AlbumService().getTop(completion: { albums in
            self.albumData = albums
            self.collectionView.reloadData()
        })
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumData?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = albumData?[indexPath.item]
        let vc = AlbumDetailsViewController()
        vc.albumName = album?.strAlbum
        vc.albumArtist = album?.strArtist
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlbumCell
        
        guard let album = albumData?[indexPath.row] else { return UICollectionViewCell() }
        cell.configure(with: album)
        return cell
    }
    
    
    
    
}
