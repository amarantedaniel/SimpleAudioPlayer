import UIKit
import Jukebox

class ViewController: UIViewController, JukeboxDelegate {
    
    var jukebox: Jukebox!
    @IBOutlet weak var timestampLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("Test", ofType: "mp3")
        let url = NSURL(fileURLWithPath: path!)
        jukebox = Jukebox(delegate: self, items: [JukeboxItem(URL: url)])
    }
    
    @IBAction func playButtonPressed() {
        jukebox.play()
    }
    
    @IBAction func pauseButtonPressed() {
        jukebox.pause()
    }
    
    @IBAction func stopButtonPressed() {
        jukebox.stop()
    }
    
    @IBAction func goBack30ButtonPressed() {
        let currentTime = jukebox.currentItem?.currentTime
        let currentTimeInt = Int(currentTime!)
        jukebox.seekToSecond(currentTimeInt - 30)
    }
    
    @IBAction func goForward30ButtonPressed() {
        let currentTime = jukebox.currentItem?.currentTime
        let currentTimeInt = Int(currentTime!)
        jukebox.seekToSecond(currentTimeInt + 30)
    }
    
    func jukeboxStateDidChange(jukebox: Jukebox) {
        
    }
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        
    }
    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        updateTime()
    }
    
    func updateTime() {
        let currentTime = Int(jukebox.currentItem!.currentTime!)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        timestampLabel.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        
    }


}

