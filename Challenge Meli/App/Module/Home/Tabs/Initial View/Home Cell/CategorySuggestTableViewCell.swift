//
//  CategorySuggestTableViewCell.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class CategorySuggestTableViewCell: UITableViewCell {

    private lazy var categoryCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.desactivatetranslatesAutoresizingMask()
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    static let identifier : String = "CategorySuggestTableViewCell"

    private var categories : [String] = ["Motos"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollection(){
        categoryCollection.register(CategorySuggestCollectionViewCell.self, forCellWithReuseIdentifier: CategorySuggestCollectionViewCell.identifier)
    }
    
    private func setupView() {
        backgroundColor = .clear
        contentView.addSubview(categoryCollection)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            categoryCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryCollection.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension CategorySuggestTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategorySuggestCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width / 5.0
        let h = collectionView.frame.height
        return CGSize(width: w, height: h)
    }
}
