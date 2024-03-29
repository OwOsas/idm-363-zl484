//
//  HomeView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/1/23.
//

import SwiftUI
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}

struct HomeView: View {
    @Binding var colorPalette:[UIColor]
    @Binding var paletteCount:Int
    @Binding var selectedImg:UIImage?
    
    @State var isPickerShowing = false
    @State var isCameraShowing = false
    @State var isActionSheetShowing = false
    
    private let pastboard = UIPasteboard.general
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing: 28){
                    VStack(spacing: 16){
                        //Image Display
                        if selectedImg != nil{
                            VStack{
                                Image(uiImage: selectedImg!)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(8)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .aspectRatio(1.6, contentMode: .fit)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .aspectRatio(1.6, contentMode: .fit)
                            )
                        }
                        else{
                            VStack{
                                Spacer()
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 64)
                                    .foregroundColor(Color("Border"))
                                
                                Spacer()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .aspectRatio(1.6, contentMode: .fit)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .aspectRatio(1.6, contentMode: .fit)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(Color("Border"), style: StrokeStyle(lineWidth: 2, dash: [5, 2]))
                                    .foregroundColor(.clear)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .aspectRatio(1.6, contentMode: .fit)
                            )
                        }
                        
                        //Image Display End
                        
                    }
                    .padding([.leading, .trailing], 20)
                    
                    
                    ColorPaletteWidget(colorPalette: self.$colorPalette, paletteCount: self.$paletteCount, selectedImg: self.$selectedImg)
                    
                    VStack(spacing: 16){
                        Button{
                            //                        selectedImg = UIImage(named: "TestImg_06")
                            isActionSheetShowing = true
                            print("Button Clicked")
                        }label: {
                            HStack(spacing: 20){
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28)
                                Spacer()
                                
                                Text("New Image")
                                Spacer()
                                Spacer()
                                    .frame(width: 28)
                                
                            }
                        }
                        .background(.clear)
                        .foregroundColor(Color("Text"))
                        .padding([.leading, .trailing], 25)
                        .padding([.top, .bottom], 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color("Border"), style: StrokeStyle(lineWidth: 2, dash: [5, 2]))
                                .foregroundColor(.clear)
                                .frame(minWidth: 0, maxWidth: .infinity)
                        )
                        
                        
//                        Button{
//
//                        }label: {
//                            Spacer()
//                            Text("SAVE PALETTE")
//                            Spacer()
//                        }
//                        .padding(12)
//                        .foregroundColor(.white)
//                        .background(
//                            RoundedRectangle(cornerRadius: 8)
//                                .foregroundColor(Color("Button"))
//                                .frame(minWidth: 0, maxWidth: .infinity)
//                        )
                        
                    }
                    .padding([.leading, .trailing], 20)
                    .actionSheet(isPresented: $isActionSheetShowing, content: {()-> ActionSheet in
                        ActionSheet(title: Text("New Image"),
                                    buttons: [
//                                        .default(
//                                            Text("Camera"), action: {
//                                                isCameraShowing = true
//                                            }),
                                        .default(
                                            Text("Gallery"), action: {
                                                isPickerShowing = true
                                            }),
                                        .cancel()
                                    ]
                        )
                        
                    })
                    .sheet(isPresented: $isPickerShowing, content: {
                        ImagePicker(selectedImg: $selectedImg, isCamera: false)
                    })
                    .fullScreenCover(isPresented: $isCameraShowing, content: {
                        ImagePicker(selectedImg: $selectedImg, isCamera: true)
                    })
                }
                .padding([.top, .bottom], 20)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
            }
            
        }
        .tabItem{
            Image(systemName: "house")
            Text("Home")
        }
    }
}
