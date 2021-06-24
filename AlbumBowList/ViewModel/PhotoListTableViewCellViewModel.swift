
//
//  PhotoListTableViewCellViewModel.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//

import UIKit
import RxSwift
import RxCocoa


extension AlbumListTableViewCell{
    
    class PhotoListTableViewCellViewModel: ViewModelType{
        let disposeBag = DisposeBag()
        
        struct Input {
            let albumRelay = BehaviorRelay<Album?>(value: nil)
            let bookmarkDidSelectedRelay = PublishRelay<Void>()
        }
        
        struct Output {
            let imageURLRelay = BehaviorRelay<String?>(value: nil)
            let artistNameRelay = BehaviorRelay<String?>(value: nil)
            let collectionNameRelay = BehaviorRelay<String?>(value: nil)
            let cpyRightTextRelay = BehaviorRelay<String?>(value: nil)
        }
        
        struct InOut {
            
        }
        
        let input = Input()
        let output = Output()
        let inOut = InOut()
        
        init() {
            
            input.albumRelay.map { $0?.artworkUrl100 }
                .bind(to: output.imageURLRelay)
                .disposed(by: disposeBag)
            
            input.albumRelay.map { $0?.artistName }
                .bind(to: output.artistNameRelay)
                .disposed(by: disposeBag)
            
            input.albumRelay.map { $0?.collectionName }
                .bind(to: output.collectionNameRelay)
                .disposed(by: disposeBag)
            
            input.albumRelay.map { $0?.copyright }
                .bind(to: output.cpyRightTextRelay)
                .disposed(by: disposeBag)
            
        }
    }
}
