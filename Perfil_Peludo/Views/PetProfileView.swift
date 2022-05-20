//
//  PetPerfil.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 13/05/22.
//

import SwiftUI

struct PetProfileView: View {
    
    @State var pet : Pet
    @State private var showingActionSheet: Bool = false
    
    var body: some View {
        VStack{
            
            if pet.hasImage{
                ProfileImageView(pet: pet)
            }else{
                ProfileDefaultImageView()
            }
                
            Text(pet.name)
                .font(.title2)
                .fontWeight(.semibold)
                
            Text(pet.petType)
                
                
            let age = pet.age
            if age > 1{
                Text("\(age) anos")
            } else {
                Text("\(age) ano")
            }
                
                
            List{
                
            behaviorSectionView
                
            listOfThingsProfileView(title: "Brinquedos favoritos", list: pet.favoriteToys)
                
            listOfThingsProfileView(title: "Comidas favoritas", list: pet.favoriteFoods)
                
            listOfThingsProfileView(title: "Comidas proibidas", list: pet.prohibedFoods)
                
            }.listStyle(.sidebar)
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private var behaviorSectionView : some View {
        Section("Comportamento"){
            Text(pet.behaviorWithOtherAnimals.rawValue + " com animais")
            Text(pet.behaviorWithOtherHumans.rawValue + " com estranhos")
        }
    }
    
    
    
}
    
struct listOfThingsProfileView : View {
    
    var title : String
    var list : [StringWithID]
    
    var body: some View{

        Section (title){
            ForEach(list) { object in
                Text(object.string)
                    
            }
        }

    }
}

//struct PetPerfil_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            PetProfileView(pet: PetsList.myPets.first!)
//            PetProfileView(pet: PetsList.myPets.first!)
//                .preferredColorScheme(.dark)
//        }
//    }
//}
