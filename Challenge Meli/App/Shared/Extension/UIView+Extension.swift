//
//  UIView+Extension.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func desactivatetranslatesAutoresizingMask() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func roundView(radius : Double ) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addSubviews(_ views : [UIView] ){
        views.forEach { self.addSubview($0) }
    }
    
    func pinToEdge(on : UIView , padding : UIEdgeInsets = .zero){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: on.topAnchor , constant: padding.top),
            self.bottomAnchor.constraint(equalTo: on.bottomAnchor , constant: padding.bottom),
            self.leadingAnchor.constraint(equalTo: on.leadingAnchor , constant: padding.left),
            self.trailingAnchor.constraint(equalTo: on.trailingAnchor , constant: padding.right)
        ])
    }
}
