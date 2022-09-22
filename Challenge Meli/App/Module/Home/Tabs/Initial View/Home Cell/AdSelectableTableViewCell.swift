//
//  AdSelectableTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import UIKit

class AdSelectableTableViewCell: UITableViewCell {

    lazy var adImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image_ad")
        image.desactivatetranslatesAutoresizingMask()
        return image
    }()
    
    static var identifier : String = "AdSelectableTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .background_color_app
        contentView.addSubview(adImage)
        adImage.pinToEdge(on: contentView , padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }
    
    func setHeight(height : Double){
        adImage.heightAnchor.constraint(equalToConstant: height).isActive = true
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
