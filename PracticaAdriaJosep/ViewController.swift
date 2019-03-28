//
//  ViewController.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 21/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISplitViewControllerDelegate {
    
   
    var book = Book(ISBN: 0,autor: " ", titol: " ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
}

