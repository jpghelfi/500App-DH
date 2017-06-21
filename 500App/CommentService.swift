//
//  CommentService.swift
//  500App
//
//  Created by Juan Pablo Ghelfi on 6/20/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import Foundation
import TTMVC

class CommentService {

    func getCommentsFromApi(pictureID: String, completion: @escaping ([Comment]) -> Void){
        
        let commnetDAO = CommentsDAO()
        
        commnetDAO.getCommentsListFromApi(pictureID: pictureID, completion: {
            
            myCommnents in
            
            completion(myCommnents)
            
        })
    }



}
