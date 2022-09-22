//
//  HomeTabController.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import UIKit

class HomeTabController: UITabBarController {

    private lazy var separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabItems()
        configView()
    }
    
    func setupTabItems() {
        
        let homeVc = HomeViewController()
        homeVc.tabBarItem.title = "Inicio"
        homeVc.tabBarItem.image = UIImage(named: "icon_home")
        let navigationControler = MeliNavigationController(rootViewController: homeVc)

        let favorites = FavoritesViewController(viewModel: FavoriteViewModel())
        let navigationControlerFav = MeliNavigationController(rootViewController: favorites)
        favorites.tabBarItem.title = "Favoritos"
        favorites.tabBarItem.image = UIImage(named: "icon_favorite")
        
        let miShop = HomeViewController()
        miShop.tabBarItem.title = "Mis Compras"
        miShop.tabBarItem.image = UIImage(named: "icon_my_buy")
        let notification = HomeViewController()
        notification.tabBarItem.title = "Notificaciones"
        notification.tabBarItem.image = UIImage(named: "icon_notif")
        
        let profile = ProfileViewController()
        let navigationControlerProfile = MeliNavigationController(rootViewController: profile)
        profile.tabBarItem.title = "Mas"
        profile.tabBarItem.image = UIImage(named: "icon_burger")
        
        viewControllers = [ navigationControler , navigationControlerFav , miShop , notification , navigationControlerProfile ]
    }
    
    private func configView(){
        tabBar.addSubview(separatorView)
        NSLayoutConstraint.activate([
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: tabBar.topAnchor)
        ])
    }

}
