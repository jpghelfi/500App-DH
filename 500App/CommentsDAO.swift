//
//  CommentsDAO.swift
//  500App
//
//  Created by Juan Pablo Ghelfi on 6/20/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation
import TTMVC
import Alamofire

class CommentsDAO {
    
    
    func getCommentsListFromApi(pictureID: String, completion: @escaping ([Comment]) -> Void){
        
        
        var paramDic: [String:String] = [:]
        paramDic["consumer_key"] = "B7PV57oxjqU6qOlEnzrUDxyied2LWt81Vm9Dewuk"
        let keyDictionary = "comments"
        let url = "https://api.500px.com/v1/photos/" + pictureID + "/comments"
        
        
        Alamofire.request(url, parameters: paramDic).responseJSON(completionHandler: {
            
            myResponse in
            
            if let dictionary = myResponse.value as? [String:AnyObject],
                let results = dictionary[keyDictionary] as? [[String:AnyObject]]{
                
                var commentsArray: [Comment] = []
                
                for commnetsDictionary in results {
                    if let comment = Comment(dictionary: commnetsDictionary){
                        commentsArray.append(comment)
                    }
                    
                }
                
                completion(commentsArray)
            }
        })
        
    }
    
    
}
