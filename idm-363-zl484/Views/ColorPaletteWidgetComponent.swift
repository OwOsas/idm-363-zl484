//
//  ColorPaletteView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/1/23.
//

import SwiftUI

struct ColorPaletteWidget_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}

struct ColorPaletteWidget: View {
    @Binding var colorPalette: [UIColor]
    @Binding var paletteCount:Int
    @Binding var selectedImg:UIImage?
    //    @State private var selectedImg:UIImage = UIImage(named: "TestImg_05")!
    
    enum exportFormat{
        case SVG, HEX, RGB
    }
    
    var body: some View {
        VStack(spacing: 16){
            VStack{
                VStack(spacing: 6){
                    Text("Palette")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                    DynamicPalette(
                        colorPalette: $colorPalette,
                        paletteCount: $paletteCount
                    )
                    .onChange(of: selectedImg) { newValue in
                        print("Name changed to ")
                        if(selectedImg != nil){
                            colorPalette = ExtractColorPalette(UIImg: selectedImg!)
                        }
                    }
                }
                
                HStack{
                    Text("Palette Size")
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    HStack{
                        Spacer()
                        //                    TextField("\(paletteCount)", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        //                        .keyboardType(.decimalPad)
                        Text("\(paletteCount)")
                        
                            .padding([.leading, .trailing], 16)
                            .padding([.top, .bottom], 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color("Border"), lineWidth: 2)
                            )
                        Stepper(value: $paletteCount, in: 5...$colorPalette.count){}
                    }
                }
                
                HStack{
                    Text("Copy Colors")
                    Spacer()
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Copy Format")) {
                        Text("HEX").tag(1)
                        Text("RGB").tag(2)
                    }
                    .padding([.leading, .trailing], 4)
                    .accentColor(Color("Text"))
                    .foregroundColor(Color("Text"))
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("Border"), lineWidth: 2)
                            .foregroundColor(Color("Border"))
                            .frame(minWidth: 0, maxWidth: .infinity)
                    )
                    
                    
                    Button{}label: {
                        Image(systemName: "doc.on.doc")
                    }
                    .padding([.leading, .trailing], 16)
                    .padding([.top, .bottom], 6)
                    .foregroundColor(Color("Text"))
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("Border"))
                            .frame(minWidth: 0, maxWidth: .infinity)
                    )
                }
            }
            
        }
        .padding(20)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(RoundedRectangle(cornerRadius: 16)
            .foregroundColor(Color.white)
            .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: -10))
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

