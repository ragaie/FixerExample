//
//  ListDataModel.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/22/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class ListDataModel: NSObject {
    @objc dynamic var flage : String! = ""

    var allItem : [ConvertItem]! = []
    
    override init() {
        
        
        super.init()
        
        
    }
    
    
    
    func retriveDataFromBackEnd(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        self.allItem = []

                var ref: DatabaseReference!
                ref = Database.database().reference()
        
                let userID = Auth.auth().currentUser?.uid
                ref.child("UserRecord").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
             
                    let value = snapshot.value as? NSDictionary
                    if value != nil{
                        for item in (value?.allKeys)!{
                            var tempData : [String : AnyObject]! = value![item as! String] as! [String : AnyObject]
                            var tempItem = ConvertItem()
                                tempItem.setObject(tempData)
                                self.allItem.append(tempItem)
                            }
                    
                        }
                    DispatchQueue.main.async { [unowned self] in
                        self.flage = "dataDone"
                    }
                    
                   // print(value)
                    // ...
                }) { (error) in
                    print(error.localizedDescription)
                    self.flage = "fail"

                }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

        
    }

}
