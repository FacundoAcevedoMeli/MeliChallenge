//
//  Request+Product.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

extension Request.Product {
    struct GetTopProduct : NetworkRequestTpe {
        let categoryID : String
        var request: RequestData {
            return RequestData(endpoint: "highlights/MLA/category/\(categoryID)", method: .get, parameters: [:] , authenticated: true)
        }
    }
    
    struct MultiGet : NetworkRequestTpe {
        let listItem : [String]
        var request: RequestData {
            return RequestData(endpoint: "items", method: .get, parameters: [ "ids" : listItem.joined(separator: ",")] , authenticated: true)
        }
    }
}
