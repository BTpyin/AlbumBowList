//
//  AlbumDetailViewModel.swift
//  PhotoBook
//
//  Created by Bowie Tso on 22/6/2021.
//

import Foundation
import RxSwift
import RxCocoa

class AlbumDetailViewModel: ViewModelType{

    var disposeBag = DisposeBag()

    struct Input {
        let photoRelay = BehaviorRelay<Photo?>(value: nil)
        let showCollectionDidSelectedRelay = PublishRelay<Void>()
        let showArtistDidSelectedRelay = PublishRelay<Void>()
    }
    
    struct Output {
        let imageURLRelay = BehaviorRelay<String?>(value: nil)
        let artistNameRelay = BehaviorRelay<String?>(value: nil)
        let collectionNameRelay = BehaviorRelay<String?>(value: nil)
        let dateRelay = BehaviorRelay<String?>(value: nil)
        let genreRelay = BehaviorRelay<String?>(value: nil)
        let trackCountRelay = BehaviorRelay<Int?>(value: nil)
        let countryRelay = BehaviorRelay<String?>(value: nil)
        let priceRelay = BehaviorRelay<Double?>(value: nil)
        let cpyRightTextRelay = BehaviorRelay<String?>(value: nil)
        let collectionUrlRelay = BehaviorRelay<String?>(value: nil)
        let artistUrlRelay = BehaviorRelay<String?>(value: nil)

    }
    
    struct InOut {
        
    }
    
    let input = Input()
    let output = Output()
    let inOut = InOut()
    
    init() {
        
        input.photoRelay.map { $0?.artworkUrl100 }
            .bind(to: output.imageURLRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.artistName }
            .bind(to: output.artistNameRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.collectionName }
            .bind(to: output.collectionNameRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.copyright }
            .bind(to: output.cpyRightTextRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: $0?.releaseDate ?? Date())
        }
            .bind(to: output.dateRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.primaryGenreName }
            .bind(to: output.genreRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.trackCount }
            .bind(to: output.trackCountRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.country }
            .bind(to: output.countryRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.collectionPrice }
            .bind(to: output.priceRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.artistViewUrl }
            .bind(to: output.artistUrlRelay)
            .disposed(by: disposeBag)
        
        input.photoRelay.map { $0?.collectionViewUrl }
            .bind(to: output.collectionUrlRelay)
            .disposed(by: disposeBag)
        
    }
    
}
