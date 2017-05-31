import UIKit
import Foundation

open class emmViewController: UIViewController {
        var url:String!
        var appid:String!
        var UserID:String!
    
    @IBAction func sendAnalytic(_ sender: Any) {
        
        let analytics = Emmlytics()
        analytics.UserID = UserID
        analytics.AppID = appid
        analytics.url = url
        analytics.sendAnalytics(event:"ButtonPress")
        
    }
    
    @IBOutlet weak var feedTXTview: UITextView!
    
    @IBAction func btnHappy(_ sender: Any) {
        
        let feedback = Emmlytics()
        feedback.UserID = UserID
        feedback.AppID = appid
        feedback.url = url
        feedback.sendFeedback(feedback: self.feedTXTview.text!,rating: 3)
        self.dismiss(animated:true)
    }
    @IBAction func btnMeh(_ sender: Any) {
        let feedback = Emmlytics()
        feedback.UserID = UserID
        feedback.AppID = appid
        feedback.url = url
        feedback.sendFeedback(feedback: self.feedTXTview.text!,rating: 2)
        self.dismiss(animated:true)
    }
    
    @IBAction func btnSad(_ sender: Any) {
        let feedback = Emmlytics()
        feedback.UserID = UserID
        feedback.AppID = appid
        feedback.url = url
        feedback.sendFeedback(feedback: self.feedTXTview.text!,rating: 1)
        self.dismiss(animated:true)
    }
   }



