//
//  ProductItemTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 16/09/2022.
//

import UIKit
import SwiftUI

class ProductItemTableViewCell: UITableViewCell {

    lazy var imageProduct : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.desactivatetranslatesAutoresizingMask()
        image.roundView(radius: 5)
        return image
    }()
    
    lazy var nameProduct : MeliLabel = {
        let label = MeliLabel(textType: .bodyS, colorType: .primaryTextColor )
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var priceProduct : MeliLabel = {
        let label = MeliLabel(textType: .titleS, colorType: .primaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var descriptionProduct : MeliLabel = {
        let label = MeliLabel(textType: .bodyXS, colorType: .primaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var locationProductLabel : MeliLabel = {
        let label = MeliLabel(textType: .bodyXS, colorType: .secondaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var favoriteButton : FavoriteButton = {
        let button =  FavoriteButton()
        button.desactivatetranslatesAutoresizingMask()
        return button
    }()
    
    private lazy var separatorView : UIView = {
        let separator = UIView()
        separator.desactivatetranslatesAutoresizingMask()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    static var identifier : String = "ProductItemTableViewCell"
    private var onLikePressed : () -> () = { }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubview(imageProduct)
        contentView.addSubview(nameProduct)
        contentView.addSubview(priceProduct)
        contentView.addSubview(separatorView)
        contentView.addSubview(descriptionProduct)
        contentView.addSubview(locationProductLabel)
        contentView.addSubview(favoriteButton)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configData(product : Product , onLikePressed : @escaping () -> Void ){
        nameProduct.text = product.title ?? "Not set"
        priceProduct.text = product.getPrice()
        imageProduct.setImageFromURL(url: product.secure_thumbnail)
        locationProductLabel.text = product.getSellerAddress()
        
        if product.isFavorite {
            favoriteButton.backView.backgroundColor = .blue_button_background
            favoriteButton.icon_favorite.tintColor = .white
        } else {
            favoriteButton.backView.backgroundColor = .white
            favoriteButton.icon_favorite.tintColor = .blue
        }
        self.onLikePressed = onLikePressed
        
        favoriteButton.backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onPressLikeBtn)))
    }
    
    @objc func onPressLikeBtn(){
            onLikePressed()
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            imageProduct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10 ),
            imageProduct.heightAnchor.constraint(equalToConstant: 131),
            imageProduct.widthAnchor.constraint(equalToConstant: 131),
            imageProduct.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameProduct.topAnchor.constraint(equalTo: contentView.topAnchor , constant:  10 ),
            nameProduct.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor , constant: 10 ),
            nameProduct.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10 ),
            priceProduct.topAnchor.constraint(equalTo: nameProduct.bottomAnchor , constant: 5),
            priceProduct.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor , constant: 10 ),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionProduct.topAnchor.constraint(equalTo: priceProduct.bottomAnchor , constant: 5),
            descriptionProduct.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor , constant: 10 ),
            locationProductLabel.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor , constant: 10),
            locationProductLabel.topAnchor.constraint(equalTo: descriptionProduct.bottomAnchor , constant: 5 ),
            locationProductLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10 ),
            favoriteButton.topAnchor.constraint(equalTo: imageProduct.topAnchor , constant: 5),
            favoriteButton.trailingAnchor.constraint(equalTo: imageProduct.trailingAnchor , constant: -5),
            favoriteButton.heightAnchor.constraint(equalToConstant: 29),
            favoriteButton.widthAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageProduct.image = nil
        backgroundColor = .clear
    }

}
