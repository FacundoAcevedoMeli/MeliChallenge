//
//  ProfileOptionTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import UIKit

class ProfileOptionTableViewCell: UITableViewCell {

    lazy var titleLabel : UILabel = {
        let label = MeliLabel(textType: .bodyS , colorType: .primaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
        label.textAlignment = .center
        return label
    }()
    
    lazy var iconOption : UIImageView = {
        let iconOption = UIImageView()
        iconOption.image = UIImage(named: "icon_share")
        iconOption.desactivatetranslatesAutoresizingMask()
        return iconOption
    }()
    
    static var identifier : String = "ProfileOptionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
        
    }
    
    private func setupConstraint(){
        contentView.addSubviews( [ titleLabel , iconOption ])
        
        NSLayoutConstraint.activate([
            iconOption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 25),
            iconOption.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 15),
            iconOption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: iconOption.trailingAnchor , constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: iconOption.centerYAnchor)
        ])
    }
    
    func setText( text : String){
        titleLabel.text = text
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
