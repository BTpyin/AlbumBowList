//
//  AlbumDetailViewController.swift
//  PhotoBook
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit

class AlbumDetailViewController: BaseViewController {

    var viewModel = AlbumDetailViewModel()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var albumCardView: UIView!
    
    @IBOutlet weak var albumTopView: UIView!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    @IBOutlet weak var detailSectionStackView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var showCollectionButton: UIButton!
    @IBOutlet weak var showAlbumButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
