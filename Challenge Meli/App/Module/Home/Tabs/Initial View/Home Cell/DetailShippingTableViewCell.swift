//
//  DetailShippingTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class DetailShippingTableViewCell: UITableViewCell {

    private lazy var iconTruck : UIImageView = {
    let image = UIImageView()
        image.image = UIImage(named: "icon_truck")
        image.desactivatetranslatesAutoresizingMask()
        return image
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "Envío gratis en millones deproductosdesde $3.500"
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    private lazy var shippingView : UIView = {
        let view = UIView()
        view.desactivatetranslatesAutoresizingMask()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.1
        view.clipsToBounds = false
        return view
    }()
    
    static let identifier : String = "DetailShippingTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setupView(){
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.addSubview(shippingView)
        contentView.addSubview(iconTruck)
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            shippingView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            shippingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -10 ),
            shippingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 10 ),
            shippingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10 ),
            iconTruck.leadingAnchor.constraint(equalTo: shippingView.leadingAnchor , constant: 20 ),
            iconTruck.heightAnchor.constraint(equalToConstant: 16),
            iconTruck.widthAnchor.constraint(equalToConstant: 16),
            iconTruck.bottomAnchor.constraint(equalTo: shippingView.bottomAnchor , constant:  -10 ),
            iconTruck.topAnchor.constraint(equalTo: shippingView.topAnchor , constant: 10 ),
            titleLabel.topAnchor.constraint(equalTo: shippingView.topAnchor ,constant: 10),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: shippingView.bottomAnchor , constant: -10 ),
            titleLabel.leadingAnchor.constraint(equalTo: iconTruck.trailingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: shippingView.trailingAnchor , constant: -5 )
        ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
