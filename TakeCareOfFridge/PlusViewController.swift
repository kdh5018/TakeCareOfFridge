//
//  PlusViewController.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/14.
//

import UIKit
import PhotosUI

class PlusViewController: UIViewController, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var foodImage: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // 음식 추가 창 끄기
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // 사진 추가 버튼
    @IBAction func foodImageButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "사진 불러오기", message: "사진을 불러옵니다", preferredStyle: .actionSheet)
        let actionAlbum = UIAlertAction(title: "앨범에서 불러오기", style: .default, handler: { action in
            self.album()
        })
        let actionCamera = UIAlertAction(title: "카메라로 불러오기", style: .default, handler:  { action in
            self.camera()
        })
        let actionCancel = UIAlertAction(title: "취소하기", style: .cancel, handler: nil)
        
        alert.addAction(actionCamera)
        alert.addAction(actionAlbum)
        alert.addAction(actionCancel)
        
        self.present(alert, animated: true)
    }
    
    // 사진 추가
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in DispatchQueue.main.async {
                self.foodImage.image = image as? UIImage
            }}
        } else {
            print("이미지를 못 불러왔어요.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
                    foodImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
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

