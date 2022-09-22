//
//  UITableView+Extension.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 21/09/2022.
//

import Foundation
import UIKit

extension UITableView {
    func scrollToTop(animated : Bool = false){
        if numberOfRows(inSection: 0) > 0 {
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: animated)
        }
    }
}
