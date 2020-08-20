//
//  ImageDetectionManager.swift
//  CoreMLSwiftUI
//
//  Created by Jaime Escobar on 19/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import UIKit
import CoreML

class ImageDetectionManager {
    var model = Resnet50()
    
    func detect(_ img: UIImage) -> String? {
        guard let image = img.getCVPixelBuffer(),
            let prediction = try? model.prediction(image: image) else {
            return nil
        }
        return prediction.classLabel
    }
}
