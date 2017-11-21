//
//  Currency.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

struct FixerData {
    var base : String!
    var date : String!
    
    var allRate : [Currency]! = []
    
    
    mutating func setObject(_ result : [String : AnyObject]) {
        
        
        
        //  print(rateingCount)
        //print(restID)
        base = result["base"] as? String ?? ""
        date = result["date"] as? String ?? ""
        if  result["rates"] != nil {
            
            allRate = []
            
            var tempDict = result["rates"] as!NSDictionary
            
            
            for item in tempDict.allKeys{
                var tempCurrency = Currency()
                    
                    tempCurrency.setObject(item  as! String, value: tempDict[item as! String] as! Double)

                allRate.append(tempCurrency)

            }
        
            
        }

    }
    
    
}
        
        

struct Currency {
    
    var name : String!
    var value : Double!
    
    
    mutating func setObject(_ tempName : String, value : Double) {
        
        
        self.name = tempName
        self.value = value
    }
    
    
}

//"base":
//"EUR",
//"date":
//"2017-11-20",

//"rates":
//{
//    "AUD":
//    1.5592,

