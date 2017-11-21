//
//  fixerModel.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class fixerModel: NSObject {

    
    //https://api.fixer.io/latest
    
     var tempFixorObject : FixerData!
    
    @objc dynamic var flage : String! = ""
    
    override init() {
        
        super.init()
        tempFixorObject = FixerData()
    }
    
    
    func getAllCurrency(){
        
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let requestURL: NSURL = NSURL(string: "https://api.fixer.io/latest")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
            
                if data != nil{
                    
                    do {
                        var   dictonary =  try JSONSerialization.jsonObject(with: data!, options: []) as! [String:AnyObject]
                    
                            DispatchQueue.main.async { [unowned self] in
                                self.tempFixorObject.setObject(dictonary)
                                self.flage = "dataDone"
                            }
                    } catch let error as NSError {
                        print(error)
                    }
                   
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false

            } else  {
                print("Failed")
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                UIAlertView.init(title: "Alert", message: "Something wrong with Server", delegate: nil, cancelButtonTitle: "Dismiss").show()

            }
        }
        task.resume()
        
    }

}
