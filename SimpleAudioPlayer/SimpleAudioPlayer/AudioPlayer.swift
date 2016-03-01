//
//  AudioPlayer.swift
//  SimpleAudioPlayer
//
//  Created by Daniel Amarante on 2/29/16.
//  Copyright © 2016 Daniel Amarante. All rights reserved.
//

import UIKit
import Jukebox

class AudioPlayer: NSObject {
    
    var jukebox: Jukebox!
    
    override init() {
        super.init()
        let path = NSBundle.mainBundle().pathForResource("Test", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        jukebox = Jukebox(delegate: self, items: [JukeboxItem(URL: url)])
    }

}

extension AudioPlayer: JukeboxDelegate {
    func jukeboxStateDidChange(jukebox: Jukebox) {
        
    }
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        
    }
    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        
    }
    
}