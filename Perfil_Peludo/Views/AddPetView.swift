//
//  AddPetView.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 16/05/22.
//

import SwiftUI

struct AddPetView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showingActionSheet = false
    
    @State private var changeProfileImage = false
    @State private var showImagePicker = false
    @State private var image = UIImage()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var myPetsList : [Pet]
    
    @State private var newPet : Pet = Pet(name: "", typeOfAnimal: "", birthday: Date(), favoriteFoods: [], prohibedFoods: [], favoriteToys: [], placesToWalk: [], behaviorWithOtherAnimals: .calm, behaviorWithOtherHumans: .calm, imageSelected : false, image :  UIImage())

    
    var body: some View {
        NavigationView{
            
            Form {
                ProfileImageView
                
                
                Section("O meu Pet"){
                    TextField("Nome", text: $newPet.name)
                    DatePicker("Aniversário", selection: $newPet.birthday, displayedComponents: .date)
                    Picker("Tipo de pet", selection: $newPet.typeOfAnimal) {
                        ForEach(["Cachorro", "Gato"], id: \.self){item in
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
                
                Section("Brinquedos favoritos"){
                    
                    addStringWithIDButton(list: $newPet.favoriteToys,
                                          addText: "Adicionar Brinquedo")
                    
                    List {
                        ForEach($newPet.favoriteToys) { $toy in
                            TextField("brinquedo", text: $toy.string)
                        }
                    }
                }
                
                Section("Comidas Favoritas"){
                    
                    addStringWithIDButton(list: $newPet.favoriteFoods,
                                          addText: "Adicionar comida favorita")
                    
                    List {
                        ForEach($newPet.favoriteFoods) { $food in
                            TextField("comida", text: $food.string)
                        }
                    }
                }
                
                Section("Comidas Proibidas"){
                    
                    addStringWithIDButton(list: $newPet.prohibedFoods,
                                          addText: "Adicionar comida proibida")
                    
                    List {
                        ForEach($newPet.prohibedFoods) { $food in
                            TextField("comida", text: $food.string)
                        }
                    }
                }
                
                Section("Lugares para passear"){
                    
                    addStringWithIDButton(list: $newPet.placesToWalk,
                                          addText: "Adicionar local")
                    
                    List {
                        ForEach($newPet.placesToWalk) { $food in
                            TextField("local", text: $food.string)
                        }
                    }
                }
                
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
            ImagePicker(image: $image, sourceType: sourceType)
        }
    }
    
    var ProfileImageView : some View {
        VStack{
            HStack{
                Spacer()
                if changeProfileImage {
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                } else {
                    
                    Image(systemName: "pawprint.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding()
                        .clipShape(Circle())
                    
                    
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
                                    changeProfileImage = true
                                }
                                Button ("Cancel", role: .cancel) {}
                            })
    
    }
    
    var saveButtonView : some View {
        Button{
            myPetsList.insert(newPet, at: 0)
            dismiss()
        } label: {
            Label("Salvar Pet", systemImage: "square.and.arrow.down")
        }
    }
    
    var cancelButtonView : some View {
        Button{
            dismiss()
        } label: {
            Text("Cancelar")
        }
    }
    
}

struct addStringWithIDButton :  View {
    
    @Binding  var list : [StringWithID]
    @State var addText : String
    
    var body: some View{
        HStack {
            Spacer()
            Button{
                list.insert(StringWithID(string: ""), at: 0)
            }label: {
                Label(addText, systemImage: "plus")
                    .labelStyle(.iconOnly)
            }
        }
    }
}

//struct AddPetView_Previews: PreviewProvider {
//
//    @State private var listPets = PetsList.myPets
//
//    static var previews: some View {
//        AddPetView(myPetsList: $listPets)
//    }
//}
