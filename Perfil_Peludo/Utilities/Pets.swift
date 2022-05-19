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
    var typeOfAnimal : String
    var birthday : Date
    
    var favoriteFoods : [StringWithID]
    var prohibedFoods : [StringWithID]
    
    var favoriteToys : [StringWithID]
    
    var placesToWalk : [StringWithID]
    
    var behaviorWithOtherAnimals : PetTemperament
    var behaviorWithOtherHumans : PetTemperament
    
    var imageSelected : Bool
    var image : UIImage
    

}

struct PetsList {
    
    static var myPets : [Pet] = []
}
