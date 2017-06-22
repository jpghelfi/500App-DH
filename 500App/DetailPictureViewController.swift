//
//  DetailPictureViewController.swift
//  500App
//
//  Created by Juan Pablo Ghelfi on 6/20/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import UIKit

class DetailPictureViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    var picture: Picture?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = picture?.name
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.edgesForExtendedLayout = []
        
        drawHeader()
        
        let commnentsService = CommentService()
        
        if let picID = picture?.id{
            
            commnentsService.getCommentsFromApi(pictureID: "\(picID)", completion: {
                
                myCommnents in
                
                self.picture?.comments = myCommnents
                self.tableView.reloadData()
            })
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if let count = picture?.comments?.count{
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath)
        
        if let aCell = cell as? CommnetsTableViewCell, let comment = picture?.comments?[indexPath.row]{
            
            aCell.setup(commnets: comment)
            
        }
        
        return cell
    }

    func drawHeader(){
        
        if let userAvatar = self.picture?.user?.userPic,
            let pic = self.picture?.smallPictureURL {
            
            let avatarURL = URL(string: userAvatar )
            self.avatarImageView.kf.setImage(with: avatarURL)
            
            let picURL = URL(string: pic )
            self.imageView.kf.setImage(with: picURL)
            
        }
        
        self.nameLabel.text = self.picture?.user?.userName
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
}
