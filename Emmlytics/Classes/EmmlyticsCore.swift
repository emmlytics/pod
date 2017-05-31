import Foundation
import UIKit
import CoreTelephony
import SystemConfiguration.CaptiveNetwork

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod, swizzledMethod)
}

func getWiFiSsid() -> String? {
    var ssid: String?
    if let interfaces = CNCopySupportedInterfaces() as NSArray? {
        for interface in interfaces {
            if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                break
            }
        }
    }
    return ssid
}

func deviceRemainingFreeSpaceInBytes() -> Int64? {
    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    guard
        let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
        let freeSize = systemAttributes[.systemFreeSize] as? NSNumber
        else {
            // something failed
            return nil
    }
    return freeSize.int64Value
}



    let systemVersion = UIDevice.current.systemVersion
    let model = UIDevice.current.model
    let battery = UIDevice.current.batteryLevel

    let batterystate = UIDevice.current.batteryState.rawValue
    let orientation = UIDevice.current.orientation.rawValue
    let localizedmodel = UIDevice.current.localizedModel
    let devicename = UIDevice.current.name
    let systemname = UIDevice.current.systemName
    let networkInfo = CTTelephonyNetworkInfo()
    let carrier = networkInfo.subscriberCellularProvider
    let carrierName = carrier?.carrierName;
    let countrycodeiso = carrier?.isoCountryCode;
    let countrycode = carrier?.mobileCountryCode;
    let networkcode = carrier?.mobileNetworkCode;
    let uniqueid = UIDevice.current.identifierForVendor!.uuidString
    let networkString = networkInfo.currentRadioAccessTechnology




public class Emmlytics

    
    
    
{
    //Setup Fallback Variables
    public init() {} // not sure why i have to add this POS. Stack Overflow is your friend
    public var AppID = "changeme"
    public var UserID = "changeme"
    public var url = "changeme"
    var DataCarrierName = "No Carrier"
    var Datacountrycodeiso = "Unknown"
    var Datacountrycode = "Unknown"
    var Datanetworkcode = "Unknown"
    var connectivity = "Unknown"
    var currentssid = "Not Connected"
    var memory = "unavailable"
    
  
    
public func sendAnalytics(event:String)
    {
        if carrier != nil {DataCarrierName = (carrierName! as String)}
        if carrier != nil {Datacountrycodeiso = (countrycodeiso! as String)}
        if carrier != nil {Datacountrycode = (countrycode! as String)}
        if carrier != nil {Datanetworkcode = (networkcode! as String)}
        
        if networkString == CTRadioAccessTechnologyLTE{
          connectivity = "4G"
        }else if networkString == CTRadioAccessTechnologyWCDMA{
            connectivity = "3G"
        }else if networkString == CTRadioAccessTechnologyEdge{
           connectivity = "EDGE"
        }
        
        let ssid = getWiFiSsid()
        if ssid != nil {currentssid = ssid!}
        
        
        let locale = Locale.current
        
        
        if let bytes = deviceRemainingFreeSpaceInBytes() {
         memory = "\(bytes)"
            
        }
        UIDevice.current.isBatteryMonitoringEnabled = true
        let battery = UIDevice.current.batteryLevel
//        
//        print(systemVersion)
//        print(model)
//        print(battery)
//        print(batterystate)
//        print(orientation)
//        print(localizedmodel)
//        print(devicename)
//        print(systemname)
//        print (DataCarrierName)
//        print (Datacountrycodeiso)
//        print (Datacountrycode)
//        print (Datanetworkcode)
//        print (currentssid)
//        
        let URLString = url + "analytic"
        let bodyParameters = [
            
            "AppID": AppID,
            "UserID": UserID,
            "Event": event,
            "OSVersion": systemVersion,
            "Model:": model,
            "Battery": battery,
            "BatteryState": batterystate,
            "Ssid": currentssid,
            "UniqueID":uniqueid,
            "Orientation": orientation,
            "Locale": locale,
            "LocalizedModel":localizedmodel,
            "DeviceName": devicename,
            "SystemName": systemname,
            "DataCarrier": DataCarrierName,
            "Connectivity":connectivity,
            "Datacountrycode": Datacountrycode,
            "Datanetworkcode": Datanetworkcode,
            "AvailableMemory": memory,
            
            
            
            
            
        ] as [String : Any]
        
        
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        guard let URL = URL(string:URLString) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let bodyString = bodyParameters.queryParameters
        request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    public class func show(viewController: UIViewController, url:String, appid:String, userID:String) {

        let bundle = Bundle(identifier:"org.cocoapods.Emmlytics")
        
        let storyboard = UIStoryboard(name: "emmlytics", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! emmViewController
        
        controller.url = url
        controller.appid = appid
        controller.UserID = userID
        
        viewController.present(controller, animated: true) {
        }
    }

// ---------------------------------- Send DATA --------------------------------------------------------
public func sendFeedback(feedback: String, rating: Int)
    {
        let URLString = url + "feedback"
        
        let bodyParameters = [
            "AppID": AppID,
            "UserID": UserID,
            "Rating": rating,
            "feedback": feedback,
            //"PowerStatus":status,
            //"language":language
            
        ] as [String : Any]
        
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: URLString) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        // Headers
        
        request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // Form URL-Encoded Body
        
        let bodyString = bodyParameters.queryParameters
        request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    
}


protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    /**
     Creates a new URL by adding the given query parameters.
     @param parametersDictionary The query parameter dictionary to add.
     @return A new URL.
     */
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
       
        
    }

}


    
func SendNetmon(url:String,AppID: String, UserID: String,call: String,method: String,result:String,latency:String,bytesmoved: String )
    {
        let URLString = url+"netmon"
        let bodyParameters = [
            "AppID": AppID,
            "UserID": UserID,
            "URL":call,
            "Method":method,
            "Result":result,
            "Latency":latency,
            "DataMoved":bytesmoved
        ]
        
        
        
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: URLString) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let bodyString = bodyParameters.queryParameters
        request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
 
