//
//  Book.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 25/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import Foundation

class Book{
    var ISBN:String
    var Autor:String
    var Titol:String
    
    
    init(ISBN: String, autor:String, titol:String){
        self.ISBN = ISBN
        self.Autor = autor
        self.Titol = titol
    }
}
