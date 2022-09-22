//
//  MeliNavigationBar.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation
import UIKit
import SwiftUI

class MeliNavigationController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appareance = navigationBarAppareance()
        navigationBar.standardAppearance = appareance
        navigationBar.scrollEdgeAppearance = appareance
    }
    
    func navigationBarAppareance() -> UINavigationBarAppearance {
        let standar = UINavigationBarAppearance()
        standar.configureWithOpaqueBackground()
        standar.backgroundColor = .primary_color
        standar.shadowImage = UIImage()
        standar.shadowColor = .clear
        return standar
    }
    
}
