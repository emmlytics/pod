import UIKit
import Emmlytics

class ViewController: UIViewController {
    
    //Emmlytics Set Up
    let url = "Http://emmlytics.mynetgear.com:8080/"
    let UserID = "Daren"
    let AppID = "{12345}" // Pick a unique ID - Ill get this assigned at some point.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let analytics = Emmlytics()
        analytics.UserID = UserID
        analytics.AppID = AppID
        analytics.url = url
        analytics.sendAnalytics(event: "appload")
    }
    
    
    
    @IBAction func hello(_ sender: UISwipeGestureRecognizer) {
        Emmlytics.show(viewController: self, url:url,appid:AppID,userID:UserID )
    }
}

