//
//  MyLocationView.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import Foundation
import UIKit


class MyLocationView : UIView {
    
    static let height : Double = 40.0
    
    private lazy var locationIcon : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "icon_location")
        icon.desactivatetranslatesAutoresizingMask()
        return icon
    }()
    
    private lazy var directionLabel : MeliLabel = {
        let label = MeliLabel(textType: .bodyS , colorType: .primaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
        label.text = "Enviar a Nombre de Usuario - Dirección"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .primary_color
        self.addSubview(locationIcon)
        self.addSubview(directionLabel)
        setupConstraint()
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 3 )
        
        clipsToBounds = false
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate( [
            locationIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 19 ),
            locationIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            directionLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor ,  constant: 6 ),
            directionLabel.centerYAnchor.constraint(equalTo: centerYAnchor )
        ])
    }
}
