import UIKit
import Jukebox

class ViewController: UIViewController, AudioPlayerDelegate {
    
    @IBOutlet weak var timestampLabel: UILabel!
    var audioPlayer = AudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer.delegate = self
    }
    
    @IBAction func playButtonPressed() {
        audioPlayer.play()
    }
    
    @IBAction func pauseButtonPressed() {
        audioPlayer.pause()
    }
    
    @IBAction func stopButtonPressed() {
        audioPlayer.stop()
    }
    
    @IBAction func goBack30ButtonPressed() {
        audioPlayer.jumbBack30Seconds()
    }
    
    @IBAction func goForward30ButtonPressed() {
        audioPlayer.jumpForward30Seconds()
    }
    
    func updateTimeStamp(timestamp: String) {
        timestampLabel.text = timestamp
    }
}

