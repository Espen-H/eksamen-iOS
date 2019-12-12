//
//  favoritesViewController.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 11.12.2019.
//  Copyright © 2019 Espen. All rights reserved.
//
//
//  AlbumViewControllerCollectionViewController.swift
//  pg5600-exam
//
//  Created by Espen Emil Høines on 19.10.2019.
//  Copyright © 2019 Espen. All rights reserved.
//
import Foundation
import UIKit
import CoreData

private let reuseIdentifier = "favoriteCell"


class FavoritesViewController: UITableViewController {
    
    var result: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.fetchData()
    }
    
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteTracks")
        do {
            result = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch data, error: \(error)")
        }
    }
    
    func deleteTrackFromFavorites(_ record: NSManagedObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteTracks")
        request.predicate = NSPredicate(format: "strTrack = %@", (record.value(forKey: "strTrack") as? String)!)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            let fetchedTrack = result[0] as! NSManagedObject
            context.delete(fetchedTrack)
            try context.save()
        } catch _ {
            print("Failed to delete track from favorites")
        }
        self.fetchData()
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Remove from favorites?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default,handler:
            { action in
                let record = self.result[indexPath.row]
                self.deleteTrackFromFavorites(record)
                let feedbackAlert = UIAlertController(title: "Removed!", message: "", preferredStyle: .alert)
                feedbackAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                self.present(feedbackAlert, animated: true, completion:nil)
        }
        ))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = result[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! FavoriteCell
        
        cell.albumName.text = record.value(forKey: "strAlbum") as? String
        cell.trackName.text = record.value(forKey: "strTrack") as? String
        let convertedDuration: String = convertTime(record.value(forKey: "intDuration") as! String)
        cell.trackDuration.text = convertedDuration
        return cell
    }
}

// See extensions in AlbumTrackListCell #TODO move extension code to a better location
func convertTime(_ numberString: String) -> String {
    return Int(numberString)?.msToSeconds.minuteSecondMS ?? "Error"
}
