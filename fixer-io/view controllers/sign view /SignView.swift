//
//  SignView.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import Firebase
class SignView: UIViewController {

    
    var myController : SignController!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var idecatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var signin: UIBarButtonItem!
    
    @IBOutlet weak var register: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myController = SignController()
        myController.myView = self

        
        
        if UserDefaults.standard.value(forKey: "password") != nil && UserDefaults.standard.value(forKey: "email") != nil
            
        {
            emailText.text = UserDefaults.standard.value(forKey: "email") as! String
            passwordText.text = UserDefaults.standard.value(forKey: "password") as! String
            register.isEnabled = false
       
        }
//        else{
//           signin.isEnabled = false
//        }
     
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SignInAction(_ sender: Any) {
        
        myController.loginFromNSuserDeafult()
        
    }
    
    
    
    
    @IBAction func goButton(_ sender: Any) {
         myController.register()
      
    }
    
    
 

}
