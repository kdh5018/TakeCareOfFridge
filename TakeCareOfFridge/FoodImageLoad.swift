//
//  FoodImageLoad.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/15.
//

import UIKit
import PhotosUI

class FoodImageLoad: UIImagePickerControllerDelegate , PHPickerViewControllerDelegate
func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    <#code#>
}

func isEqual(_ object: Any?) -> Bool {
    <#code#>
}

var hash: Int

var superclass: AnyClass?

func `self`() -> Self {
    <#code#>
}

func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
    <#code#>
}

func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
    <#code#>
}

func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
    <#code#>
}

func isProxy() -> Bool {
    <#code#>
}

func isKind(of aClass: AnyClass) -> Bool {
    <#code#>
}

func isMember(of aClass: AnyClass) -> Bool {
    <#code#>
}

func conforms(to aProtocol: Protocol) -> Bool {
    <#code#>
}

func responds(to aSelector: Selector!) -> Bool {
    <#code#>
}

var description: String
UINavigationControllerDelegate {
    
    var plusView = PlusViewController()
    // 사진 추가
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in DispatchQueue.main.async {
                self.plusView.foodImage.image = image as? UIImage
            }}
        } else {
            print("이미지를 못 불러왔어요.")
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            self.plusView.foodImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func camera() {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .rear
        camera.delegate = self
        present(camera, animated: true, completion: nil)
        
    }

    func album() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images, .livePhotos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}
