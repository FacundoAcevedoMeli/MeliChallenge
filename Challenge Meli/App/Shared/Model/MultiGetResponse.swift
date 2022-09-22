//
//  MultiGetResponse.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

struct MultiGetResponse : Codable {
    let code : Int
    let body : Product
}

extension Array where Element == MultiGetResponse {
    // Get all products and set if favorite or not
    func loadProducts() -> [Product] {
        let products : [Product] = self.map { productResponse in
            let product = productResponse.body
            if FavoritePreferences.shared.getFavoriteProducts().contains(product.id) {
                product.isFavorite = true
            }
            return product
        }
            
        return products.sorted(by: { item1 , item2 in return item1.id > item2.id } )
    }
}
