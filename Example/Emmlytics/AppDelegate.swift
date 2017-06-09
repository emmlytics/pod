import UIKit
import Emmlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UserDefaults.standard.set("Dtaylor@gmail.com", forKey: "emmlyticsUserID")
        UserDefaults.standard.set("https://emmlytics.mynetgear.com:8443/", forKey: "emmlyticsURL")
        UserDefaults.standard.set("Pomodoroban", forKey: "emmlyticsAppId")
        
        Emmlytics().sendAnalytics(event: "appload")
        
        return true
    }
}

