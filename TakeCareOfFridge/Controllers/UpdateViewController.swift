//
//  UpdateViewController.swift
//  TakeCareOfFridge
//
//  Created by 김도훈 on 2022/11/25.
//

import UIKit
import PhotosUI

class UpdateViewController: UIViewController, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodCategoryButton: UIButton!

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 음식 카테고리 설정
        setFoodCategory()
        
    }
    // MARK: DatePikcer String 형변환
    @IBAction func foodDate(_ sender: UIDatePicker) {
        let pickedDate = sender.date
        let today = DateFormatter()
        today.dateFormat = "yyyy년 MM월 dd일"
        let resultDate = today.string(from: pickedDate)
        print(resultDate)
        
    }
    
    // MARK: 음식 수정 창 끄기
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: 사진 추가 버튼
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
    
    // MARK: 음식 수정 버튼
    @IBAction func updateFood(_ sender: UIButton) {
        
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
    
    func setFoodCategory() {
        let optionClosuer = {(action : UIAction) in print(action.title)}
        
        foodCategoryButton.menu = UIMenu(children : [
            UIAction(title: "음식 카테고리🍭", state: .on, handler: optionClosuer),
            UIAction(title: "냉동/간편🥟", handler: optionClosuer),
            UIAction(title: "육류🥩", handler: optionClosuer),
            UIAction(title: "유제품🥛", handler: optionClosuer),
            UIAction(title: "채소🥬", handler: optionClosuer),
            UIAction(title: "반찬🧆", handler: optionClosuer),
            UIAction(title: "기타", handler: optionClosuer)])
        
        foodCategoryButton.showsMenuAsPrimaryAction = true
        foodCategoryButton.changesSelectionAsPrimaryAction = true
    }
    
}

