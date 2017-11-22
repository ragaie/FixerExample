//
//  ConvertItem.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/22/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import Foundation
struct ConvertItem {
    
    var date : String!
    
    
    var from : String!
    var to : String!
    
    var from_Count : String!
    var to_Count : String!

    
    
    mutating func setObject(_ result : [String : AnyObject]) {
        
        
        date = result["date"] as? String ?? ""
        from = result["from"] as? String ?? ""
        to = result["to"] as? String ?? ""
        from_Count = result["from_Count"] as? String ?? ""
        to_Count = result["to_Count"] as? String ?? ""

      

    }
    
}
