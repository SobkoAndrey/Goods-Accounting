//
//  AddProductView.swift
//  Goods Accounting
//
//  Created by Andrey Sobko on 21.09.16.
//  Copyright © 2016 Andrey Sobko. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
        }
    }
    
    @IBOutlet weak var addPhotoButton: UIButton! {
        didSet {
            addPhotoButton.layer.cornerRadius = addPhotoButton.bounds.height / 2
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    @IBAction func addPhotoButtonTouchUpInside(sender: UIButton?) {
        // Creation image picker. Transition to photo library.
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .PhotoLibrary
            
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    // MARK: - Keyboard
    
    @IBAction func tapOnView(sender: AnyObject?) {
        // Remove keyboard.
        view.endEditing(false)
    }
    
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(AddProductViewController.keyboardWillChangeFrame(_:)),
            name: UIKeyboardWillChangeFrameNotification,
            object: nil
        )
    }
    
    func keyboardWillChangeFrame(notification: NSNotification) {
        
        // Offset view in relation to keyboard.
        
        guard let info = notification.userInfo else { return }
        
        guard let finish = info[UIKeyboardFrameEndUserInfoKey]?.CGRectValue
            else { return }
        
        UIView.beginAnimations(nil, context: nil)
        
        if let duration = info[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
            UIView.setAnimationDuration(duration)
        }
        
        if let animationID = info[UIKeyboardAnimationCurveUserInfoKey]?.integerValue,
            let animationCurve = UIViewAnimationCurve(rawValue: animationID) {
            UIView.setAnimationCurve(animationCurve)
        }
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        scrollView.contentInset = UIEdgeInsets(top: scrollView.contentInset.top, left: 0.0,
                                                bottom: UIScreen.mainScreen().bounds.height - finish.minY, right: 0.0)
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()
    }
}

extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // Add selected image.
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.contentMode = .ScaleAspectFill
        photoImageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
