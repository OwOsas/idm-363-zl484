//
//  ColorExtractView.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/2/23.
//

import SwiftUI
import ColorKit

struct ColorExtractView: View {
    private var loadImg:UIImage = UIImage(named: "example")!

    @State private var colorArr:[Color] = []
    
    var body: some View {
        let colors = getDominantColor(img: loadImg)
//        Text("\(colors[4].frequency)")

        
        Rectangle()
            .frame(width: 300, height: 300)
            .aspectRatio(1, contentMode: .fit)
            .overlay(Color(uiColor: colors[2].color))
//        self.$colorArr = extractColors(from: CIImage(image: loadImg))
    }
    
    func getDominantColor(img:UIImage) -> [ColorFrequency]{
        var currentImage: UIImage! {
            didSet {
                guard oldValue != currentImage else { return }
                do {
                    dominantColors = try currentImage.dominantColorFrequencies()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
        var dominantColors = [ColorFrequency]()
        currentImage = img
        return dominantColors
    }
}

struct ColorExtractView_Previews: PreviewProvider {
    static var previews: some View {
        ColorExtractView()
    }
}
