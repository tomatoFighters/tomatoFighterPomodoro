//
//  TimerViewController.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/15/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    @IBOutlet weak var runWithCon: UISwitch!
    @IBOutlet weak var pauseButton: UIButton!
    var Tracks: [Track]!
    var Stack:[StackView] = []
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    var seconds:Int!
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    var goRight = true
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runWithCon.isHidden = false
        pauseButton.isHidden=true
        
        let delimeter:CGFloat = 10
        let cellH:CGFloat = 60
        let cellW:CGFloat = self.view.frame.width - 40
        let hightWithDel = cellH + delimeter
        var cellY:CGFloat = 300
        let cellX:CGFloat = 20
        
        if Tracks.count != 0 {
            timerLabel.text = String(format:"%02i:%02i", Tracks[0].getMin(), Tracks[0].getSec())
            
            for track in Tracks{
                let stackV = StackView(frame: CGRect(x: cellX, y: cellY, width: cellW, height: cellH))
                
                stackV.backgroundColor = UIColor.cyan
                stackV.name?.text = track.getTrackLabel()
                stackV.time?.text = String(format:"%02i:%02i", track.getMin(), track.getSec())
                
                self.view.addSubview(stackV)
                Stack.append(stackV)
                cellY = cellY + hightWithDel
            }
        }
        
    }
    
    @IBAction func onPlay(_ sender: Any) {
        playSound(soundName: "startingPistol")
        
        seconds = Tracks[0].getSec() + Tracks[0].getMin()*60
        runTimer()
        
        playButton.isHidden=true
        playButton.setTitle("Continue",for: .normal)
        pauseButton.isHidden=false
    }
    
    @IBAction func onPause(_ sender: Any) {
        if resumeTapped == false {
            timer.invalidate()
            resumeTapped = true
            pauseButton.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            resumeTapped = false
            pauseButton.setTitle("Pause",for: .normal)
        }
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            if Tracks.count <= 1{
                playSound(soundName: "bell")
                timer.invalidate()
                pauseButton.setTitle("Done!",for: .normal)
                pauseButton.isEnabled = false
                if Tracks.count == 1{
                    removeView()
                }
            } else {
                playSound(soundName: "bell")
                removeView()
                Tracks.remove(at: 0)
                seconds = Tracks[0].getSec() + Tracks[0].getMin()*60
                timerLabel.text = String(format:"%02i:%02i", Tracks[0].getMin(), Tracks[0].getSec())
            }
        } else {
            seconds = seconds - 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func removeView(){
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [],
                       animations: {
                        let newY:CGFloat = 900
                        if self.goRight == true {
                            self.Stack[0].frame.origin.x = self.Stack[0].frame.origin.x + newY
                            self.goRight = false
                            self.Stack.remove(at: 0)
                        } else {
                            self.Stack[0].frame.origin.x = self.Stack[0].frame.origin.x - newY
                            self.goRight = true
                            self.Stack.remove(at: 0)
                        }
        },
                       completion: nil
        )
    }
    
    @objc func updateTimerCon() {
        if seconds < 1 {
            timer.invalidate()
            print(Tracks.count)
            if Tracks.count > 1{
                removeView()
                playSound(soundName: "bell")
                playButton.isHidden=false
                pauseButton.isHidden=true
                Tracks.remove(at: 0)
                timerLabel.text = String(format:"%02i:%02i", Tracks[0].getMin(), Tracks[0].getSec())
            } else {
                if Tracks.count == 1{
                    removeView()
                }
                playSound(soundName: "bell")
                pauseButton.setTitle("Done!",for: .normal)
                pauseButton.isEnabled = false
            }
        } else {
            seconds = seconds - 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func runTimer() {
        if runWithCon.isOn{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimerCon)), userInfo: nil, repeats: true)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        }
        runWithCon.isHidden = true
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    ///////////////////////////////////// Below Player Setup
    func playSound(soundName: String) {
        print("playSound() was called")
        
        let sound = NSDataAsset(name: soundName) //sound is an optional NSDataAsset
        
        if sound == nil {
            print("error finding sound asset")
            return  // This gets out of the function
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {                                        // setting up numerous do, try, catch blocks allows us to specifically what fails.
            print("error setting up sound playback")
        }
        do {
            try player = AVAudioPlayer(data: sound!.data)
            player!.play()
        }catch {
            print("eror in the sound playback")
        }
    }
    ///////////////////////////////////// Above Player Setup

}
