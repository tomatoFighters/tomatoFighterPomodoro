//
//  Playlist.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/13/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import Foundation

class Playlist {
    class Track {
        var tLabel: String
        var min: Int
        var sec: Int
        
        init(label l:String){
            tLabel = l
            min = 0
            sec = 0
        }
        func getTrackLabel() -> String{
            return tLabel
        }
        func setTrackLabel(label l: String){
            self.tLabel = l
        }
        func getMin() -> Int{
            return min
        }
        func setMin(min t: Int){
            self.min = t
        }
        func getSec() -> Int{
            return sec
        }
        func setSec(sec t: Int){
            self.sec = t
        }
        func getTrackTimerLabel() -> String {
            var label = ""
            if self.min < 10 && self.sec < 10  {
                label = "0\(self.min):0\(self.sec)"
            }
            else if self.min < 10 {
               label = "0\(self.min):\(self.sec)"
            }
            else {
                label = "\(self.min):\(self.sec)"
            }
            return label
        }
    }
    
    var label: String
    var tracks: [Track]=[]

    init(label l:String){
        self.label=l
        let track1=Track(label: "One")
        tracks.append(track1)
        let track2=Track(label: "Two")
        tracks.append(track2)
        let track3=Track(label: "Three")
        tracks.append(track3)
        let track4=Track(label: "Four")
        tracks.append(track4)
        let track5=Track(label: "Five")
        tracks.append(track5)
    }
    
    func getTracks() -> [Track]{
        return tracks
    }
    
    func getTrack(id: Int) -> Track{
        return tracks[id]
    }
    
    func getLabel() -> String{
        return label
    }
    
    func setLabel(label l: String){
        self.label = l
    }
    
    
}
