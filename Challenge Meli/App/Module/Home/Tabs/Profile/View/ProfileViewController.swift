//
//  ProfileViewController.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    lazy var profileOptionsTable : MeliTableView = {
        let table = MeliTableView(withIndicator: false,
                                  style: .plain,
                                  delegate: self,
                                  dataSource: self)
        table.desactivatetranslatesAutoresizingMask()
        return table
    }()
    
    lazy var profileHeader : ProfileHeaderView = {
        let header = ProfileHeaderView()
        header.desactivatetranslatesAutoresizingMask()
        return header
    }()
    
    private var profileOptions : [String] = [ "Inicio" , "Buscar" , "Notificaciones" , "Mis compras" , "Favoritos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTable()
    }

    private func setupTable(){
        profileOptionsTable.register( ProfileOptionTableViewCell.self , forCellReuseIdentifier: ProfileOptionTableViewCell.identifier )
        profileOptionsTable.backgroundColor = .background_color_app
        profileOptionsTable.alwaysBounceVertical = false
        profileOptionsTable.rowHeight = UITableView.automaticDimension
        profileOptionsTable.estimatedRowHeight = 160
    }
    
    private func setupView(){
        view.addSubview(profileOptionsTable)
        view.addSubview(profileHeader)
        
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeader.heightAnchor.constraint(equalToConstant: 113),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileOptionsTable.topAnchor.constraint(equalTo: profileHeader.bottomAnchor),
            profileOptionsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileOptionsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileOptionsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileOptionTableViewCell.identifier) as? ProfileOptionTableViewCell
        else {
            return UITableViewCell()
        }
        cell.backgroundColor = .background_color_app
        cell.setText(text: profileOptions[indexPath.row])
        return cell
    }
    
    
}
