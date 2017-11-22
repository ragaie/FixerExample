//
//  ListDataController.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/22/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ListDataController: NSObject ,UITableViewDataSource,UITableViewDelegate{
    private var observerContext = 0


    var myView : ListDataView!
    var myModel : ListDataModel!
    
    override init() {
        super.init()
        myModel = ListDataModel()
        myModel.addObserver(self, forKeyPath:  "flage", options: .new, context: &observerContext)

    }

    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &observerContext {
            myView.tableViewData.reloadData()
            myView.view.isUserInteractionEnabled = true
            myView.indecatorView.isHidden = true
            if myModel.allItem.count == 0{
                
                myView.tableViewData.isHidden = true
            }

        }
        
    }
    
    
    
    func getLastData(){
      
        myView.indecatorView.isHidden = false
        myModel.retriveDataFromBackEnd()
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myModel.allItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! ListViewCell
        
        
        cell.setData(item: myModel.allItem[indexPath.row])
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 100
    }
    
    
    
   
    
}
