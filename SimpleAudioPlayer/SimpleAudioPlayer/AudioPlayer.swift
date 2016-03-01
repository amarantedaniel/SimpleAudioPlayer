import UIKit
import Jukebox
import Bond

class AudioPlayer: NSObject {
    
    var jukebox: Jukebox!
    var timestamp = Observable("00:00")
    
    override init() {
        super.init()
        let path = NSBundle.mainBundle().pathForResource("Test", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        jukebox = Jukebox(delegate: self, items: [JukeboxItem(URL: url)])
    }
    
    func play() {
        jukebox.play()
    }
    
    func pause() {
        jukebox.pause()
    }
    
    func stop() {
        jukebox.stop()
    }
    
    func jumpForward30Seconds() {
        let currentTime = jukebox.currentItem?.currentTime
        let currentTimeInt = Int(currentTime!)
        jukebox.seekToSecond(currentTimeInt + 30)
    }
    
    func jumbBack30Seconds() {
        let currentTime = jukebox.currentItem?.currentTime
        let currentTimeInt = Int(currentTime!)
        jukebox.seekToSecond(currentTimeInt - 30)
    }
    
    func getCurrentTime() -> String {
        let currentTime = Int(jukebox.currentItem!.currentTime!)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        return NSString(format: "%02d:%02d", minutes,seconds) as String
    }

}

extension AudioPlayer: JukeboxDelegate {
    func jukeboxStateDidChange(jukebox: Jukebox) {
        
    }
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        
    }
    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        timestamp.value = getCurrentTime()
    }
    
}
