//
//  BookTableTableViewController.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 28/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import UIKit

class BookTableTableViewController: UITableViewController,UISplitViewControllerDelegate {
    
    var bookManager = BookManager()
    let dataBaseFilename = "books.db"
    var dataBasePath:String?
    var bookDB:FMDatabase?
    var bookToAdd:Book?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableDatabase()
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue){
        if let add = bookToAdd{
            
            if(!bookManager.bookisbn.contains(add.ISBN)){
                bookManager.insert(bookDB!,newRecord: add)
            }else{
                
            }
            bookManager.readRecords(bookDB!)
            tableView.reloadData()
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let navigationController = primaryViewController as? UINavigationController{
            if navigationController.visibleViewController != nil{
                return true
            }
        }
        return false
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
            
            bookDB = FMDatabase(path: dataBasePath)
            if (bookDB?.open())!{
                if !bookDB!.executeStatements("CREATE TABLE IF NOT EXISTS BOOKS(ISBN TEXT PRIMARY KEY, AUTOR TEXT NOT NULL, TITOL TEXT NOT NULL)"){
                    print(bookDB?.lastError().localizedDescription as Any)
                }
                bookDB?.close()
            }else{
                print(bookDB?.lastError().localizedDescription as Any)
            }
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        bookManager.readRecords(bookDB!)
        tableView.reloadData()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookManager.bookArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Table", for: indexPath)
        let item :Book = bookManager.bookArray[indexPath.row]
        cell.textLabel?.text = "\(item.Autor)"
        cell.detailTextLabel?.text = "\(item.Titol)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        bookDB = FMDatabase(path: dataBasePath)
        if editingStyle == .delete{
            bookManager.delete(bookDB!, recordDelte: bookManager.bookArray[indexPath.row])
             bookManager.readRecords(bookDB!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableSegue" {
            if let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell)
            {
                if let destinationBookDetailController = segue.destination as? UINavigationController,
                    let targetController = destinationBookDetailController.topViewController as? BookDetailViewController {
                    targetController.bookDetail = bookManager.bookArray[indexPath.row]
                }
            }
        }
    }
}
