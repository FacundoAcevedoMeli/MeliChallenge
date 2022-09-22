//
//  UIColor+Extension.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import Foundation
import UIKit

extension UIColor {
    static var primary_color : UIColor  { return UIColor(named: "primary_color_meli") ?? .yellow }
    static var background_color_app : UIColor { return UIColor(named: "gray_background") ?? .gray }
    static var semi_black_title : UIColor { return UIColor(named: "semi_black_title")! }
    static var gray_description_label : UIColor { return UIColor(named: "gray_description_label")! }
    static var gray_indicator_background : UIColor { return UIColor(named: "gray_indicator_background")!}
    static var blue_button_background : UIColor { return UIColor(named: "blue_button_background")!}
    
    static func getGradientBackground() -> CAGradientLayer {
        let top : CGColor = UIColor.primary_color.cgColor
        let bot : CGColor = UIColor.background_color_app.cgColor
        
        let gl = CAGradientLayer()
        gl.colors = [ top , bot ]
        gl.locations = [ 0.0 , 0.01 ]
        return gl
    }
    
}
