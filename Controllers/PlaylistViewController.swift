//
//  ViewController.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/13/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var playLists: [Playlist] = [Playlist(label: "To Do")]
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.reloadData()
        super.viewDidLoad()
    }
    
    @IBAction func onPlusButton(_ sender: Any) {
        let newPlayList = Playlist(label: "New To Do")
        playLists.append(newPlayList)
        self.tableView.reloadData()
        print (playLists.count)
    }
    
    
    //TABLE functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PlaylistTableViewCell
        var playList = playLists[indexPath.row]
        cell.label.text = playList.label
        cell.playL = playLists[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowTruck", sender: self)
    }
    
    // Navigation: passing Data to Trucks page
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! TracksViewController
        let row = tableView.indexPathForSelectedRow!.row
        let thePlaylist = self.playLists[row]
        // How shoulc we prepare?
        
        controller.playList = thePlaylist
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: false)
        }
    }

}

