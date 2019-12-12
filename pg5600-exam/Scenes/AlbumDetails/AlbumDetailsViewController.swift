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
import CoreData

private let reuseIdentifier = "trackCell"


class AlbumDetailsViewController : UIViewController {
    var albumName: String?
    var albumArtist: String?
    var albumId: String?
    var albumDetailsData: AlbumDetailsModel?
    var albumTracksData: [TrackListModel]?
    var detailsView = AlbumDetailsView()
    var tracksTableView: UITableView?
    
    override func loadView() {
        super.view = detailsView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tracksTableView = detailsView.trackListTableView
        self.tracksTableView?.delegate = self
        self.tracksTableView?.dataSource = self
        self.tracksTableView?.register(albumTrackListCell.self, forCellReuseIdentifier: "trackCell")
        getAlbumDetails()
    }
    
    func getAlbumTracks(albumId: String) {
        AlbumService().getAlbumTracks(albumId: self.albumId!, completion: {
            tracks in self.albumTracksData = tracks
            DispatchQueue.main.async {
                guard let albumDetails = self.albumDetailsData else { preconditionFailure("error updateViewWithData") }
                self.detailsView.populate(with: albumDetails)
                self.detailsView.trackListTableView.reloadData()
            }
        })
    }
    
    func getAlbumDetails() {
        AlbumService().getSpecificAlbum(
            artist: self.albumArtist!,
            album: self.albumName!,
            completion: { album in
                self.albumDetailsData = album
                self.albumId = album?.idAlbum
                self.getAlbumTracks(albumId: self.albumId!)
        })
    }
}

func saveTrackToFavorites(track: TrackListModel) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "FavoriteTracks", in: context)
    let newTrack = NSManagedObject(entity: entity!, insertInto: context)
    newTrack.setValue(track.strAlbum, forKey: "strAlbum")
    newTrack.setValue(track.strTrack, forKey: "strTrack")
    newTrack.setValue(track.intDuration, forKey: "intDuration")
    do {
        try context.save()
    } catch {
        print("Failed saving")
    }
    
}


extension AlbumDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = albumTracksData?[indexPath.item]
        let alert = UIAlertController(title: "Add to favorites?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            
            if track != nil {
                saveTrackToFavorites(track: track!)
                let feedbackAlert = UIAlertController(title: "Added!", message: "", preferredStyle: .alert)
                feedbackAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                self.present(feedbackAlert, animated: true, completion:nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension AlbumDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumTracksData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! albumTrackListCell
        guard let track = self.albumTracksData?[indexPath.row] else {return UITableViewCell()}
        cell.configure(model: track)
        return cell
    }
    
}
