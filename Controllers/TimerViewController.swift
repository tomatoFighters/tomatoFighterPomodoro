//
//  TimerViewController.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/15/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var Tracks: [Playlist.Track]?
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPlayPause(_ sender: Any) {
    }

}
