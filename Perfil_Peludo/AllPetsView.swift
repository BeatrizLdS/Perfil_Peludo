//
//  ContentView.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 13/05/22.
//

import SwiftUI

struct AllPetsView: View {
    var body: some View {
        NavigationView {
            List (0..<2){ item in
                PetPreviewView().contextMenu{
                   DeleteButtonView()
                }
            }
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
                    AddPetButton()
                }
            }
        }
    }
}

struct PetPreviewView : View {
    var body: some View{
        NavigationLink(destination: PetPerfilView(),
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
                                Text("Nome do animal")
                                Text("Tipo")
                                Text("Idade")
                            }
                        }
                        })
    }
}

struct DeleteButtonView : View {
    var body: some View {
        Button (role: .destructive) {
            print("Excluir um Pet")
        } label: {
            Label("Excluir", systemImage: "trash")
        }
    }
}

struct AddPetButton : View {
    var body: some View{
        HStack{
            Button{
                print("Adicionar novo animal")
            }label: {
                Label("Adicionar Pet", systemImage: "plus.circle.fill")
            }
            .labelStyle(.titleAndIcon)
            .font(.system(.title2).weight(.semibold))
            
            Spacer()
        }
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
