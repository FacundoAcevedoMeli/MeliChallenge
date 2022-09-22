//
//  MediaItemCollectionViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import UIKit

class MediaItemCollectionViewCell: UICollectionViewCell {
    
    lazy var mediaImage : UIImageView = {
        let image = UIImageView()
        image.desactivatetranslatesAutoresizingMask()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    static var identifier = "MediaItemCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(mediaImage)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(media : MediaItem){
        mediaImage.setImageFromURL(url: media.secure_url)
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            mediaImage.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 0),
            mediaImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant:  0),
            mediaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mediaImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
        ])
    }
}
