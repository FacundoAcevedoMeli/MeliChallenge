//
//  DetailViewController.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import UIKit

class DetailViewController: UIViewController {

    private lazy var detailTableView : UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = false
        table.separatorStyle = .none
        table.desactivatetranslatesAutoresizingMask()
        return table
    }()
    
    private var favoriteButton : FavoriteButton?
    private var detailCellTypes = [ HeaderDescriptionTableViewCell.identifier : HeaderDescriptionTableViewCell.self ,
                                    ProductButtonOptionTableViewCell.identifier : ProductButtonOptionTableViewCell.self ,
                                    StockInfoTableViewCell.identifier : StockInfoTableViewCell.self,
                                    DescriptionProductTableViewCell.identifier : DescriptionProductTableViewCell.self ]

    var product : Product
    
    init(product : Product){
        self.product = product
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        configureTable()
        setupNavBar()
    }
    
    private func setupView(){
        view.backgroundColor = .background_color_app
        view.addSubview(detailTableView)
    }
    
    private func configureTable(){
        detailCellTypes.forEach { cellInfo in
            detailTableView.register( cellInfo.value , forCellReuseIdentifier: cellInfo.key )
        }
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            detailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupNavBar() {
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 15
        
        favoriteButton = FavoriteButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        favoriteButton?.isUserInteractionEnabled = true
        favoriteButton?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressFavorite)))
        if product.isFavorite {
            favoriteButton?.changeStyle(style: .favorite)
        } else {
            favoriteButton?.changeStyle(style: .noFavorite)
        }
        
        let shareButtonItem = UIImageView(image: UIImage(named: "icon_shop")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        
        if let favoriteButton = favoriteButton {
            stack.addArrangedSubview(favoriteButton)
        }
        stack.addArrangedSubview(shareButtonItem)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stack)
        navigationItem.leftBarButtonItem = UIBarButtonItem( image: UIImage(named: "icon_back")?.withTintColor(.black , renderingMode: .alwaysOriginal ), primaryAction: UIAction(handler: { _ in self.navigationController?.popViewController(animated:  true )}), menu: nil)
    }
    
    @objc func pressFavorite(){
        product.setFavorite()
        if product.isFavorite {
            favoriteButton?.changeStyle(style: .favorite)
        } else {
            favoriteButton?.changeStyle(style: .noFavorite)
        }
        detailTableView.reloadData()
    }
    
}

extension DetailViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderDescriptionTableViewCell.identifier , for: indexPath) as! HeaderDescriptionTableViewCell
            cell.configCell(product: product)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductButtonOptionTableViewCell.identifier , for: indexPath) as! ProductButtonOptionTableViewCell
            cell.configCell(product: product) {
                self.product.setFavorite()
                if self.product.isFavorite {
                    self.favoriteButton?.changeStyle(style: .favorite)
                } else {
                    self.favoriteButton?.changeStyle(style: .noFavorite)
                }
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: StockInfoTableViewCell.identifier ) as! StockInfoTableViewCell
            cell.configCell(product: product)
            return cell
        case 3 :
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionProductTableViewCell.identifier , for: indexPath) as! DescriptionProductTableViewCell
            cell.descriptionLabel.text = product.title
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    
}
