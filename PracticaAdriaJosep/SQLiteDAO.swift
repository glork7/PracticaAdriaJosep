//
//  SQLiteDAO.swift
//  PracticaAdriaJosep
//
//  Created by Alumne on 25/03/2019.
//  Copyright © 2019 Manolo Corporation. All rights reserved.
//

import Foundation

protocol SQLiteDAO {
    func insert(_ database:FMDatabase, newRecord: Any)
    func delete(_ database:FMDatabase, recordDelte: Any) ->Bool
    func readRecords(_ database:FMDatabase)
}

