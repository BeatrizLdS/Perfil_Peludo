//
//  PhotoPicker.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 18/05/22.
//

import SwiftUI

struct PhotoPicker: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationView{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .toolbar{
                    ToolbarItem{
                        saveButtonView
                        
                    }
                }
                
        }
    }
    
    var saveButtonView : some View {
        Button{
            dismiss()
        } label: {
            Label("Save", systemImage: "square.and.arrow.down")
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
