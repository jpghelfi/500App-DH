//
//  PictureDAO.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation
import TTMVC
import Alamofire

public class PictureDAO {
    
    func getPictureListFromApi(query: String, imageSize: String, completion: @escaping ([Picture]) -> Void){
        
        var paramDic: [String:String] = [:]
        paramDic["term"] = query
        paramDic["image_size"] = imageSize
        paramDic["consumer_key"] = "B7PV57oxjqU6qOlEnzrUDxyied2LWt81Vm9Dewuk"
        let keyDictionary = "photos"
        
        
        
        Alamofire.request("https://api.500px.com/v1/photos/search", parameters: paramDic).responseJSON(completionHandler: {
            
            myResponse in
            
            if let dictionary = myResponse.value as? [String:AnyObject],
                let results = dictionary[keyDictionary] as? [[String:AnyObject]]{
                
                var pictureArray: [Picture] = []
                
                for pictureDictionary in results {
                    if let picture = Picture(dictionary: pictureDictionary){
                        pictureArray.append(picture)
                    }
                    
                }
                
            completion(pictureArray)
            }
        })
        
    }
    
}
