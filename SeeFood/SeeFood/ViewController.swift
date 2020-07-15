//
//  ViewController.swift
//  SeeFood
//
//  Created by Jaime Escobar on 12/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var imagePicker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            guard let ciImage = CIImage(image: image) else { return }
            detect(image: ciImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    private func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else { return }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                guard let results = request.results as? [VNClassificationObservation] else { return }
                if let first = results.first {
                    if first.identifier.contains("hotdog") {
                        self.navigationItem.title = "Hotdog"
                    } else {
                        self.navigationItem.title = "Not Hotdog"
                    }
                }
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        if (sender.tag == 0) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
}

