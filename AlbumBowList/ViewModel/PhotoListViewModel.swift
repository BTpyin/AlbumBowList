//
//  PhotoListViewModel.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//

import Foundation
import ObjectMapper
import RxSwift
import RxCocoa

class PhotoListViewModel : ViewModelType{
    
    var disposeBag = DisposeBag()

    var data = ""
    struct Input {
        
    }
    
    struct Output {
        let photosRelay = BehaviorRelay<[Album?]>(value:[])
    }
    
    struct InOut {
        
    }
    
    let input = Input()
    let output = Output()
    let inOut = InOut()
    
    init() {
        let path = Bundle.main.path(forResource: "1", ofType: "txt") // file path for file "data.txt"
        do {
            let string = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            data = string
        } catch {
            print("error:", error)
        }
//        guard let json = try? JSON(parseJSON: data) else {return}
        let response = Mapper<ResultPayload>().map(JSONString:data)
        output.photosRelay.accept(response?.results ?? [])
    }
}
