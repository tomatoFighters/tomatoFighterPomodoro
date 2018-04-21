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
    
    override func viewDidLoad() {
        self.title = playList?.getLabel()
        self.trackTableView.separatorStyle = UITableViewCellSeparatorStyle.none

        trackTableView.rowHeight = UITableViewAutomaticDimension
        var h = trackTableView.bounds.height
        trackTableView.rowHeight = h/5
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification)
    {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: Notification){
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
        
    }
    //TABLE functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (playList?.getTracks().count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trackCell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackTableViewCell
        
        var track = playList?.getTrack(id: indexPath.row)
        trackCell.trackLabel.text = track?.getTrackLabel()
        trackCell.track = playList?.getTrack(id: indexPath.row)
        
        return trackCell
    }
    
   

}
