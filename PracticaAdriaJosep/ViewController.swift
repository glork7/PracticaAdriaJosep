//
//  ViewController.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 21/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataBaseFilename = "books.db"
    var dataBasePath:String?
    var book = Book(ISBN: 0,autor: " ", titol: " ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableDatabase()
        saveData()
        
        
    }
    
    func setTableDatabase(){
        //Declares fileManager per agafar l'objecte de la basdededades
        let fileManager = FileManager()
        //dintre del documentDirectory es guarda la basededades
        if let dirDocument = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
            //agafa el nom de la base de dades i l'introdueix d'intre del path de la basededades
            let dataBaseURL = dirDocument.appendingPathComponent(dataBaseFilename)
            //databasepath es guarda com el path de url de la nostra basededades
            dataBasePath = dataBaseURL.path
            
            let bookDB = FMDatabase(path: dataBasePath)
            if bookDB.open(){
                if !bookDB.executeStatements("CREATE TABLE IF NOT EXIST BOOKS(ISBN TEXT PRIMARY KEY, AUTOR TEXT NOT NULL, TITOL TEXT NOT NULL)"){
                    print(bookDB.lastError().localizedDescription)
                }
                bookDB.close()
            }else{
                print(bookDB.lastError().localizedDescription)
            }
        }
        
        
    }
    
    func saveData(){
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Table", for: indexPath)
        let bookDB = FMDatabase(path: dataBasePath)
        if bookDB.open(){
            let selectSQL = "SELECT * FROM BOOKS "
            let data:[Any]=[Any]()
            if let resultSet = bookDB.executeQuery(selectSQL, withArgumentsIn: data){
                var titol = cell.textLabel?.text
                while(resultSet.next()){
                    if let displayMessage = resultSet.string(forColumnIndex: 0){
                        titol?+=displayMessage
                        print(titol!)
                    }
                    if let displayMessage = resultSet.string(forColumnIndex: 1){
                        titol?+=displayMessage
                    }
                    
                   
                }
            resultSet.close()
        }
            bookDB.close()
        }else{
            print(bookDB.lastError().localizedDescription)
        }
        return cell
    }
    
    
    
    


}

