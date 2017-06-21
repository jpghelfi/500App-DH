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
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
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
        
        
        
    }

    
    
}
