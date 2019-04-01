//
//  BookManager.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 25/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import UIKit

class BookManager: SQLiteDAO {

    var bookArray: [Book]=[Book]()
    var bookisbn: [String] = []
  
    
    
  
    
    func readRecords(_ database: FMDatabase){
        bookArray.removeAll()
        bookisbn.removeAll()
        if database.open(){
            let selectSQL="SELECT * FROM BOOKS"
            let data:[Any]=[Any]()
            if let resultSet = database.executeQuery(selectSQL, withArgumentsIn: data){
                while(resultSet.next()){
                    let book = Book(ISBN:resultSet.string(forColumnIndex: 0)!, autor: resultSet.string(forColumnIndex: 1)!, titol: resultSet.string(forColumnIndex: 2)!)
                    bookArray.append(book)
                    bookisbn.append(book.ISBN)
                }
                resultSet.close()
            }
            database.close()
        }else{
            print(database.lastError().localizedDescription)
        }
    }
 
            
    func insert(_ database: FMDatabase, newRecord: Any) {
        if database.open(){
            let insertSQL="INSERT INTO BOOKS(ISBN,AUTOR,TITOL) VALUES (?,?,?)"
            let data:Array = ["\((newRecord as! Book).ISBN)","\((newRecord as! Book).Autor)","\((newRecord as! Book).Titol)"]
            if !database.executeUpdate(insertSQL, withArgumentsIn: data){
                print(database.lastError().localizedDescription)
            }else{
                database.close()

            }
        }
    }
    
    func delete(_ database: FMDatabase, recordDelte recordToDelete: Any) -> Bool{
        var result = false
        if database.open(){
            let deleteSQL = "DELETE FROM BOOKS WHERE ISBN=?"
            if let book = recordToDelete as? Book{
                let data:[Any]=["\(book.ISBN)"]
                result = database.executeUpdate(deleteSQL, withArgumentsIn: data)
            }
            database.close()
            
        }else{
             print(database.lastError().localizedDescription)
        }
        return result
    }
    
}




      
