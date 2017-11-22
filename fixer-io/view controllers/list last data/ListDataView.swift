//
//  ListDataView.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/22/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ListDataView: UIViewController {

    
    
    @IBOutlet weak var tableViewData: UITableView!
    
    @IBOutlet weak var indecatorView: UIActivityIndicatorView!
    
    var myController : ListDataController!
    override func viewDidLoad() {
        super.viewDidLoad()

        myController = ListDataController()
        myController.myView = self
        
        tableViewData.dataSource = myController
        tableViewData.delegate = myController
       
        myController.getLastData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   


}
