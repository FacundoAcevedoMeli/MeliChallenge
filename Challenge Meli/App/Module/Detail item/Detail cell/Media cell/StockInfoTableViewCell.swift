//
//  StockInfoTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import UIKit

class StockInfoTableViewCell: UITableViewCell {

    lazy var titleLabel : MeliLabel = {
        let label = MeliLabel(textType: .bodyL, colorType: .primaryTextColor)
        label.text = "Stock disponible"
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var buyButton : MeliButton = {
        let btn = MeliButton(withTitle: "Comprar ahora")
        btn.desactivatetranslatesAutoresizingMask()
        return btn
    }()
    
    lazy var buttonContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .background_color_app
        view.roundView(radius: 5)
        view.desactivatetranslatesAutoresizingMask()
        return view
    }()
    
    lazy var actualStockLabel : MeliLabel = {
        let label = MeliLabel(textType: .bodyL , colorType: .primaryTextColor)
        label.text = "Cantidad: 1"
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var totalStock : MeliLabel = {
        let label = MeliLabel(textType: .bodyS, colorType: .secondaryTextColor)
        label.text = "(9950 disponibles)"
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    static var identifier : String = "StockInfoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func configCell( product : Product){
            
        if let available_quantity = product.available_quantity {
            if available_quantity == 0 {
                titleLabel.text = "Sin stock"
            }
            totalStock.text = "(\(available_quantity) disponibles)"
        }
    }
    
    private func setupView(){
        contentView.addSubviews([ titleLabel , buyButton , buttonContainer ])
        buttonContainer.addSubviews([ totalStock , actualStockLabel ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 15),
            buttonContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 15),
            buttonContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor  , constant: 15),
            buttonContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor  , constant: -15),
            actualStockLabel.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor , constant: 15),
            actualStockLabel.topAnchor.constraint(equalTo: buttonContainer.topAnchor , constant: 15),
            actualStockLabel.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor , constant: -15),
            buyButton.topAnchor.constraint(equalTo: buttonContainer.bottomAnchor , constant: 15),
            buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor  , constant: -15),
            buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  15),
            buyButton.heightAnchor.constraint(equalToConstant: 48),
            buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -15),
            totalStock.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor , constant: -15),
            totalStock.topAnchor.constraint(equalTo: buttonContainer.topAnchor , constant:  15),
            totalStock.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor , constant:  -15)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
