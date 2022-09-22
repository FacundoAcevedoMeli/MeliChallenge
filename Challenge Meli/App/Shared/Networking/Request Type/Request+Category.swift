//
//  Request+Category.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

extension Request.Category {
    struct GetCategory : NetworkRequestTpe {
        let query : String?
        let limit : Int? = 8
        var request: RequestData {
            return RequestData(endpoint: "sites/MLA/domain_discovery/search?", method: .get , parameters: [ "limit" : limit , "q" : query] )
        }
    }
}
