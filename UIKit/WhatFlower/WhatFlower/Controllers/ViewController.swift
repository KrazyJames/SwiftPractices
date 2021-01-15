//
//  ViewController.swift
//  WhatFlower
//
//  Created by Jaime Escobar on 13/07/20.
//  Copyright © 2020 Jaime Escobar. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    private var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        resultImageView.layer.cornerRadius = 16
        resultImageView.clipsToBounds = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            guard let ciImage = CIImage(image: image) else { return }
            detect(image: ciImage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        if (sender.tag == 0) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            return
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                guard let results = request.results as? [VNClassificationObservation] else { return }
                if let first = results.first {
                    self.fetch(flowerName: first.identifier)
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
    
    private func fetch(flowerName: String) {
        let wikipediaURl = "https://en.wikipedia.org/w/api.php"
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "pithumbsize" : "500",
        ]
        
        AF.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if let result = response.value {
                let json = JSON(result)
                let pageid = json["query"]["pageids"][0].stringValue
                let extract = json["query"]["pages"][pageid]["extract"].stringValue
                let title = json["query"]["pages"][pageid]["title"].stringValue
                let imageUrl = json["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                self.resultImageView.sd_setImage(with: URL(string: imageUrl))
                self.imageView.alpha = 0.5
                self.navigationItem.title = title
                self.textView.text = extract
                print(json)
            }
        }
    }
    
}

