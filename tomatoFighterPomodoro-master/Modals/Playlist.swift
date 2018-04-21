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
//        var timer = Timer()
//
        init(label l:String){
            tLabel=l
        }
        
        func getTrackLabel() -> String{
            return tLabel
        }
        
        func setTrackLable(label l: String){
            self.tLabel = l
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
    
    func setLable(label l: String){
        self.label = l
    }
}
