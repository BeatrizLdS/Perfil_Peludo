//
//  ContentView.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 13/05/22.
//

import SwiftUI

struct AllPetsView: View {
    
    @State private var pets = PetsList.myPets
    @State private var showAddPetView = false
    
    var body: some View {
        NavigationView {
            if pets.isEmpty {
                Text("Nenhum pet adcionado")
                    .foregroundColor(.secondary)
                    .navigationBarTitle("Meus Pets")
                    .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        
                        ToolbarItem(placement: .automatic) {
                            AddPetButton
                        }
                    }
                    .sheet(isPresented: $showAddPetView){
                        AddPetView(myPetsList: $pets)
                    }
            } else {
                ListOfPets
                    .navigationBarTitle("Meus Pets")
                    .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        
                        ToolbarItem(placement: .automatic) {
                            AddPetButton
                        }
                    }
                    .sheet(isPresented: $showAddPetView){
                        AddPetView(myPetsList: $pets)
                    }
            }
        }
    }
    
    private var ListOfPets : some View {
        List{
            ForEach ($pets) { $pet in
                NavigationLink(destination: PetProfileView(pet: pet),
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
                                            .font(.headline)
                                        Text(pet.typeOfAnimal)
                                            .font(.subheadline)
                                        Text("IDADE!!")
                                            .font(.subheadline)
                                    }
                                }
                })
            }
            .onDelete(perform: delete)
        }
    }
    

    
    private var AddPetButton : some View {
        Button{
            print("Adicionar novo animal")
            showAddPetView = true
        }label: {
            Label("Adicionar Pet", systemImage: "plus")
                .imageScale(.large)
        }
        .labelStyle(.iconOnly)
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
