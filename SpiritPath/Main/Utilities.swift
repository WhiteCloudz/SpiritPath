//
//  Utilities.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/1/23.
//


import UIKit
import CoreData


extension UIViewController{
    
    func cornerRadius(buttonName:UIButton){
            buttonName.layer.cornerRadius = buttonName.bounds.height / 2
            buttonName.layer.masksToBounds = true
        }
    
    func ScrollerSetup(name:UIScrollView, Height:Int){
        name.isScrollEnabled = true
        let desiredHeight: CGFloat =  CGFloat(Height)
        name.contentSize = CGSize(width: name.frame.size.width, height: desiredHeight)
    }
    
    func ScrollHorizental (name:UIScrollView, Width:Int){
        name.isScrollEnabled = true
        let desiredWidth: CGFloat =  CGFloat(Width)
        name.contentSize = CGSize(width: desiredWidth, height: name.frame.size.height)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField, editText:String) {
        textField.placeholder = editText
    }
    func cornerRadiusImg(imageViewName:UIImageView){
        imageViewName.layer.cornerRadius = imageViewName.bounds.height / 2
        imageViewName.layer.masksToBounds = true
        }
    
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert,animated:  true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alert.dismiss(animated: true, completion: nil)
            }
        
    }
    
    func setupBackroundImageToVievController(imageNamed: String, backroundView:UIView ){
        if let backgroundImage = UIImage(named: imageNamed) {
            let imageView = UIImageView(image: backgroundImage)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            backroundView.addSubview(imageView)
            backroundView.sendSubviewToBack(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: backroundView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: backroundView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: backroundView.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: backroundView.bottomAnchor)
            ])
        }
    }
    
    func routineReminderMessage() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<SwitchData> = SwitchData.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            if let existingData = result.first {
                if existingData.switchValue == true {
                let alert = UIAlertController(title: "Reminder", message: "Please update your daily routine.", preferredStyle: .alert)
                DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Reminder", message: "Please update your daily routine.", preferredStyle: .alert)
                if let currentViewController = UIApplication.shared.windows.first?.rootViewController {
                    currentViewController.present(alertController, animated: true, completion: nil)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    alertController.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    } else {
            return
            }
        } catch {
            print("Error: \(error)")
        }
    }
}


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


    
