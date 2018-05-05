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
    var cell: PlaylistTableViewCell!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.reloadData()
        self.parent?.view.backgroundColor = UIColor .white
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        let cellReuseIdentifier = "cell"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
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
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PlaylistTableViewCell
        var playList = playLists[indexPath.row]
        cell.label.text = playList.label
        cell.playL = playLists[indexPath.row]
        cell.table = tableView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.sendAction("resignFirstResponder", to:nil, from:nil, for:nil)
        self.performSegue(withIdentifier: "ShowTruck", sender: self)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            playLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }

    // Navigation: passing Data to Trucks page
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! TracksViewController
        let row = tableView.indexPathForSelectedRow!.row
        let thePlaylist = self.playLists[row]
        
        controller.playList = thePlaylist
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: false)
        }
    }
    
    //Keyboard functions
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if let activeTextField = cell.label {
            let info: NSDictionary = sender.userInfo! as NSDictionary
            let value: NSValue = info.value(forKey: UIKeyboardFrameBeginUserInfoKey) as! NSValue
            var keyboardSize: CGSize = value.cgRectValue.size
            keyboardSize.height = keyboardSize.height + 100
            let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
            tableView.contentInset = contentInsets
            tableView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let contentInsets: UIEdgeInsets = .zero
        tableView.contentInset = contentInsets
        tableView.scrollIndicatorInsets = contentInsets
    }
}

