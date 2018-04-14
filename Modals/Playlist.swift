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
        var truck1=Track(label: "One")
        tracks.append(truck1)
        var truck2=Track(label: "Two")
        tracks.append(truck2)
        var truck3=Track(label: "Three")
        tracks.append(truck3)
        var truck4=Track(label: "Four")
        tracks.append(truck4)
        var truck5=Track(label: "Five")
        tracks.append(truck5)
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
