//
//  ViewModelType.swift
//  AlbumBowList
//
//  Created by Bowie Tso on 22/6/2021.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get }
//    func transform(input: Input) -> Output
}
