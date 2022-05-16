//
//  Pets.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 16/05/22.
//

import Foundation


struct Pet : Identifiable{
    
    let id = UUID()
    let name : String
    let typeOfAnimal : String
    var birthday : NSDate
    
    let favoriteFoods : [String]
    let prohibedFoods : [String]
    
    let favoriteToys : [String]
    
    let behaviorWithOtherAnimals : String
    let behaviorWithOtherHumans : String
    
    let placeToWalk : String
    let placeToSleep : String

}

struct PetsList {
    
    static var myPets = [
        Pet(name: "Kika",
            typeOfAnimal: "Cachorro",
            birthday: NSDate(),
            favoriteFoods: ["Banana", "Frango"], prohibedFoods: ["Massas"],
            favoriteToys: ["Corda", "Bolinhas"],
            behaviorWithOtherAnimals: "Agressivo", behaviorWithOtherHumans: "Descpnfiada",
            placeToWalk: "Praça", placeToSleep: "Debaixo da escrivaninha"),
        
        Pet(name: "Tita",
            typeOfAnimal: "Cachorro",
            birthday: NSDate(),
            favoriteFoods: ["Frango"], prohibedFoods: ["Leite"],
            favoriteToys: [],
            behaviorWithOtherAnimals: "Agressivo", behaviorWithOtherHumans: "Calmo",
            placeToWalk: "Praça", placeToSleep: "Varanda")
    ]
}
