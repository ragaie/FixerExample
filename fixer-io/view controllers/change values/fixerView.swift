//
//  ViewController.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class fixerView: UIViewController {

    
    
    @IBOutlet weak var fromPicker: UIPickerView!
    
    @IBOutlet weak var toPicker: UIPickerView!
    
    @IBOutlet weak var enterText: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var indecatorView: UIActivityIndicatorView!
    
    
    @IBOutlet weak var fromtextLabel: UILabel!
    
    @IBOutlet weak var totextLabel: UILabel!
    
    
    @IBOutlet weak var saveToDataBase: UIBarButtonItem!
    
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
        
        saveToDataBase.target = myController

        saveToDataBase.action = #selector(fixerController.SaveToDataBase(_:))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func logoutAction(_ sender: Any) {
        
        
     myController.signOut()
        //firstScreenSign
    }
    
    
    @IBAction func getAllData(_ sender: Any) {
        
        
        
        //listViewId
        
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "listViewId")
        self.navigationController?.pushViewController(nextViewController!, animated: true)
        
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
//
//        let userID = Auth.auth().currentUser?.uid
//        ref.child("UserRecord").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//
//
//            print(value)
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
    }
    
    

}



