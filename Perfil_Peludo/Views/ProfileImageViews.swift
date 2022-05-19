//
//  ProfileImageViews.swift
//  Perfil_Peludo
//
//  Created by Beatriz Leonel da Silva on 19/05/22.
//

import SwiftUI

struct ProfileImageView: View {
    
    var pet : Pet
    
    var body: some View {
        Image(uiImage: pet.image)
            .resizable()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
    }
}

struct ProfileDefaultImageView: View {
    
    var body: some View {
        Image(systemName: "pawprint.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
    }
    
}

//
//struct ProfileImageViews_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileImageViews()
//    }
//}
