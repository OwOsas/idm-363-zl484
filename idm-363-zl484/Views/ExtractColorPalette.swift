//
//  ExtractColorPalette.swift
//  idm-363-zl484
//
//  Created by Zhengtian Li on 2/8/23.
//

import Foundation
import ColorKit
import SwiftUI

func ExtractColorPalette(img:UIImage) -> [UIColor]{
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
    
    var colorPalette = [UIColor]()
    for i in 0..<dominantColors.count{
        colorPalette += [dominantColors[i].color]
    }
    return colorPalette
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

func getColorPalette(ColorFrequencyArray arr: [ColorFrequency], ArrayCount count: Int) -> [UIColor]{
    var colorPalette = [UIColor]()
    for i in 0..<count{
        colorPalette += [arr[i].color]
    }
    
    return colorPalette
}

func getSize(arr:[Any]) -> Int{
    return arr.count
}
