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
        NavigationView{
            VStack{
                ProfilePetImageView(imageName: "person.fill")
                Text(pet.name)
                    .fontWeight(.semibold)
                
                Spacer()
            }
        }
    }
    
}

struct ProfilePetImageView : View {
    
    var imageName : String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(height: 100)
            .padding(10)
            .background(Color.black)
            .cornerRadius(15)
    }
    
}

struct PetPerfil_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PetProfileView(pet: PetsList.myPets.first!)
            PetProfileView(pet: PetsList.myPets.first!)
                .preferredColorScheme(.dark)
        }
    }
}
