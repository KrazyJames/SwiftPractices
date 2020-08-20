//
//  ImageDetectionViewModel.swift
//  CoreMLSwiftUI
//
//  Created by Jaime Escobar on 19/08/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject {
    @Published var predictionLabel: String = ""
    var manager: ImageDetectionManager
    var name = ""
    
    init() {
        self.manager = ImageDetectionManager()
    }
    
    func detect(_ image: String) {
        guard let img = UIImage(named: image),
            let resizedImg = img.resizeImage(size: CGSize(width: 224, height: 224)),
            let result = manager.detect(resizedImg) else { return }
        predictionLabel = result
    }
}
