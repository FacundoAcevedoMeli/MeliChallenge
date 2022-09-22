//
//  UIImageView+Extension.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImageFromURL(url : String?){
        guard let url = url , let urlImage = URL(string: url) else { return }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: urlImage, placeholder: nil, options: [] , completionHandler: nil )
    }
}
