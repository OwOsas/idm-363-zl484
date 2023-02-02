//
//  ColorPaletteView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/1/23.
//

import SwiftUI

struct ColorPalette_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorPaletteView: View {
    @Binding var colorPalette: [Color]
    @Binding var paletteCount:Int
    
    enum exportFormat{
        case SVG, HEX, RGB
    }
    
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 6){
                Text("Color Palette")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .font(.title3)
                
                let ColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: paletteCount)
                
                LazyVGrid(columns: ColumnGrid, spacing: 8) {
                    ForEach(colorPalette, id: \.self){ color in
                        ColorBlockView(blockColor: color)
                    }
                }.frame(minHeight: 64, alignment: .top)
            }
            
            HStack{
                Text("Palette Size")
                Spacer()
                
                Stepper(value: $paletteCount, in: 5...10) {
                    Text("\(paletteCount)")
                }
                
            }
            
            HStack{
                Text("Copy Format")
                Spacer()
                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Copy Format")) {
                    Text("HEX").tag(1)
                    Text("RGB").tag(2)
                }
            }
            Button{
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }label: {
                Spacer()
                Image(systemName: "doc.on.doc.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                Spacer()
            }
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            .buttonStyle(.borderedProminent)
            
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16)
            .foregroundColor(Color.white)
            .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5))
    }
}

struct ColorBlockView: View {
    var blockColor: Color = Color.white
    var body: some View {
        RoundedRectangle(cornerRadius: 8).foregroundColor(blockColor)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1))
            .aspectRatio(1.0, contentMode: .fit)
    }
}

