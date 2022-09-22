//
//  CategorySuggestCollectionViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class CategorySuggestCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "CategorySuggestCollectionViewCell"

    private lazy var containerCategoryView : UIView = {
        let view = UIView()
        view.desactivatetranslatesAutoresizingMask()
        view.backgroundColor = .white
        view.roundView(radius: 28)
        return view
    }()
    
    private lazy var iconCategory : UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.desactivatetranslatesAutoresizingMask()
        image.image = UIImage(named: "icon_car")
        return image
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = MeliLabel(textType: .bodyS, colorType: .primaryTextColor)
        label.text = "Automovil"
        label.textAlignment = .center
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    
    private func setupView() {
        backgroundColor = .clear
        contentView.addSubview(containerCategoryView)
        contentView.addSubview(iconCategory)
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            containerCategoryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerCategoryView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            containerCategoryView.heightAnchor.constraint(equalToConstant: 56),
            containerCategoryView.widthAnchor.constraint(equalToConstant: 56),
            iconCategory.topAnchor.constraint(equalTo: containerCategoryView.topAnchor),
            iconCategory.bottomAnchor.constraint(equalTo: containerCategoryView.bottomAnchor),
            iconCategory.leadingAnchor.constraint(equalTo: containerCategoryView.leadingAnchor),
            iconCategory.trailingAnchor.constraint(equalTo: containerCategoryView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: containerCategoryView.bottomAnchor , constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
