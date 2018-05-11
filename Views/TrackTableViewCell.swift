//
//  TruckTableViewCell.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/14/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//
import UIKit

class TrackTableViewCell: UITableViewCell, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var trackLabel: UITextField!
    @IBOutlet weak var trackTimer: UITextField!
    
    var track:Track?
    let picker = UIPickerView()
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    var timerValueArray = [Int](repeating: 0, count: 2)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.trackLabel.delegate = self
        
        picker.delegate = self
        picker.dataSource = self
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        trackTimer.inputAccessoryView = toolbar
        trackTimer.inputView = picker
        
        
    }
    @objc func donePressed(sender:UIBarButtonItem){
        //print("done was pressed")//DEBUG
        track?.setMin(min: timerValueArray[0])
        track?.setSec(sec: timerValueArray[1])
        
        trackTimer.text = track?.getTrackTimerLabel()
        print("Track: \(track?.tLabel)Min: \(track?.min) Sec:\(track?.sec)")
        self.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return minutes.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if component == 0 && row == 1{
            let pickerLabel = UILabel()
            var titleData = ""
            titleData = "\(minutes[row]) min"
            pickerLabel.text = titleData
            return pickerLabel
        } else if component == 0 {
            let pickerLabel = UILabel()
            var titleData = ""
            titleData = "\(minutes[row]) mins"
            pickerLabel.text = titleData
            return pickerLabel
        }else if component == 1 && row == 1 {
            let pickerLabel = UILabel()
            var titleData = ""
            titleData = "\(minutes[row]) sec"
            pickerLabel.text = titleData
            return pickerLabel
        } else {
            let pickerLabel = UILabel()
            var titleData = ""
            titleData = "\(seconds[row]) secs"
            pickerLabel.text = titleData
            return pickerLabel
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width / 4
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //self.detailTextLabel?.text = "\(component)\(row)"
        //print("component: \(component) row:\(row)")//DEBUG
        if component == 0 {
            timerValueArray[component] = row
        }
        if component == 1 {
            timerValueArray[component] = row
        }
        //print(timerValueArray)//DEBUG
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        print(newText)
        track?.setTrackLabel(label: newText as String)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.trackLabel.endEditing(true)
        return false
    }
}
