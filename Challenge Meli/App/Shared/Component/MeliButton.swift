//
//  MeliButton.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 20/09/2022.
//

import Foundation
import UIKit

class MeliButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.roundView(radius: 5)
        backgroundColor = .blue_button_background
    }
    
    init(withTitle title : String , withColor color : UIColor = .blue_button_background){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
        self.roundView(radius: 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
