import UIKit
import Emmlytics

class ViewController: UIViewController {
    @IBAction func hello(_ sender: UISwipeGestureRecognizer) {
        Emmlytics.show(viewController: self)
    }
}

