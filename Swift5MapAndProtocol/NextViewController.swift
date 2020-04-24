//
//  NextViewController.swift
//  Swift5MapAndProtocol
//
//  Created by 山本ののか on 2020/04/24.
//  Copyright © 2020 Nonoka Yamamoto. All rights reserved.
//

import UIKit

protocol SearchLocationDelegate {
    
    func searchLocation(idoValue: String, keidoValue: String)
}

class NextViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var idoTextField: UITextField!
    @IBOutlet weak var keidoTextField: UITextField!
    
    var delegate: SearchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idoTextField.delegate = self
        keidoTextField.delegate = self
    }
    
    @IBAction func okAction(_ sender: Any) {
        
        //入力された値を取得
        let idoValue = idoTextField.text!
        let keidoValue = keidoTextField.text!
        //デリゲートメソッドの引数に入れる
        delegate?.searchLocation(idoValue: idoValue, keidoValue: keidoValue)
        //両方のTFが空でなければ戻る
        if idoTextField.text != nil && keidoTextField.text != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {

           textField.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
