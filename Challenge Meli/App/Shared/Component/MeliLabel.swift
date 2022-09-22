//
//  MeliLabel.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 20/09/2022.
//

import Foundation
import UIKit

class MeliLabel : UILabel {
    
    enum Metric {
        enum TextTypeSize : Double {
            case titleXL = 32,
                 titleL = 28,
                 titleM = 24,
                 titleS = 20,
                 titleXS = 18
        }
        
        enum Body : Double {
            case bodyL = 18,
                 bodyM = 16,
                 bodyS = 14,
                 bodyXS = 12
        }
    }
    
    enum ColorText : String {
        case primaryTextColor = "primaryTextColor"
        case secondaryTextColor = "secondaryTextColor"
        case textLink = "textLink"
        case negativeText = "negativeText"
        
        func getColor() -> UIColor {
            return UIColor(named: self.rawValue)!
        }
    }
    
    init(textType : MeliLabel.Metric.Body , colorType : MeliLabel.ColorText){
        super.init(frame: .zero)
        font = Font.Monserrat.regular(size: textType.rawValue)
        textColor = colorType.getColor()
    }
    
    init(textType : MeliLabel.Metric.TextTypeSize , colorType : MeliLabel.ColorText){
        super.init(frame: .zero)
        font = Font.Monserrat.regular(size: textType.rawValue)
        textColor = colorType.getColor()
    }
    
    init( color : UIColor , size : Double){
        super.init(frame: .zero)
        font = Font.Monserrat.regular(size: size)
        textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
