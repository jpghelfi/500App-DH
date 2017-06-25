//
//  User.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation
import TTMVC

class User: TTGenericDTO{
    
    var userName: String?
    var userPic: String?
    var country: String?
    
    override func loadFromDictionary(_ dictionary: [String : AnyObject]) {
        super.loadFromDictionary(dictionary)
        
        userName = dictionary["username"] as? String
        userPic = dictionary["userpic_url"] as? String
    }
    
    
}
