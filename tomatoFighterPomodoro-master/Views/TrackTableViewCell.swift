//
//  TruckTableViewCell.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/14/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var trackLabel: UITextField!
    @IBOutlet weak var trackTimer: UITextField!
    
    var track:Playlist.Track?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.trackLabel.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        print(newText)
        track?.setTrackLable(label: newText as String)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.trackLabel.endEditing(true)
        return false
    }
}
