//
//  PictureTableViewCell.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import UIKit
import Kingfisher

class PictureTableViewCell: UITableViewCell {


    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var cameraTypeLabel: UILabel!
    
    @IBOutlet weak var pictureImage: UIImageView!
    
    func setup(aPicture: Picture){
        
        if let userAvatar = aPicture.user?.userPic,
            let userName = aPicture.user?.userName,
            let cameraType = aPicture.userCameraName,
            let picture = aPicture.smallPictureURL {
            
            let picURL = URL(string: picture)
            pictureImage.kf.setImage(with: picURL)
            
            let avatarURL = URL(string: userAvatar)
            avatar.kf.setImage(with: avatarURL)
            
        
            
            userNameLabel.text = userName
            cameraTypeLabel.text = cameraType
        
        }
        
        
        
        
        
    }
    
    
}
