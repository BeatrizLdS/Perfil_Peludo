//
//  Teste.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 13/05/22.
//

import SwiftUI

struct Teste: View {
    var body: some View {
        NavigationView {
            Text("Hello, SwiftUI!")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Title").font(.headline)
                            Image(systemName: "sun.min.fill")
                        }
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
