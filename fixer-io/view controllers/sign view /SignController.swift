//
//  SignController.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/21/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import Firebase
class SignController: NSObject {
    
    var myView : SignView!
    
    override init() {
        
        super.init()
    }

    
    
    
    func register(){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        myView.idecatorView.isHidden = false
        Auth.auth().createUser(withEmail: myView.emailText.text!, password: myView.passwordText.text!) { (user, error) in
            if error != nil {
                 return
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            UserDefaults.standard.set(self.myView.emailText.text!, forKey: "email")
            UserDefaults.standard.set(self.myView.passwordText.text!, forKey: "password")
            self.myView.idecatorView.isHidden = true
          self.navigateToView()
        }
        
        
    }
    
    
    
    func loginFromNSuserDeafult(){
        
        
        if myView.emailText.text != "" &&  myView.passwordText.text != ""
       // if UserDefaults.standard.value(forKey: "password") != nil && UserDefaults.standard.value(forKey: "email") != nil
        {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            myView.idecatorView.isHidden = false
            
            Auth.auth().signIn(withEmail:  myView.emailText.text!, password: myView.passwordText.text!) { (user, error) in
                if error != nil {
                    return
                }
                self.myView.idecatorView.isHidden = true
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                UserDefaults.standard.set(self.myView.emailText.text!, forKey: "email")
                UserDefaults.standard.set(self.myView.passwordText.text!, forKey: "password")
                self.navigateToView()
            }
        }
    }
    
    
    
    
    func navigateToView(){
        
        let nextViewController = self.myView.storyboard?.instantiateViewController(withIdentifier: "convertViewID")
        self.myView.navigationController?.present(nextViewController!, animated: true, completion: nil)
        
        
    }
    
    
}
