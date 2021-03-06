//
//  RootNavigationController.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let albumListViewController = storyboard?.instantiateViewController(withIdentifier: "AlbumListViewController") as? AlbumListViewController{
            albumListViewController.navigationController?.navigationBar.backItem?.hidesBackButton = true
            self.pushViewController(albumListViewController, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    


}
