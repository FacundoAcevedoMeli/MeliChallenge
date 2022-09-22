//
//  FavoritesViewController.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    private lazy var productTableView : MeliTableView = {
        let table = MeliTableView(withIndicator: true, style: .plain )
        table.delegate = self
        table.dataSource = self
        table.desactivatetranslatesAutoresizingMask()
        return table
    }()
    
    private var viewModel : FavoriteViewModel
    
    init(viewModel : FavoriteViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTable()
        configViewModel()
    }
    
    private func configViewModel(){
        viewModel.bindProducts = { [weak self] in
            self?.productTableView.stopLoading()
            if (self?.viewModel.products.isEmpty ?? false) {
                self?.productTableView.setupMessage(message: "No tienes favoritos")
            }
        }
        viewModel.onErrorHandling = { [weak self] error in
            self?.productTableView.stopLoading()
        }
    }
    
    private func getFavorites() {
        productTableView.startLoading()
        viewModel.loadFavoriteProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    private func setupView(){
        title = "Favoritos"
        view.addSubview(productTableView)
        productTableView.pinToEdge(on: view)
    }

    private func setupTable() {
        productTableView.register( ProductItemTableViewCell.self , forCellReuseIdentifier: ProductItemTableViewCell.identifier )
        productTableView.backgroundColor = .background_color_app
        productTableView.rowHeight = 150
        productTableView.estimatedRowHeight = 160
    }
    
}

extension FavoritesViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductItemTableViewCell.identifier, for: indexPath) as! ProductItemTableViewCell
        cell.configData(product: viewModel.products[indexPath.row] ) {
            self.viewModel.removeFromFavorites(onIndex: indexPath.row)
            // Animate button
            if let cell = self.productTableView.cellForRow(at: indexPath) as? ProductItemTableViewCell {
                cell.favoriteButton.animateIcon()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let detail = DetailViewController(product: viewModel.products[indexPath.row])
        navigationController?.pushViewController(detail, animated: true)
    }
}
