//
//  CommnetsTableViewCell.swift
//  500App
//
//  Created by Juan Pablo Ghelfi on 6/20/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import UIKit

class CommnetsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    var theComment: Comment?
    
    func setup(commnets: Comment){
        
        theComment = commnets
        if let aComment = theComment{
            
            user.text = aComment.user?.userName
            comment.text = aComment.body
            
            if let avatar = aComment.user?.userPic{
                
                let avatarURL = URL(string: avatar)
                userAvatar.kf.setImage(with: avatarURL)
            }
            
            
        }
        
    }
    
    

}
