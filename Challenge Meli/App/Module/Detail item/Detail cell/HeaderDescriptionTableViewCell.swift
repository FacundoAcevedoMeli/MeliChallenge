//
//  HeaderDescriptionTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import UIKit
import SwiftUI

class HeaderDescriptionTableViewCell: UITableViewCell {

    lazy var nameProduct : MeliLabel = {
        let label = MeliLabel(
            textType: .bodyM,
            colorType: .primaryTextColor)
        label.numberOfLines = 0
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var overTitleLabel : MeliLabel = {
        let label = MeliLabel(
            textType: .bodyS,
            colorType: .secondaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
        return label
    }()
    
    lazy var subtitleProduct : MeliLabel = {
        let label = MeliLabel(
            textType: .bodyS,
            colorType: .secondaryTextColor)
        label.desactivatetranslatesAutoresizingMask()
         return label
    }()
    
    lazy var mediaCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.desactivatetranslatesAutoresizingMask()
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        collection.isPagingEnabled = true
        return collection
    }()
    
    lazy var mediaIndex : MeliIndexView = {
        let view = MeliIndexView()
        view.desactivatetranslatesAutoresizingMask()
        return view
    }()
    
    lazy var priceLabel : MeliLabel = {
        let label = MeliLabel(
            color: .semi_black_title, size: 36)
        label.desactivatetranslatesAutoresizingMask()
         return label
    }()
    
    static var identifier = "HeaderDescriptionTableViewCell"
    
    private var mediaItems : [MediaItem] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews( [ overTitleLabel , nameProduct , subtitleProduct , mediaCollectionView , priceLabel , mediaIndex] )
        setupConstraint()
        setupCollection()
    }
    
    func configCell(product : Product){
        nameProduct.text = product.title ?? ""
        priceLabel.text = product.getPrice()
        mediaItems = product.pictures ?? []
        mediaIndex.totalItem = product.pictures?.count ?? 0
        mediaIndex.actualItem = 1
        overTitleLabel.text = (product.getCondition().rawValue) + " | " + "\(product.sold_quantity ?? 0 ) vendidos"
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            overTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 15 ),
            overTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 15),
            overTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -15),
            nameProduct.topAnchor.constraint(equalTo: overTitleLabel.bottomAnchor , constant: 10),
            nameProduct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  15),
            nameProduct.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10 ),
            subtitleProduct.topAnchor.constraint(equalTo: nameProduct.bottomAnchor , constant: 10 ),
            subtitleProduct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 15),
            mediaCollectionView.topAnchor.constraint(equalTo: subtitleProduct.bottomAnchor , constant: 10),
            mediaCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  15),
            mediaCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -15),
            mediaCollectionView.heightAnchor.constraint(equalToConstant: 275),
            priceLabel.topAnchor.constraint(equalTo: mediaCollectionView.bottomAnchor , constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 15),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -15),
            mediaIndex.topAnchor.constraint(equalTo: mediaCollectionView.topAnchor , constant: 5),
            mediaIndex.leadingAnchor.constraint(equalTo: mediaCollectionView.leadingAnchor , constant: 5 ),
            mediaIndex.heightAnchor.constraint(equalToConstant: 30),
            mediaIndex.widthAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setupCollection(){
        mediaCollectionView.register(MediaItemCollectionViewCell.self, forCellWithReuseIdentifier: MediaItemCollectionViewCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension HeaderDescriptionTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mediaItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaItemCollectionViewCell.identifier, for: indexPath) as! MediaItemCollectionViewCell
        cell.configCell(media: mediaItems[indexPath.row] )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension HeaderDescriptionTableViewCell : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        mediaIndex.actualItem = Int( scrollView.contentOffset.x / scrollView.frame.width ) + 1
    }
 
}
