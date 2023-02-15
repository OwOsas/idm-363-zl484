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
    }
}

struct HomeView: View {
    @Binding var colorPalette:[UIColor]
    @Binding var paletteCount:Int
    @Binding var selectedImg:UIImage?
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 24){
                    VStack(spacing: 16){
                        //Image Display
                        VStack{
                            if selectedImg != nil{
                                Image(uiImage: selectedImg!)
                                    .resizable()
                                    .scaledToFit()
                            }
                            else{
                                Spacer()
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 64)
                                    .foregroundColor(.gray)
                                    
                                Spacer()
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .aspectRatio(1.6, contentMode: .fit)
                        .background(                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .aspectRatio(1.6, contentMode: .fit)
                            .shadow(color: Color.black.opacity(0.1 ), radius: 5, x: 0, y: 5)
                        )
                        //Image Display End

                        
                        HStack(spacing: 16){
                            Button{
                                selectedImg = UIImage(named: "TestImg_01")
                                print("Button Clicked")
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
                    
                    ColorPaletteWidget(colorPalette: self.$colorPalette, paletteCount: self.$paletteCount, selectedImg: self.$selectedImg)
                    Spacer()
                }
                .padding([.leading, .trailing], 20)
            }.navigationTitle("Generate")
        }
        .tabItem{
            Image(systemName: "house")
            Text("Home")
        }
    }
}
