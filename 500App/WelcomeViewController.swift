//
//  WelcomeViewController.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var searchTextFiled: UITextField!
    
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "picturesController") as? PicturesTableViewController{
            
            controller.userQuery = searchTextFiled.text
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
}
