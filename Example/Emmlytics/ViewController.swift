import UIKit
import Emmlytics

class ViewController: UIViewController {
    @IBAction func hello(_ sender: UISwipeGestureRecognizer) {
        Emmlytics.show(viewController: self)
    }
    @IBAction func TryGet(_ sender: Any) {
        
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
            
            /* Create the Request:
             GET App (GET https://emmlytics.mynetgear.com:8443/analytic)
             */
            
            guard var URL = URL(string: "https://emmlytics.mynetgear.com:8443/analytic") else {return}
            let URLParams = [
                "Event": "ButtonPress",
                ]
            URL = URL.appendingQueryParameters(URLParams)
            var request = URLRequest(url: URL)
            request.httpMethod = "GET"
            
            // Headers
            
            request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            // Form URL-Encoded Body
            
            //let bodyParameters = [  ] as
        
        
           // let bodyString = bodyParameters.queryParameters
            //request.httpBody = bodyString.data(using: .utf8, allowLossyConversion: true)
            
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
