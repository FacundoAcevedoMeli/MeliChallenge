//
//  DescriptionProductTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 19/09/2022.
//

import UIKit

class DescriptionProductTableViewCell: UITableViewCell {

    lazy var descriptionLabel : MeliLabel = {
        let label = MeliLabel(textType: .bodyM , colorType: .primaryTextColor)
        label.numberOfLines = 0
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    static var identifier = "DescriptionProductTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setupView(){
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 15 ),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant:  -15 )
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
