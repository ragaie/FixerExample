//
//  fixerController.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class fixerController: NSObject,UIPickerViewDelegate,UIPickerViewDataSource {
 
    
    
    
    var myModel : fixerModel!
    var myView : fixerView!
    private var observerContext = 0
    
    var fromIndex : Int! = 0
    var toIndex : Int! = 0

    override init() {
        
        super.init()
        
        myModel = fixerModel()
        
        
      //  myModel.addObserver(self, forKeyPath:  #keyPath(fixerModel.flage), options: [.new, .old], context: &observerContext)
           myModel.addObserver(self, forKeyPath:  "flage", options: .new, context: &observerContext)
      
       
    }

   
    
    func callApi(){
        
        
        
        myView.view.isUserInteractionEnabled = false
        myModel.getAllCurrency()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &observerContext {
            
            
            myView.fromPicker.reloadAllComponents()
            myView.toPicker.reloadAllComponents()
            
            
            myView.fromPicker.reloadInputViews()
            myView.toPicker.reloadInputViews()
            myView.dateLabel.text = myModel.tempFixorObject.date

            myView.totextLabel.text = myModel.tempFixorObject.allRate[0].name
            
            myView.resultLabel.text = "1"//String(myModel.tempFixorObject.allRate[0].value)
            
            myView.fromtextLabel.text = myModel.tempFixorObject.allRate[0].name
            
            myView.enterText.text = "1"
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
        myView.indecatorView.isHidden = true
        
        myView.view.isUserInteractionEnabled = true

    }
        
        

    deinit {
        myModel.removeObserver(self, forKeyPath: "flage", context: &observerContext)
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myModel.tempFixorObject.allRate.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return myModel.tempFixorObject.allRate[row].name
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        
      
        
        if pickerView.tag == 0 {
            fromIndex = row
            
            myView.fromtextLabel.text = myModel.tempFixorObject.allRate [row].name
        }
        else{
            toIndex = row
            myView.totextLabel.text = myModel.tempFixorObject.allRate [row].name

        }
            
            var fromValue = ( myView.enterText.text! as! NSString).doubleValue
              var valueOfCurr = myModel.tempFixorObject.allRate [toIndex].value
     
            myView.resultLabel.text = String(fromValue * valueOfCurr!)

        
        if fromIndex == toIndex {
            
            myView.enterText.text = "1"
            myView.resultLabel.text = "1"
            
        }
    }
    
    
  @objc   func textFieldDidChange(_ sender: UITextField) {
  var fromValue : Double! = 0.0
   if myView.enterText.text != ""
    {
        
        fromValue = ( myView.enterText.text! as! NSString).doubleValue
        
    }
    
    
    
        var valueOfCurr = myModel.tempFixorObject.allRate [toIndex].value
        
        myView.resultLabel.text = String(fromValue! * valueOfCurr!)
    }
    
    
}
