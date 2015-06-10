/*
The MIT License (MIT)

Copyright (c) 2015 Kyohei Yamaguchi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    /**************************************************************************/
    // MARK: - Properties
    /**************************************************************************/
    
    @IBOutlet private weak var _digitalFontView : KYDigitalFontView!
    @IBOutlet private weak var _bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var _textField       : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _digitalFontView.drawPositions = .All
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShowNotification:",
            name: UIKeyboardWillShowNotification,
            object: nil
        )
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHideNotification:",
            name: UIKeyboardWillHideNotification,
            object: nil
        )
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    /**************************************************************************/
    // MARK: - Notification
    /**************************************************************************/
    
    func keyboardWillShowNotification(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue(),
           let duration      = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue
        {
            self._bottomConstraint.constant += keyboardFrame.height
            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }

    func keyboardWillHideNotification(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue(),
            let duration      = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue
        {
            self._bottomConstraint.constant -= keyboardFrame.height
            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    /**************************************************************************/
    // MARK: - Action
    /**************************************************************************/

    @IBAction func handleValueChaned(sender: UISwitch) {
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
        if sender.on {
            _digitalFontView.drawPositions |= drawPosition
        } else {
            _digitalFontView.drawPositions ^= drawPosition
        }
    }
    
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        _textField.resignFirstResponder()
    }
    
    /**************************************************************************/
    // MARK: - TextFieldDelegate
    /**************************************************************************/
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.text.isEmpty {
            return
        }
        let char = textField.text[advance(textField.text.startIndex, 0)]
        _digitalFontView.drawPositions = KYDigitalFontView.DrawPositions.positionsWithCharacter(char)
        
        (view.viewWithTag(1) as! UISwitch).on = _digitalFontView.drawPositions & ._0 != nil
        (view.viewWithTag(2) as! UISwitch).on = _digitalFontView.drawPositions & ._1 != nil
        (view.viewWithTag(3) as! UISwitch).on = _digitalFontView.drawPositions & ._2 != nil
        (view.viewWithTag(4) as! UISwitch).on = _digitalFontView.drawPositions & ._3 != nil
        (view.viewWithTag(5) as! UISwitch).on = _digitalFontView.drawPositions & ._4 != nil
        (view.viewWithTag(6) as! UISwitch).on = _digitalFontView.drawPositions & ._5 != nil
        (view.viewWithTag(7) as! UISwitch).on = _digitalFontView.drawPositions & ._6 != nil
        (view.viewWithTag(8) as! UISwitch).on = _digitalFontView.drawPositions & ._7 != nil
        (view.viewWithTag(9) as! UISwitch).on = _digitalFontView.drawPositions & ._8 != nil
        (view.viewWithTag(10) as! UISwitch).on = _digitalFontView.drawPositions & ._9 != nil
        (view.viewWithTag(11) as! UISwitch).on = _digitalFontView.drawPositions & ._10 != nil
        (view.viewWithTag(12) as! UISwitch).on = _digitalFontView.drawPositions & ._11 != nil
        (view.viewWithTag(13) as! UISwitch).on = _digitalFontView.drawPositions & ._12 != nil
        (view.viewWithTag(14) as! UISwitch).on = _digitalFontView.drawPositions & ._13 != nil
        (view.viewWithTag(15) as! UISwitch).on = _digitalFontView.drawPositions & ._14 != nil
        (view.viewWithTag(16) as! UISwitch).on = _digitalFontView.drawPositions & ._15 != nil
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.text = ""
        return true
    }

}

