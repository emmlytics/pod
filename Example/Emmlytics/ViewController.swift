import UIKit
import Emmlytics

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func hello(_ sender: UISwipeGestureRecognizer) {
        
        // Pass the Viewcontroller to return too
        
        Emmlytics.show(viewController: self)
    }
}

