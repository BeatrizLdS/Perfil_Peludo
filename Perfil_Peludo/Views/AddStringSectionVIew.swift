//
//  AddStringSectionVIew.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 19/05/22.
//

import SwiftUI

struct AddStringSectionView : View {
    
    @Binding  var list : [StringWithID]
    @FocusState private var focusedField : UUID?
    
    var title : String
    var objectname : String
    
    var body: some View {
        Section(title){
            
            List {
                ForEach($list) { $object in
                    TextField(objectname, text: $object.string)
                        .focused($focusedField, equals: object.id)
                }
            }
            
            HStack {
                Button{
                    list.insert(StringWithID(string: ""), at: 0)
                    focusedField = list.first!.id
                }label: {
                    Label("Adicionar " + objectname, systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
                Spacer()
            }
            
            
        }
    }
}

//struct AddStringSectionVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        AddStringSectionView()
//    }
//}
