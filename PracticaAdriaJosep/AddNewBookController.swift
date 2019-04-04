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
    var book:Book?
    
    var bookManager = BookManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if((newTitleBookField.text!) != ""){
            if((newAutorBookField.text!) != ""){
                if((newISBNBookField.text!) != ""){
                    self.book = Book.init(ISBN: self.newISBNBookField.text!, autor: self.newAutorBookField.text!, titol: self.newTitleBookField.text!)
                    return true
                }
                
            }
            
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save Segue"{
            if let btvc = segue.destination as? BookTableTableViewController{
                
                            btvc.bookToAdd = self.book
                        }
            
            
            
        }
        if segue.identifier == "cancel segue"{
            if let btvc = segue.destination as? BookTableTableViewController{
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
