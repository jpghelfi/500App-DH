//
//  Picture.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation
import TTMVC

public class Picture: TTGenericDTO {
    
    var id: NSNumber?
    var user: User?
    var userCameraName: String?
    var smallPictureURL: String?
    var bigPictureURL: String?
    var city: String?
    var country: String?
    var comments: [Comment]?
    

        
    override public func loadFromDictionary(_ dictionary: [String : AnyObject]){
        super.loadFromDictionary(dictionary)
            
        userCameraName = dictionary["camera"] as? String
        smallPictureURL = dictionary["image_url"] as? String
        
        if let userDictionary = dictionary["user"] as? [String:AnyObject]{
            
            user = User(dictionary: userDictionary)
        }
        

        
            
    }
    
    
}