extension URLSession {
    
    open override class func initialize() {
        // make sure this isn't a subclass
        guard self === URLSession.self else { return }
        let originalSelector = #selector((self.dataTask(with:completionHandler:)) as (URLSession) -> (URLRequest, @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask)
        let swizzledSelector = #selector((self.my_dataTaskWithRequest(with:completionHandler:)) as (URLSession) -> (URLRequest, @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask)
        swizzling(self, originalSelector, swizzledSelector)
    }
    // Swizzled Method
    func my_dataTaskWithRequest(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        
        let startTime = NSDate.timeIntervalSinceReferenceDate
        var currentTime: TimeInterval = 0
        
        return my_dataTaskWithRequest(with: request, completionHandler: { (data, response, error) in
            do {
                if let data = data {
                    
                    let resultJson = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                    currentTime = NSDate.timeIntervalSinceReferenceDate
                    let elapsedTime = currentTime - startTime
                    
                    
                    
                    //--------------------------------------------------------------
                    
                    let URLfield = response?.url?.absoluteString
                    print ("URL:",URLfield!)
                    print ( "Request :",request.httpMethod!)
                    print("Bytes Sent :",data)
                    
                    let elapsedString = String(format: "%.1f",Double(elapsedTime * 1000))
                    print ("Round Trip Response time (ms) ",elapsedString, " ms")
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print ("Status : ", statusCode)
                
                    let teststring: String = "\(data)"
                    
                    let endIndex = teststring.index(teststring.endIndex, offsetBy: -6)
                    let datastring = teststring.substring(to: endIndex)
                    // Im so sorry about this - its a quick and dirty
                    
                    if URLfield! != "http://emmlytics.mynetgear.com:8080/netmon"{
                    
                        SendNetmon(url:"http://emmlytics.mynetgear.com:8080/", AppID: "1234", UserID: "Justyn", call:URLfield!, method: request.httpMethod!, result: String(statusCode), latency: elapsedString, bytesmoved: datastring)
                    
                    //--------------------------------------------------------------
                    }
                }
                else {
                    
                    print ( "Request",request.httpMethod?.description)
                    print ( "Error :----",error.debugDescription)
                    
                }
            } catch {
                print("Swizzelled Error -> \(error)")
            }
            
        })
    }
    
    
    
}



