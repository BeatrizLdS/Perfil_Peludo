//
//  PetPerfil.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 13/05/22.
//

import SwiftUI

struct PetPerfilView: View {
    
    @State var pet : Pet
    @State private var showingActionSheet: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                ProfilePetImageView(imageName: "person.fill")
                Text(pet.name)
                    .fontWeight(.semibold)
                
                ChangePicButtonView
                
                Spacer()
            }
        }
    }
    
    private var ChangePicButtonView : some View {
        Button{
            showingActionSheet = true
        }label: {
            Label("Trocar Imagem", systemImage: "camera.fill")
        }
        .labelStyle(.iconOnly)
        .buttonStyle(.bordered)
        .confirmationDialog(Text("Escolhet foto"),
                            isPresented: $showingActionSheet,
                            titleVisibility: .visible,
                            actions: {
                                Button ("Câmera") {}
                                Button ("Biblioteca") {}
                                Button ("Cancel", role: .cancel) {}
                            })
        
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
            PetPerfilView(pet: PetsList.myPets.first!)
            PetPerfilView(pet: PetsList.myPets.first!)
                .preferredColorScheme(.dark)
        }
    }
}
