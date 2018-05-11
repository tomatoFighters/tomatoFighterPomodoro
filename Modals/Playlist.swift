//
//  Playlist.swift
//  Times
//
//  Created by Veronika Kotckovich on 4/13/18.
//  Copyright © 2018 tomatoFighters. All rights reserved.
//

import Foundation

class Playlist: NSObject, NSCoding {
    
    //MARK: Properties
    var label: String
    var tracks: [Track]=[]
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("playlists")
    
    //MARK: Types
    struct PropertyKey {
        static let label = "label"
        static let tracks = "tracks"
    }
    
    //MARK: Initialization
    init(label l:String, tracks:[Track] = [Track(label: "One"),Track(label: "Two"),Track(label: "Three"),Track(label: "Four"),Track(label: "Five")]){
        self.label=l
        self.tracks = tracks
        
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(label, forKey: PropertyKey.label)
        aCoder.encode(tracks,forKey: PropertyKey.tracks)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let label = aDecoder.decodeObject(forKey: PropertyKey.label) as? String else {
            print("Unable to encode!!!")
            return nil
        }
        
        guard let tracks = aDecoder.decodeObject(forKey: PropertyKey.tracks) as? [Track] else {
            print("Unable to encode from tracks!!!")
            return nil
        }
 
        
        // Must call designated initializer.
        self.init(label: label, tracks: tracks)
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

class Track: NSObject, NSCoding {
    var tLabel: String
    var min: Int
    var sec: Int
    
    struct PropertyKey{
        static let tLabel = "tLabel"
        static let min = "min"
        static let sec = "sec"
    }
    
    init(label l:String, min: Int = 0, sec: Int = 0){
        self.tLabel = l
        self.min = min
        self.sec = sec
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(tLabel, forKey: PropertyKey.tLabel)
        aCoder.encode(min,forKey: PropertyKey.min)
        aCoder.encode(sec,forKey: PropertyKey.sec)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let tLabel = aDecoder.decodeObject(forKey: PropertyKey.tLabel) as? String else {
            print("Unable to encode!!!")//debug
            return nil
        }
        
        let min = aDecoder.decodeInteger(forKey: PropertyKey.min)
        let sec = aDecoder.decodeInteger(forKey: PropertyKey.sec)
    
        
        // Must call designated initializer.
        self.init(label: tLabel, min: min, sec: sec)
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
