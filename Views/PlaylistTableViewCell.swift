//
//  PlaylistTableViewCell.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/13/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell, UITextFieldDelegate  {

    @IBOutlet weak var label: UITextField!
    var playL:Playlist?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.delegate = self
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        print(newText)
        playL?.setLable(label: newText as String)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.label.endEditing(true)
        return false
    }
    
    
}
