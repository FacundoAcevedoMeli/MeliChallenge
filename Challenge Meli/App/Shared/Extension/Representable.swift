//
//  Representable.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 13/09/2022.
//

import Foundation
import SwiftUI

struct ViewControllerPreview : UIViewControllerRepresentable {
    let viewControllerBuilder : () -> UIViewController
    
    init(_ viewControllerBuilder : @escaping () -> UIViewController){
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ViewPreview : UIViewRepresentable {
    let viewBuilder : () -> UIView
    
    init(_ viewBuilder : @escaping () -> UIView){
        self.viewBuilder = viewBuilder
    }
    
    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct Previews : PreviewProvider {
    static var previews : some View {
        ViewPreview {
            ProductItemTableViewCell().contentView
        }
    }
}
