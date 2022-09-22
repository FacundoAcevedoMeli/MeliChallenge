//
//  ProductButtonOptionTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 19/09/2022.
//

import UIKit
import SwiftUI

class ProductButtonOptionTableViewCell: UITableViewCell {

    static var identifier = "ProductButtonOptionTableViewCell"
    
    lazy var stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 15
        stack.desactivatetranslatesAutoresizingMask()
        return stack
    }()
    
    lazy var shareStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.desactivatetranslatesAutoresizingMask()
        return stack
    }()
    
    lazy var questionBttn : MeliButton = {
        let btn = MeliButton(withTitle: "Preguntar")
        btn.desactivatetranslatesAutoresizingMask()
        return btn
    }()
     
    lazy var whatsappBttn : MeliButton = {
        let btn = MeliButton(withTitle: "WhatssApp")
        btn.applyConfiguration(withImage: "icon_clip")
        btn.desactivatetranslatesAutoresizingMask()
        return btn
    }()
    
    lazy var favoriteBttn : UIButton = {
        let btn = MeliButton(withTitle: "Agregar a favoritos")
        btn.backgroundColor = .white
        btn.setTitleColor( UIColor.blue_button_background, for: .normal)
        btn.roundView(radius: 5)
        btn.desactivatetranslatesAutoresizingMask()
        btn.applyConfiguration(withImage: "icon_favorite" , tintColorImage: UIColor.blue_button_background )
        return btn
    }()
    
    lazy var shareBttn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Compartir", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor( UIColor.blue_button_background, for: .normal)
        btn.roundView(radius: 5)
        btn.desactivatetranslatesAutoresizingMask()
        btn.applyConfiguration(withImage: "icon_share")
        return btn
    }()
    
    private var onFavoritePressed : () -> () = {}
    private var product : Product?
    
    override init( style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func configCell(product : Product ,  onPressed : @escaping () -> () ){
        self.product = product
        self.onFavoritePressed = onPressed
        favoriteBttn.addTarget(self, action: #selector(pressFavorite), for: .touchDown)
        updateFavoriteButton()
    }
    
    func updateFavoriteButton(){
        guard let product = product else {
            return
        }
        favoriteBttn.setTitle( !product.isFavorite ? "Agregar a favoritos" : "Eliminar de favoritos", for: .normal)
    }
    
    @objc func pressFavorite(){
        onFavoritePressed()
        updateFavoriteButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        contentView.addSubviews([stackView , whatsappBttn ,questionBttn , shareStackView , shareBttn , favoriteBttn ])
        stackView.addArrangedSubview(questionBttn)
        stackView.addArrangedSubview(whatsappBttn)
        shareStackView.addArrangedSubview(favoriteBttn)
        shareStackView.addArrangedSubview(shareBttn)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 52),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 15),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -15 ),
            shareStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor , constant: 15),
            shareStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ),
            shareStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shareStackView.heightAnchor.constraint(equalToConstant: 52),
            shareStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -15)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

