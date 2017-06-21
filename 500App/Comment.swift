//
//  Comment.swift
//  500App
//
//  Created by Juan Pablo Ghelfi on 6/20/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation
import TTMVC

class Comment: TTGenericDTO  {
    
    var body: String?
    var user: User?
    
    override func loadFromDictionary(_ dictionary: [String : AnyObject]) {
        super.loadFromDictionary(dictionary)
        
        if let userDictionary = dictionary["user"] as? [String:AnyObject]{
            
            user = User(dictionary: userDictionary)
        }
    }
    
}
