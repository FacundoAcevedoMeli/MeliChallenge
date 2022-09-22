//
//  FavoriteViewModel.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 22/09/2022.
//

import Foundation


class FavoriteViewModel {
    
    var products : [Product] = [] {
        didSet {
            bindProducts()
        }
    }
    var bindProducts : () -> () = {}
    var onErrorHandling : (Error) -> () = { _ in }
    var isLoading = false
    
    /**
     Get the products that were selected as favorites by the user

     - Parameter none
     - Returns: none.
     */
    
    func loadFavoriteProducts(){
        if isLoading { return }
        isLoading = true
        let listItem = FavoritePreferences.shared.getFavoriteProducts()
        if listItem.isEmpty {
            isLoading = false
            products.removeAll()
            return
        }
        let request = Request.Product.MultiGet(listItem: listItem.map { $0 } )
        APIManager.Product.multiGet(request: request, onResponse: { [weak self] items in
            self?.products = items.loadProducts()
            self?.isLoading = false
        }, onError: { [weak self] error in
            self?.products.removeAll()
            self?.onErrorHandling(error)
            self?.isLoading = false
        })
    }
    
    func removeFromFavorites(onIndex index : Int){
        products[index].setFavorite()
        products.remove(at: index)
        print(FavoritePreferences.shared.getFavoriteProducts)
    }
    
}

