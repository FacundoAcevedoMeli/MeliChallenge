//
//  HeaderHomeTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class HeaderHomeTableViewCell: UITableViewCell {

    private lazy var headerHome : UIImageView = {
        let image = UIImageView(image: UIImage(named: "image_home_ad"))
        image.desactivatetranslatesAutoresizingMask()
        return image
    }()
    
    static let identifier : String = "HeaderHomeTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .clear
        contentView.addSubview(headerHome)
        NSLayoutConstraint.activate([
            headerHome.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            headerHome.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant:  -10),
            headerHome.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  15),
            headerHome.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant:  -15 )
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

