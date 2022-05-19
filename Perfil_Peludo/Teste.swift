//
//  Teste.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 16/05/22.
//

import SwiftUI

struct Teste: View {
    
    var body: some View {
        
        Form {
            Section(header: Text("Test")) {
                VStack {
                    HStack {
                        Button("Button 1") {
                            print("Button 1")
                        }
                        Spacer()
                        Button("Button 2") {
                            print("Button 2")
                        }
                    }

                    Text("Some Text")
                        .font(.headline)
                }
            }
        }
    }
}

struct Teste_Previews: PreviewProvider {
    static var previews: some View {
        Teste()
    }
}
