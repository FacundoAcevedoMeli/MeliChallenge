//
//  Favorites.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 19/09/2022.
//

import Foundation

class FavoritePreferences {
    
    static var shared : FavoritePreferences = FavoritePreferences()
    var identifier : String = "Favorites"
    private var favoriteList : FavoriteList = FavoriteList()
    
    private init(){
        if let data = UserDefaults.standard.object(forKey: identifier) as? Data,
           let favorite = try? JSONDecoder().decode(FavoriteList.self, from: data) {
            favoriteList.favoritesIDS = favorite.favoritesIDS
        }
    }
    
    func getFavoriteProducts() -> [String] {
        return favoriteList.favoritesIDS.map { $0 }
    }
    
    // Clear preferences
    func removeUserDefault(){
        UserDefaults.standard.removeObject(forKey: identifier)
    }
    
    // Check if the id is saved and remove it, if not add it
    func addFavorite(id : String) {
        
        if favoriteList.favoritesIDS.contains(id) {
            favoriteList.favoritesIDS.remove(id)
        } else {
            favoriteList.favoritesIDS.update(with: id)
        }
        
        if let encoded = try? JSONEncoder().encode(favoriteList) {
            UserDefaults.standard.set(encoded, forKey: identifier)
        }
    }
}

// Object saved in the userdefault that contains the favorite id
class FavoriteList : Codable {
    var favoritesIDS : Set<String> = []
    init() {
        favoritesIDS = []
    }
}
