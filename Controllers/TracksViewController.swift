//
//  TracksViewController.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/14/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class TracksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var trackTableView: UITableView!
    
    var playList: Playlist?
    var trackCell: TrackTableViewCell!
    var tempTracks:[Playlist.Track]?
    
    override func viewDidLoad() {
        self.title = playList?.getLabel()
        self.trackTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        

        trackTableView.rowHeight = UITableViewAutomaticDimension
        let h = trackTableView.bounds.height
        trackTableView.rowHeight = h/5
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playTapped))

        trackTableView.allowsSelection = false
        
        super.viewDidLoad()
    }

    //TABLE functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (playList?.getTracks().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        trackCell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackTableViewCell
        
        let track = playList?.getTrack(id: indexPath.row)
        trackCell.trackLabel.text = track?.getTrackLabel()
        trackCell.track = playList?.getTrack(id: indexPath.row)
        trackCell.trackTimer.text = track?.getTrackTimerLabel()
        
        return trackCell
    }
    
    @objc func playTapped(sender: AnyObject) {
        tempTracks = playList!.getTracks()
        var count = 0
        for tr in tempTracks!{
            if tr.getMin() == 0 && tr.getSec() == 0 {
                tempTracks!.remove(at: count)
            } else {
                count += 1
            }
        }
        
        if tempTracks!.count > 0{
            performSegue(withIdentifier: "toTimer", sender: sender)
        }
    }
    
    //Keyboard functions
    @objc func keyboardWillShow(sender: NSNotification) {
        if let activeTextField = trackCell.trackLabel {
            let info: NSDictionary = sender.userInfo! as NSDictionary
            let value: NSValue = info.value(forKey: UIKeyboardFrameBeginUserInfoKey) as! NSValue
            var keyboardSize: CGSize = value.cgRectValue.size
            keyboardSize.height = keyboardSize.height + 100
            let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
            trackTableView.contentInset = contentInsets
            trackTableView.scrollIndicatorInsets = contentInsets
        }
        
        if let activeTextField = trackCell.trackTimer {
            let info: NSDictionary = sender.userInfo! as NSDictionary
            let value: NSValue = info.value(forKey: UIKeyboardFrameBeginUserInfoKey) as! NSValue
            var keyboardSize: CGSize = value.cgRectValue.size
            keyboardSize.height = keyboardSize.height + 100
            let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
            trackTableView.contentInset = contentInsets
            trackTableView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let contentInsets: UIEdgeInsets = .zero
        trackTableView.contentInset = contentInsets
        trackTableView.scrollIndicatorInsets = contentInsets
    }
    
    
    // Navigation: passing Data to Timer page
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let trackController = segue.destination as! TimerViewController
            trackController.Tracks = tempTracks
    }
}
