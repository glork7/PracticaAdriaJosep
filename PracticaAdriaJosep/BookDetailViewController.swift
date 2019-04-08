//
//  BookDetailViewController.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 01/04/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController,UISplitViewControllerDelegate  {

    var bookDetail: Book?
    
    @IBOutlet weak var titleDetail: UILabel!
    
    @IBOutlet weak var authorDetail: UILabel!
    
    @IBOutlet weak var isbnDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBook = bookDetail{
            self.titleDetail.text = currentBook.Titol
            self.authorDetail.text = currentBook.Autor
            self.isbnDetail.text = currentBook.ISBN
        }else {
            self.titleDetail.text = ""
            self.authorDetail.text = ""
            self.isbnDetail.text = ""
        }
        
    }
    
    
    


}
