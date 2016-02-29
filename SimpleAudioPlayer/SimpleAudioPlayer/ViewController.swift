import UIKit
import Jukebox

class ViewController: UIViewController, JukeboxDelegate {
    
    var jukebox: Jukebox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("Test", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        jukebox = Jukebox(delegate: self, items: [JukeboxItem(URL: url)])
        jukebox.play()

    }
    
    func jukeboxStateDidChange(jukebox: Jukebox) {
        
    }
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        
    }
    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        
    }


}

