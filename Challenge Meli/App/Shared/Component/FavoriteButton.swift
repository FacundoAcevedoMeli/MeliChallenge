//
//  FavoriteButton.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation
import UIKit

class FavoriteButton : UIView {
    
    enum Style {
        case favorite ,
            noFavorite
    }
    
    lazy var icon_favorite : UIImageView = {
        let image = UIImageView()
        image.desactivatetranslatesAutoresizingMask()
        image.image = UIImage(named: "icon_favorite")
        return image
    }()
    
    lazy var backView : UIView = {
        let view = UIView()
        view.desactivatetranslatesAutoresizingMask()
        view.backgroundColor = .white
        view.alpha = 0.8
        view.isUserInteractionEnabled = true
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.roundView(radius: backView.frame.width / 2.0 )
    }
    
    func animateIcon() {
        UIView.animate(withDuration: 0.3 , animations: {
            self.icon_favorite.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
             
        }, completion: { finish  in
            UIView.animate(withDuration: 0.3 , animations: {
                self.icon_favorite.transform = .identity
            })
        })
    }
    
    func changeStyle( style : FavoriteButton.Style){
        switch style {
        case .favorite :
            backView.backgroundColor = .blue_button_background
            icon_favorite.tintColor = .white
            break
        case .noFavorite :
            icon_favorite.tintColor = .blue_button_background
            backView.backgroundColor = .clear
            break
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        backgroundColor = .clear
        self.addSubviews([backView ,icon_favorite ])
        NSLayoutConstraint.activate([
            icon_favorite.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon_favorite.centerYAnchor.constraint(equalTo: centerYAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor ),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.topAnchor.constraint(equalTo: topAnchor ),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
