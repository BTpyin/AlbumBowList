//
//  AlbumDetailViewController.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit
import Kingfisher

class AlbumDetailViewController: BaseViewController {

    var viewModel = AlbumDetailViewModel()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var albumCardView: UIView!
    
    @IBOutlet weak var albumTopView: UIView!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var seperationView: UIView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    @IBOutlet weak var detailSectionStackView: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var showCollectionButton: UIButton!
    @IBOutlet weak var showArtistButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setBinding()
        // Do any additional setup after loading the view.
    }
    
    
    func initUI(){
        
        albumTopView.roundCorners(cornerRadius: 25)
//        albumCardView.roundCorners(.allCorners, radius: 25)
        albumCardView.roundCorners(cornerRadius: 25)
//        albumTopView.backgroundColor = UIColor.init(red: 196, green: 219, blue: 255)
        albumImageView.clipsToBounds = true
        albumImageView.contentMode = .scaleAspectFill
        albumImageView.roundCorners(cornerRadius: 7)
        albumCardView.layer.applySketchShadow(
            color: .black,
                alpha: 0.5,
            x: 0,
            y: 0.5,
                blur: 7,
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
        
        viewModel.output.dateRelay
            .bind(to: dateLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.output.trackCountRelay.map{
            return "\(String(describing: $0!))"
        }.bind(to: trackCountLabel.rx.text)
        .disposed(by: disposeBag)
        
        viewModel.output.priceRelay.map{
            return "$ \(String(describing: $0!))"
        }.bind(to: priceLabel.rx.text)
        .disposed(by: disposeBag)
        
        viewModel.output.genreRelay
            .bind(to: genreLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.output.countryRelay
            .bind(to: countryLabel.rx.text)
            .disposed(by: disposeBag)
        
        showCollectionButton.rx.tap.bind{ [self] in
            if let webViewController = storyboard?.instantiateViewController(withIdentifier: "BaseWebViewController") as? BaseWebViewController{
                webViewController.url = viewModel.output.collectionUrlRelay.value ?? ""
                webViewController.webviewTitle = viewModel.output.collectionNameRelay.value
                self.navigationController?.pushViewController(webViewController, animated: true)
            }
        }.disposed(by: disposeBag)
        
        showArtistButton.rx.tap.bind{ [self] in
            if let webViewController = storyboard?.instantiateViewController(withIdentifier: "BaseWebViewController") as? BaseWebViewController{
                webViewController.url = viewModel.output.artistUrlRelay.value ?? ""
                webViewController.webviewTitle = viewModel.output.artistNameRelay.value
                self.navigationController?.pushViewController(webViewController, animated: true)
            }
        }.disposed(by: disposeBag)
    }


}
