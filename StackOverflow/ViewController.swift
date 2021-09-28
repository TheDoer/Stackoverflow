//
//  ViewController.swift
//  StackOverflow
//
//  Created by Adonis Rumbwere on 23/9/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return table
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APICaller.shared.getQuestions { result in
            switch result {
                case .success(let response):
                    break
                case .failure(let error):
                    print(error)
            }
        }
        
    }


}

