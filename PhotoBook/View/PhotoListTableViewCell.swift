//
//  PhotoListTableViewCell.swift
//  PhotoBook
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class PhotoListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let disposeBag = DisposeBag()

    var viewModel = PhotoListTableViewCellViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        setBinding()
        // Initialization code
    }

    
    func initUI(){
        photoImageView.clipsToBounds = true
        cellContentView.layer.applySketchShadow(
            color: .black,
                alpha: 0.5,
                x: 1,
                y: 1,
                blur: 4,
                spread: 0)
        
    }
    
    func setBinding(){
        
        viewModel.output.imageURLRelay
            .subscribe(onNext: { [weak self] urlString in
                self?.photoImageView.kf.setImage(with: URL(string: urlString ?? ""))
            }).disposed(by: disposeBag)
        
        viewModel.output.artistNameRelay
            .bind(to: artistNameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.output.collectionNameRelay
            .bind(to: collectionNameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.output.cpyRightTextRelay
            .bind(to: copyrightLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
