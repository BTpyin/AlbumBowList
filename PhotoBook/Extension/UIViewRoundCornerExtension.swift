//
//  UIViewRoundCornerExtension.swift
//  PhotoBook
//
//  Created by Bowie Tso on 20/6/2021.
//

import UIKit

extension UIView {
  func roundCorners(cornerRadius: Double) {
    self.layer.cornerRadius = CGFloat(cornerRadius)
    self.clipsToBounds = true
  }
  
}
