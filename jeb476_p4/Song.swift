//
//  Song.swift
//  jeb476_p4
//
//  Created by Julia Bernstein on 4/10/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import Foundation


class Song {
    
    var songName: String
    var artistName: String
    var albumName: String
    var albumImageName: String
    
    init(songName: String, artistName: String, albumName: String, albumImageName: String) {
        self.songName = songName
        self.artistName = artistName
        self.albumName = albumName
        self.albumImageName = albumImageName
    }
    
    
    
}
