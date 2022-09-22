//
//  UIButton+Extension.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import Foundation
import UIKit

extension UIButton {
    func applyConfiguration(withImage : String , tintColorImage : UIColor? = nil) {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = self.backgroundColor
        configuration.image = UIImage(named: withImage)
        configuration.titlePadding = 10
        configuration.imagePadding = 10
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        if let tintColorImage = tintColorImage {
            configuration.image = UIImage(named: withImage)?.withRenderingMode(.alwaysTemplate).withTintColor(tintColorImage)
        }
        self.configuration =  configuration
    }
}
