//
//  ViewController.swift
//  Example
//
//  Created by kyo__hei on 2016/09/19.
//  Copyright © 2016年 kyo__hei. All rights reserved.
//

import UIKit
import KYDigitalFontView

class ViewController: UIViewController, UITextFieldDelegate {
    
    /**************************************************************************/
    // MARK: - Properties
    /**************************************************************************/
    
    @IBOutlet fileprivate weak var _digitalFontView : KYDigitalFontView!
    @IBOutlet fileprivate weak var _bottomConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var _textField       : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _digitalFontView.drawPositions = .All
        
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(ViewController.keyboardWillShowNotification(_:)),
                         name: NSNotification.Name.UIKeyboardWillShow,
                         object: nil
        )
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(ViewController.keyboardWillHideNotification(_:)),
                         name: NSNotification.Name.UIKeyboardWillHide,
                         object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    /**************************************************************************/
    // MARK: - Notification
    /**************************************************************************/
    
    func keyboardWillShowNotification(_ notification: Notification) {
        if let keyboardFrame = ((notification as NSNotification).userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue,
            let duration      = ((notification as NSNotification).userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        {
            self._bottomConstraint.constant += keyboardFrame.height
            UIView.animate(withDuration: duration, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func keyboardWillHideNotification(_ notification: Notification) {
        if let keyboardFrame = ((notification as NSNotification).userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue,
            let duration      = ((notification as NSNotification).userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
        {
            self._bottomConstraint.constant -= keyboardFrame.height
            UIView.animate(withDuration: duration, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    /**************************************************************************/
    // MARK: - Action
    /**************************************************************************/
    
    @IBAction func handleValueChaned(_ sender: UISwitch) {
        let drawPosition: KYDigitalFontView.DrawPositions
        switch sender.tag - 1 {
        case 0:
            drawPosition = ._0
        case 1:
            drawPosition = ._1
        case 2:
            drawPosition = ._2
        case 3:
            drawPosition = ._3
        case 4:
            drawPosition = ._4
        case 5:
            drawPosition = ._5
        case 6:
            drawPosition = ._6
        case 7:
            drawPosition = ._7
        case 8:
            drawPosition = ._8
        case 9:
            drawPosition = ._9
        case 10:
            drawPosition = ._10
        case 11:
            drawPosition = ._11
        case 12:
            drawPosition = ._12
        case 13:
            drawPosition = ._13
        case 14:
            drawPosition = ._14
        case 15:
            drawPosition = ._15
        default:
            drawPosition = ._0
            break
        }
        if sender.isOn {
            _digitalFontView.drawPositions.update(with: drawPosition)
        } else {
            _digitalFontView.drawPositions.remove(drawPosition)
        }
    }
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        _textField.resignFirstResponder()
    }
    
    /**************************************************************************/
    // MARK: - TextFieldDelegate
    /**************************************************************************/
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text?.isEmpty)! {
            return
        }
        let char = textField.text!.characters.first!
        _digitalFontView.drawPositions = KYDigitalFontView.DrawPositions(character: char)
        
        (view.viewWithTag(1) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._0])
        (view.viewWithTag(2) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._1])
        (view.viewWithTag(3) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._2])
        (view.viewWithTag(4) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._3])
        (view.viewWithTag(5) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._4])
        (view.viewWithTag(6) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._5])
        (view.viewWithTag(7) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._6])
        (view.viewWithTag(8) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._7])
        (view.viewWithTag(9) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._8])
        (view.viewWithTag(10) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._9])
        (view.viewWithTag(11) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._10])
        (view.viewWithTag(12) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._11])
        (view.viewWithTag(13) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._12])
        (view.viewWithTag(14) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._13])
        (view.viewWithTag(15) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._14])
        (view.viewWithTag(16) as! UISwitch).isOn = _digitalFontView.drawPositions.contains([._15])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.text = ""
        return true
    }

}
