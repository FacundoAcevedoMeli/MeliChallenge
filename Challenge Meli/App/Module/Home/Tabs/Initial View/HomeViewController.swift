//
//  HomeViewController.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var locationView : MyLocationView = {
        let view = MyLocationView()
        view.desactivatetranslatesAutoresizingMask()
        return view
    }()
    
    private lazy var homeTableView : MeliTableView = {
        let table = MeliTableView(withIndicator: false, style: .plain , delegate: self , dataSource: self )
        table.allowsSelection = false
        table.desactivatetranslatesAutoresizingMask()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupconstraint()
        setupNavBar()
        setupTable()
    }
    
    private var homeCellTypes = [ HeaderHomeTableViewCell.identifier : HeaderHomeTableViewCell.self ,
                                  DetailShippingTableViewCell.identifier : DetailShippingTableViewCell.self ,
                                  CategorySuggestTableViewCell.identifier : CategorySuggestTableViewCell.self ,
                                  AdSelectableTableViewCell.identifier : AdSelectableTableViewCell.self ]

    private func setupView(){
        view.backgroundColor = .primary_color
        view.addSubview(locationView)
        view.addSubview(homeTableView)
    }
    
    private func setupTable() {
        homeCellTypes.forEach { cellInfo in
            homeTableView.register( cellInfo.value , forCellReuseIdentifier: cellInfo.key )
        }
        homeTableView.backgroundColor = .background_color_app
        homeTableView.alwaysBounceVertical = false
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 144
    }
    
    private func setupconstraint() {
        NSLayoutConstraint.activate( [
            locationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationView.heightAnchor.constraint(equalToConstant: MyLocationView.height ),
            homeTableView.topAnchor.constraint(equalTo: locationView.bottomAnchor),
            homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem( image: UIImage(named: "icon_shop")?.withTintColor(.black, renderingMode: .alwaysOriginal), primaryAction: UIAction(handler: { _ in self.goToProductList() }), menu: nil)
        //navigationItem.leftBarButtonItem = UIBarButtonItem( image: UIImage(named: "icon_shop"), primaryAction: nil, menu: nil)
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Buscar en Mercado Libre"
        navigationItem.titleView = searchBar
    }
    
    @objc func goToProductList(){
        
    }
}

extension HomeViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        navigationController?.pushViewController(ProductListViewController(viewModel: ProductListViewModel(query: query)) , animated: true)
    }
}
// MARK: - Table delegate
extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderHomeTableViewCell.identifier) as! HeaderHomeTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailShippingTableViewCell.identifier) as! DetailShippingTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategorySuggestTableViewCell.identifier) as! CategorySuggestTableViewCell
            return cell
        case 3 :
            let cell = tableView.dequeueReusableCell(withIdentifier: AdSelectableTableViewCell.identifier) as! AdSelectableTableViewCell
            cell.setHeight(height: 96)
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderHomeTableViewCell") as! HeaderHomeTableViewCell
            return cell
        }
    }
    
}
