//
//  ProductListViewController.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 16/09/2022.
//

import UIKit
import SwiftUI

class ProductListViewController: UIViewController {

    private lazy var productTableView : MeliTableView = {
        let table = MeliTableView(withIndicator: true,
                                  style: .plain ,
                                  delegate: self ,
                                  dataSource: self ,
                                  refreshControlAction: {
            self.productTableView.refreshControl?.endRefreshing()
            self.getCategory(query: self.viewModel.query)
        })
        table.desactivatetranslatesAutoresizingMask()
        return table
    }()
    
    private var viewModel : ProductListViewModel
    private var cellType = [ ProductItemTableViewCell.identifier : ProductItemTableViewCell.self ]

    init(viewModel : ProductListViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
        setupTable()
        setupconstraint()
        initViewModel()        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productTableView.reloadData()
    }
    
    private func initViewModel(){
        getCategory(query: viewModel.query)
        // Config binders
        viewModel.bindProducts = { [weak self] in
            self?.productTableView.stopLoading()
            if (self?.viewModel.products.isEmpty ?? false) {
                self?.productTableView.setupMessage(message: "Sin resultados")
            }
            self?.productTableView.scrollToTop()
        }
        
        viewModel.onErrorHandling = { [weak self] error in
            switch error {
            case NetworkingError.unauhtorized :
                self?.productTableView.setupMessage(message: "Token vencido")
                break
            case NetworkingError.emptyProducts :
                self?.productTableView.setupMessage(message: "Sin resultados")
                break
            default :
                self?.productTableView.setupMessage(message: "No se pudo cargar los productos")
                break
            }
        }
    }
    
    private func getCategory(query : String?){
        productTableView.clearMessage()
        guard let query = query else {
            return
        }
        productTableView.startLoading()
        viewModel.validateCategory(query: query )
    }
    
    private func setupView(){
        view.backgroundColor = .background_color_app
        view.addSubview(productTableView)
    }
    
    private func setupconstraint() {
        NSLayoutConstraint.activate( [
            productTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTable() {
        
        cellType.forEach { cellInfo in
            productTableView.register( cellInfo.value , forCellReuseIdentifier: cellInfo.key )
        }
        productTableView.backgroundColor = .background_color_app
        productTableView.alwaysBounceVertical = false
        productTableView.rowHeight = 150
        productTableView.estimatedRowHeight = 160
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem( image: UIImage(named: "icon_shop")?.withTintColor(.black, renderingMode: .alwaysOriginal), primaryAction: nil, menu: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem( image: UIImage(named: "icon_back")?.withTintColor(.black , renderingMode: .alwaysOriginal ), primaryAction: UIAction(handler: { _ in self.navigationController?.popViewController(animated:  true )}), menu: nil)
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.text = viewModel.query
        searchBar.searchTextField.font = Font.Monserrat.regular(size: 14)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Buscar en Mercado Libre"
        navigationItem.titleView = searchBar
    }

    func pressFavorite( atIndex index : Int ){
        viewModel.products[index].setFavorite()
        productTableView.reloadData()
    }
}

extension ProductListViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getCategory(query: searchBar.text)
    }
}

extension ProductListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductItemTableViewCell.identifier, for: indexPath) as! ProductItemTableViewCell
        cell.configData(product: viewModel.products[indexPath.row] ) { // On favorite pressed
            self.pressFavorite(atIndex: indexPath.row)
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

