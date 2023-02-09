//
//  ColorPalette.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/8/23.
//

import SwiftUI

struct Palette: View {
    @Binding var colorPalette: [UIColor]
    
    var body: some View {
        HStack(spacing:0){
            ForEach(colorPalette, id: \.self){color in
                Rectangle()
                .overlay(Color(uiColor: color))}
        }
        .frame(height: 48)
        .mask(
            RoundedRectangle(cornerRadius: 12)
                .fill(.red)
                .frame(
                    minWidth: 0, maxWidth: .infinity
                )
        )
        .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5)
    }
}

struct Palette_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
