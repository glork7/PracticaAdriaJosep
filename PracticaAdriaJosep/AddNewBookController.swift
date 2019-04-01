//
//  AddNewBookController.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 26/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import UIKit

class AddNewBookController: UIViewController {

    @IBOutlet weak var newTitleBookField: UITextField!
    @IBOutlet weak var newAutorBookField: UITextField!
    @IBOutlet weak var newISBNBookField: UITextField!
    
    var bookManager = BookManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var book:Book
        if segue.identifier == "Save Segue"{
            if let btvc = segue.destination as? BookTableTableViewController{
                
                        book = Book.init(ISBN: self.newISBNBookField.text!, autor: self.newAutorBookField.text!, titol: self.newTitleBookField.text!)
                        btvc.bookToAdd = book
                    }
                }
        
    
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
