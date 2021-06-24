//
//  RootNavigationController.swift
//  PhotoBook
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoListViewController = storyboard?.instantiateViewController(withIdentifier: "PhotoListViewController") as? PhotoListViewController{
            photoListViewController.navigationController?.navigationBar.backItem?.hidesBackButton = true
            self.pushViewController(photoListViewController, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    


}
