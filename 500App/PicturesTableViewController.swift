//
//  PicturesTableViewController.swift
//  500App
//
//  Created by Digital House on 19/6/17.
//  Copyright © 2017 Digital House. All rights reserved.
//

import UIKit

class PicturesTableViewController: UITableViewController {
    
    var pictureArray: [Picture] = []
    var userQuery: String?
    var userImageSize: String? = "3"

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let pictureService = PictureService()
        
        if let theQuery = userQuery, let theSize = userImageSize{
            
            pictureService.getPicturesFromApi(query: theQuery, imageSize: theSize, completion: {
                
                myPictures in
                
                self.pictureArray = myPictures
                self.tableView.reloadData()
                
            })
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictureArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath)
        
        let picture = pictureArray[indexPath.row]
        
        
        if let pictureCell = cell as? PictureTableViewCell{
            
            pictureCell.setup(aPicture: picture)
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let controller = self.navigationController?.storyboard?.instantiateViewController(withIdentifier: "detailPictureViewController") as? DetailPictureViewController{
            
            
            controller.picture = self.pictureArray[indexPath.row]
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
    }
    
    

}
