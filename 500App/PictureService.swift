//
//  PIctureService.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation


public class PictureService{
    
    func getPicturesFromApi(query: String, imageSize: String, completion: @escaping ([Picture]) -> Void){
        
        let pictureDAO = PictureDAO()
        
        pictureDAO.getPictureListFromApi(query: query, imageSize: imageSize, completion: {
            
            myPicture in
            
            completion(myPicture)
            
        })
    }
}

