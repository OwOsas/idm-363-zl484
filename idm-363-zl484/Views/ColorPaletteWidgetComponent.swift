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
    @Binding var isNotificationShowing:Bool
    @Binding var copyFormat:Int
    //    @State private var selectedImg:UIImage = UIImage(named: "TestImg_05")!
    @State private var palette: [UIColor] = []
    @State private var colorArray:[String]?
    @State private var failedToCopyAlert: Bool = false
    @State private var cannotExtract: Bool = false
    @State private var selctedFormat = 1
    
    private let pasteboard = UIPasteboard.general
    
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
                            palette = ExtractColorPalette(UIImg: selectedImg!)
                        }
                        if(palette.count <= 0){
                            cannotExtract = true
                        }
                        else{
                            colorPalette = palette
                        }
                    }
                }
                
                //                HStack{
                //                    Text("Test")
                //                    ForEach(colorPalette, id: \.self){theColor in
                //                        //                        Rectangle()
                //                        //                        .overlay(Color(uiColor: theColor))
                ////                        Text(Color(uiColor: theColor).toHex()!)
                //                    }
                //
                //
                //                }
                
                HStack{
                    Text("Palette Size")
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    HStack{
                        Spacer()
                        Text("\(paletteCount)")
                        
                            .padding([.leading, .trailing], 16)
                            .padding([.top, .bottom], 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color("Border"), lineWidth: 2)
                            )
                        Stepper(value: $paletteCount, in: 0...$colorPalette.count){}
                    }
                }
                Text("")
                
                HStack{
                    Text("Copy Colors")
                    Spacer()
                    Picker(selection: $selctedFormat, label: Text("Copy Format")) {
                        Text("HEX").tag(0)
                        Text("RGB").tag(1)
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
                    
                    Button{
                        //print(arrClrToHex(ColorArr: colorPalette) ?? "ERRO Converting")
                        var arr:[String] = []
                        for color in colorPalette{
                            if(selctedFormat == 0){
                                arr.append(toHex(color:Color(uiColor: color)) ?? "<Cannot Convert>")
                            }
                            else{
                                arr.append(toRGB(color:Color(uiColor: color)) ?? "<Cannot Convert>")
                            }
                        }
                        
                        if !arr.contains("<Cannot Convert>") && !arr.contains("") && colorPalette.count > 0{
                            var copyText = ""
                            
                            if(selctedFormat == 0){
                                for ele in arr {
                                    copyText += "#\(ele) "
                                    print("\(ele)")
                                }
                            }
                            else{
                                for ele in arr {
                                    copyText += "\(ele) "
                                    print("\(ele)")
                                }
                            }
                            
                            pasteboard.string = copyText
                            SoundManager.instance.playSound()
                            isNotificationShowing = true
                        }
                        else{
                            failedToCopyAlert = true
                        }
                    }label: {
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
                    .alert("Palette Is Empty", isPresented: $failedToCopyAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .alert(isPresented: $cannotExtract) {
                        Alert(title: Text("Cannot Extract"),
                              message: Text("Image format not compatible, try taking a screenshot of the image"),
                              dismissButton: .default(Text("Got it!")))
                    }
                    .onChange(of: copyFormat) { newValue in
                        selctedFormat = copyFormat
                    }
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

