//
//  AddPetView.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 16/05/22.
//

import SwiftUI

struct AddPetView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var newPet : Pet = Pet(name: "", birthday: Date(), petType: "Cachorro",
                                          favoriteFoods: [], prohibedFoods: [], favoriteToys: [],
                                          behaviorWithOtherAnimals: .calm, behaviorWithOtherHumans: .calm,
                                          image: UIImage(), hasImage: false)
    
    @State private var showingActionSheet = false
    @State private var showImagePicker = false
    
    @Binding var myPetsList : [Pet]
    

    
    var body: some View {
            
        NavigationView{
            Form {
                
                ImageView
                

                Section("O meu Pet"){
                    TextField("Nome", text: $newPet.name)
                    DatePicker("Aniversário", selection: $newPet.birthday, displayedComponents: .date)
                    Picker("Tipo de pet", selection: $newPet.petType) {
                        ForEach(["Cachorro", "Gato", "Roedor", "Coelho", "Porquinho", "Arara", "Papagaio"], id: \.self) { item in
                            Text(item)
                        }
                    }
                }

                
                Section("Comportamento"){
                    Picker("Com estranhos", selection: $newPet.behaviorWithOtherHumans) {
                        ForEach( PetTemperament.allCases, id:\.self ){ temperament in
                            Text(temperament.rawValue)
                        }
                    }
                    Picker("Com outros animais", selection: $newPet.behaviorWithOtherAnimals) {
                        ForEach( PetTemperament.allCases, id:\.self ){ temperament in
                            Text(temperament.rawValue)
                        }
                    }
                }
                
                AddStringSectionView(list: $newPet.favoriteToys,
                                     title: "Brinquedos Favoritos",
                                     objectname: "brinquedo")
                
                AddStringSectionView(list: $newPet.favoriteFoods,
                                     title: "Comidas Favoritas",
                                     objectname: "comida")
                
                AddStringSectionView(list: $newPet.prohibedFoods,
                                     title: "Comidas Proibidas",
                                     objectname: "comida")
                
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    cancelButtonView
                }
                ToolbarItem(placement: .confirmationAction){
                    saveButtonView
                }
                
            }
        
        }
        .sheet(isPresented: $showImagePicker){
            ImagePicker(image: $newPet.image,
                        changeImage: $newPet.hasImage,
                        sourceType: UIImagePickerController.SourceType.photoLibrary)
        }
    }
    
    var ImageView : some View {
        VStack{
            HStack{
                Spacer()
                if newPet.hasImage {
                    ProfileImageView(pet: newPet)
                    
                } else {
                    ProfileDefaultImageView()
                }
                Spacer()
            }
            
            changePhotoButtonView
            
        }
    }
    
    var changePhotoButtonView : some View {
        
        Button{
            showingActionSheet = true
        }label: {
            ZStack{
                Label("Trocar Imagem", systemImage: "camera.fill")
                    .imageScale(.large)
                
            }
        }
        .labelStyle(.iconOnly)
        .buttonStyle(.bordered)
        .clipShape(Circle())
        .dynamicTypeSize(.large)
        .confirmationDialog(Text("Escolhet foto"),
                            isPresented: $showingActionSheet,
                            titleVisibility: .visible,
                            actions: {
                                Button ("Biblioteca") {
                                    showImagePicker = true
                                }
                                Button ("Cancel", role: .cancel) {}
                            })
    
    }
    
    var cancelButtonView : some View {
        Button{
            dismiss()
        } label: {
            Text("Cancelar")
        }
    }
    
    var saveButtonView : some View {
        Button{
            myPetsList.insert(newPet, at: 0)
            dismiss()
        } label: {
            Text("Salvar")
        }
    }
    
    
}


//struct AddPetView_Previews: PreviewProvider {
//
//    
//    static var previews: some View {
//        AddPetView(myPetsList: PetsList.myPets)
//    }
//}
