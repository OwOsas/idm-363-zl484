//
//  ColorPalette.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/8/23.
//

import SwiftUI

struct DynamicPalette: View {
    @Binding var colorPalette: [UIColor]
    @Binding var paletteCount: Int
    
    var body: some View {
        HStack(spacing:0){
            ForEach(sliceUIColorArr(arr: colorPalette, count: paletteCount), id: \.self){color in
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
        .shadow(color: Color.black.opacity(0.1 ), radius: 2, x: 0, y: 2)
    }
}

struct Palette: View {
    var colorPalette: [UIColor]
    
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
        .shadow(color: Color.black.opacity(0.1 ), radius: 2, x: 0, y: 2)
    }
}

func sliceUIColorArr(arr:[UIColor], count:Int) -> [UIColor]{
    if(arr.count < count){
        return arr
    }
    
    return Array(arr.prefix(count))
}

struct Palette_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
