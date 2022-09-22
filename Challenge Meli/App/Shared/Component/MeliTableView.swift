//
//  MeliTableView.swift
//  Challenge Meli
//
//  Created by Facundo Sebastian Acevedo on 18/09/2022.
//

import Foundation
import UIKit

class MeliTableView : UITableView {
    
    var indicator : UIActivityIndicatorView?
    var refreshAction : () -> () = {}
    
    /**
     Initializes the table indicating whether loading flags or an action for the refreshcontrol is required
     - Parameter
            - withIndicator : Indicates if a loader should be configured.
            - refreshControlAction : Action when executing the refresh control.
     - Returns: none.
     */
    
    init(withIndicator : Bool = false ,
         style : UITableView.Style ,
         delegate : UITableViewDelegate? = nil ,
         dataSource : UITableViewDataSource? = nil,
         refreshControlAction : (() -> ())? = nil){
        super.init(frame: .zero, style: style)
        if withIndicator {
            indicator = UIActivityIndicatorView()
            setupIndicator()
        }
        self.delegate = delegate
        self.dataSource = dataSource
        self.showsVerticalScrollIndicator = false
        self.separatorStyle = .none
       
        if let refreshControlAction = refreshControlAction {
            self.refreshControl = UIRefreshControl()
            self.refreshAction = refreshControlAction
            refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        }
        
    }
    
    @objc func refresh(){
        refreshAction()
    }
    
    private func setupIndicator(){
        guard let indicator = indicator else {
            return
        }
        indicator.style = .large
    }
    
    func startLoading(){
        backgroundView = indicator
        indicator?.startAnimating()
    }
    
    func stopLoading(){
        reloadData()
        backgroundView = nil
        indicator?.stopAnimating()
    }
    
    func setupMessage(message : String){
        let label = MeliLabel(textType: .titleXS, colorType: .primaryTextColor)
        label.text = message
        label.textAlignment = .center
        backgroundView = label
    }
    
    func clearMessage(){
        backgroundView = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dequeueCell<C : UITableViewCell>( cell : C) -> C {
        return self.dequeueReusableCell(withIdentifier: cell.reuseIdentifier ?? "" ) as! C
    }
}
