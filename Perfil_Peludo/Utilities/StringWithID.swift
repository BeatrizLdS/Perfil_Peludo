//
//  StringWithID.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 18/05/22.
//

import Foundation

struct StringWithID : Identifiable{
    let id = UUID()
    var string: String
}
