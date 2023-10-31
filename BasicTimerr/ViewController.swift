// Importing the UIKit library, which provides the necessary infrastructure for your iOS or tvOS apps.
import UIKit

// ViewController is a subclass of UIViewController, which is a fundamental building block of iOS apps.
class ViewController: UIViewController {
    
    // Declaring a Timer object that will be used to update the clock display.
    var timer = Timer()
    // Declaring a boolean variable to track whether the timer is paused.
    var isPause = false
    // Declaring an integer variable to track the remaining time, initialized to 210 seconds.
    var time = 210
    
    // Connecting the clockDisplay label from the storyboard to the code.
    @IBOutlet weak var clockDisplay: UILabel!
    
    // Defining a function that decreases the timer by 1 every second and updates the clock display.
    @objc func decreaseTimer() {
        if time > 0 {
            time -= 1
            clockDisplay.text = String(time)
        } else {
            timer.invalidate() // If time runs out, stop the timer.
        }
    }
    
    // Defining an action for the play button. When tapped, this function starts the timer.
    @IBAction func playButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    // Defining an action for the pause button. When tapped, this function pauses the timer.
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    // Defining an action to decrease the timer by 10 seconds.
    @IBAction func timerResetNegative(_ sender: Any) {
        time -= 10
        clockDisplay.text = String(time)
    }
    
    // Defining an action to increase the timer by 10 seconds, with a maximum limit of 210 seconds.
    @IBAction func timerResetPositive(_ sender: Any) {
        time += 10
        if time < 210 {
            clockDisplay.text = String(time)
        } else {
            timer.invalidate() // If time exceeds 210 seconds, set it back to 210 and stop the timer.
        }
    }
    
    // Defining an action to reset the timer back to 210 seconds.
    @IBAction func resetButton(_ sender: Any) {
        time = 210
    }
    
    // A system callback function called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
