//
//  Pets.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 16/05/22.
//

import Foundation
import UIKit


struct Pet : Identifiable{
    
    var id = UUID()
    var name : String
    var birthday : Date
    var petType : String
    
    var favoriteFoods : [StringWithID]
    var prohibedFoods : [StringWithID]
    
    var favoriteToys : [StringWithID]
    
    var behaviorWithOtherAnimals : PetTemperament
    var behaviorWithOtherHumans : PetTemperament
    
    var image : UIImage
    var hasImage : Bool
    
}

struct PetsList {
    static var myPets : [Pet] = []
}
