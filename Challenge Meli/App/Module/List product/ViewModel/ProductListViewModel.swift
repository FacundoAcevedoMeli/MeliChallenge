//
//  ProductListViewModel.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

class ProductListViewModel {
    
    var products : [Product] = [] {
        didSet {
            bindProducts()
        }
    }
    var query : String
    
    // Binders
    var bindProducts : () -> () = {}
    var onErrorHandling : (Error) -> () = { _ in }

    init(query : String){
        self.query = query
    }
    
    // Category validation and get all items by category
    func validateCategory( query : String){
        self.query = query
        let request = Request.Category.GetCategory(query: query)
        APIManager.Category.getCategory(request: request, onResponse: { [weak self] categories in
            guard let categoryID = categories.first?.category_id else {
                self?.products = []
                self?.onErrorHandling(NetworkingError.emptyProducts)
                return
            }
            
            self?.getTopItems(categoryID: categoryID )
        }, onError: { [weak self] error in
            self?.onErrorHandling(error)
        })
    }
    
    // Get items info by id
    func getTopItems(categoryID : String) {
        let request = Request.Product.GetTopProduct(categoryID: categoryID)
        APIManager.Product.getTopProduct(request: request, onResponse: { [weak self] products in
            self?.getMultiItems(productIDS: products.content
                .filter { $0.type == "ITEM"}
                .map { product in product.id })
        }, onError: { [weak self] error in
            self?.products = []
            self?.onErrorHandling(error)
        })
    }
    
    // Get all item info
    func getMultiItems( productIDS : [String] ){
        let request = Request.Product.MultiGet(listItem: productIDS )
        APIManager.Product.multiGet(request: request, onResponse: { [weak self] productResponse in
            self?.products = productResponse.loadProducts()
        }, onError: { [weak self] error in
            self?.products = []
            self?.onErrorHandling(error)
        })
    }
    
    
}
