//
//  ContentView.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 13/05/22.
//

import SwiftUI

struct AllPetsView: View {
    
    @State var pets : [Pet] = PetsList.myPets
    
    var body: some View {
        NavigationView {
            ListOfPets
                .navigationBarTitle("Voltar")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Perfil Peludo").font(.headline)
                            Image(systemName: "pawprint.fill")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        AddPetButton
                    }
                }
        }
    }
    
    private var ListOfPets : some View {
        List{
            ForEach ($pets) { $pet in
                NavigationLink(destination: PetPerfilView(pet: pet),
                               label: {
                                HStack(spacing: 15){
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(height: 60)
                                        .padding(10)
                                        .background(Color.black)
                                        .cornerRadius(15)
                                    VStack (alignment: .leading){
                                        Text(pet.name)
                                        Text(pet.typeOfAnimal)
                                        Text("Tem IDADE aninhos")
                                    }
                                }
                })
            }
            .onDelete(perform: delete)
        }
    }
    

    
    private var AddPetButton : some View {
        HStack{
            Button{
                print("Adicionar novo animal")
            }label: {
                Label("Adicionar Pet", systemImage: "plus.circle.fill")
            }
            .labelStyle(.titleAndIcon)
            
            Spacer()
        }
    }
    
    func delete (at offsets: IndexSet) {
        print(pets)
        pets.remove(atOffsets: offsets)
        print(pets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AllPetsView()
            AllPetsView()
                .preferredColorScheme(.dark)
        }
    }
}
