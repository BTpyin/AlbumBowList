//
//  PhotoListTableViewCell.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class AlbumListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
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
        self.selectionStyle = .none
        albumImageView.clipsToBounds = true
        albumImageView.contentMode = .scaleAspectFill
        albumImageView.roundCorners(cornerRadius: 7)
        cellContentView.layer.applySketchShadow(
            color: .black,
                alpha: 0.5,
                x: 0,
                y: 0,
                blur: 6,
                spread: 0)
        
    }
    
    func setBinding(){
        
        viewModel.output.imageURLRelay
            .subscribe(onNext: { [weak self] urlString in
                self?.albumImageView.kf.setImage(with: URL(string: urlString ?? ""))
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
