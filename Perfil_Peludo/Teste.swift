//
//  Teste.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 16/05/22.
//

import SwiftUI

struct Teste: View {
    var body: some View {
        List{
            Section {
                Label("Sun", systemImage: "sun.max")
                Label("Cloud", systemImage: "cloud")
                Label("Rain", systemImage: "cloud.rain")
            }
        }.listStyle(PlainListStyle())
    }
}

struct Teste_Previews: PreviewProvider {
    static var previews: some View {
        Teste()
    }
}
