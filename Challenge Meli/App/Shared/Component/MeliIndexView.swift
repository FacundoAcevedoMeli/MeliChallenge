//
//  MeliIndexView.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 19/09/2022.
//

import Foundation
import UIKit

class MeliIndexView : UIView {
    
    private lazy var indicatorView : UIView = {
        let view = UIView()
        view.desactivatetranslatesAutoresizingMask()
        view.backgroundColor = .gray_indicator_background
        view.roundView(radius: 15)
        return view
    }()
    
    private lazy var indicatorLabel : UILabel = {
        let label = UILabel()
        label.text = "- / -"
        label.textAlignment = .center
        label.desactivatetranslatesAutoresizingMask()
        label.font = Font.Monserrat.regular(size: 13)
        label.textColor = .black
        return label
    }()
    
    var separator : String = "/"
    var totalItem : Int = 0 {
        didSet {
            indicatorLabel.text = "\(actualItem) " + separator + " \(self)"
        }
    }
    
    var actualItem : Int = 0 {
        didSet {
            indicatorLabel.text = "\(actualItem) " + separator + " \(totalItem)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView(){
        self.addSubviews([indicatorView,indicatorLabel])
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: topAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorLabel.topAnchor.constraint(equalTo: topAnchor),
            indicatorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            indicatorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            indicatorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
