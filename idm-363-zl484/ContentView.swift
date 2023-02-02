//
//  ContentView.swift
//  Swift Test
//
//  Created by Zhengtian Li on 1/24/23.
//


import SwiftUI

struct ContentView: View {
    @State private var colorPalette: [Color] = [.white,.yellow,.blue,.orange,.purple]
    @State public var paletteCount = 5;
    
    var body: some View {
        TabView{
            MainView(colorPalette: self.$colorPalette, paletteCount: self.$paletteCount).tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("test")
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
                Text("Copy Palette")
                Spacer()
                Menu("SVG") {
                    Text("Menu Item 1")
                    /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                }
                
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16)
            .foregroundColor(Color.white)
            .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5))
    }
}

struct MainView: View {
    @Binding var colorPalette:[Color]
    @Binding var paletteCount:Int
    
    var body: some View {
        NavigationView{
            VStack(spacing: 24){
                VStack(spacing: 16){
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                        .overlay(
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64)
                                .foregroundColor(.secondary)
                        )
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .aspectRatio(1.6, contentMode: .fit)
                        .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5)
                    
                    HStack(spacing: 16){
                        Button{
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }label: {
                            Spacer()
                            Image(systemName: "folder")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 21)
                            Spacer()
                        }
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .buttonStyle(.borderedProminent)
                        
                        Button{
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }label: {
                            Spacer()
                            Image(systemName: "camera")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 21)
                            Spacer()
                        }
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                ColorPaletteView(colorPalette: self.$colorPalette, paletteCount: self.$paletteCount)
                Spacer()
            }.padding(20)}
    }
}
