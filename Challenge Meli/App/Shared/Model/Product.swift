//
//  Product.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation

enum Condition : String {
    case new = "Nuevo"
    case none = ""
    
    init?(rawValue: String) {
        switch rawValue {
        case "new" :
            self = .new
            break
        default :
            self = .none
            break
        }
    }
}

class Product : Codable {
    let id : String
    let title : String?
    let subtitle : String?
    let price : Double?
    let currency_id : String?
    let condition : String?
    let secure_thumbnail : String?
    let pictures : [MediaItem]?
    let seller_address : SellerAddres?
    let conditionProduct : Condition = .none
    let sold_quantity : Int?
    let available_quantity : Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subtitle
        case price
        case currency_id
        case condition
        case secure_thumbnail
        case pictures
        case seller_address
        case sold_quantity
        case available_quantity
    }
    
    init(id : String?){
        self.id = id ?? ""
        self.title = ""
        self.subtitle = ""
        self.price = 2
        currency_id = ""
        condition = ""
        secure_thumbnail = ""
        pictures = []
        seller_address = nil
        sold_quantity = 3
        available_quantity = 0
    }
    
    var isFavorite : Bool = false
    
    func getPrice() -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."

        let priceFormatted = formatter.string(from: NSNumber(value: self.price ?? 0.0 )) ?? "0.0"
        return "$ " + priceFormatted
    }
    
    func getCondition() -> Condition {
        return Condition(rawValue: self.condition ?? "") ?? .none
    }
    
    func setFavorite(){
        self.isFavorite.toggle()
        FavoritePreferences.shared.addFavorite(id: self.id)
    }
    
    func getSellerAddress() -> String {
        var address = ""
        address += (seller_address?.city?.name ?? "")
        address += " " + (seller_address?.state?.name ?? "")
        address += " " + (seller_address?.country?.name ?? "")
        
        return address
    }
    
}

struct SellerAddres : Codable {
    let city : CitySeller?
    let state : StateSeller?
    let country : CountrySeller?
}

struct CitySeller : Codable {
    let name : String?
}

struct StateSeller : Codable {
    let name : String?
}

struct CountrySeller : Codable  {
    let name : String?
}
