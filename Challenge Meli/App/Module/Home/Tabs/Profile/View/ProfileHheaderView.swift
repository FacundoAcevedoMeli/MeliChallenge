//
//  ProfileHheaderView.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import Foundation
import UIKit

class ProfileHeaderView : UIView {
    
    lazy var contentView : UIView = {
        let view = UIView()
        view.desactivatetranslatesAutoresizingMask()
        view.backgroundColor = .primary_color
        return view
    }()
    
    lazy var profileImage : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image_profile")
        view.desactivatetranslatesAutoresizingMask()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint(){
        self.addSubview(contentView)
        self.contentView.addSubview(profileImage)
        contentView.pinToEdge(on: self)
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 25),
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 25),
            profileImage.heightAnchor.constraint(equalToConstant: 54),
            profileImage.widthAnchor.constraint(equalToConstant: 54)
        ])
        profileImage.roundView(radius: 27)
    }
        
}
