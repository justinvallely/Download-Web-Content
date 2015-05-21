//
//  ViewController.swift
//  Download Web Content
//
//  Created by Justin Vallely on 5/18/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Define the URL
        let url = NSURL(string: "http://www.stackoverflow.com")
        
        // Go get the data
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in // This is called a closure
            
            if error == nil {
                
                // Convert the data into readable html text
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(urlContent)
                
                // stop waiting for anything else to happen and do the update right away
                dispatch_async(dispatch_get_main_queue()) {
                    
                    // Load the data into the webView
                    // Use "self." to refer to items outside the closure
                    self.webView.loadHTMLString(urlContent as! String, baseURL: nil)
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

