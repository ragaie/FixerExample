//
//  ViewController.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class fixerView: UIViewController {

    
    
    @IBOutlet weak var fromPicker: UIPickerView!
    
    @IBOutlet weak var toPicker: UIPickerView!
    
    @IBOutlet weak var enterText: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var indecatorView: UIActivityIndicatorView!
    
    
    @IBOutlet weak var fromtextLabel: UILabel!
    
    @IBOutlet weak var totextLabel: UILabel!
    
    
    
    var myController : fixerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        myController = fixerController()
        myController.myView = self
        
        myController.callApi()
        fromPicker.delegate = myController
        fromPicker.dataSource = myController
        
        
        toPicker.delegate = myController
        toPicker.dataSource = myController
        
        enterText.addTarget(myController, action: #selector(fixerController.textFieldDidChange(_:)), for: .editingChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


