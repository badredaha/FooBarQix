//
//  ViewController.swift
//  FooBarQix
//
//  Created by Badre DAHA BELGHITI on 04/09/2019.
//  Copyright © 2019 Badre DAHA BELGHITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    let fooBarQix = FooBarQix()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func compute(_ string: String){
        let computedString = fooBarQix.compute(string)
        textView.text.append("\(computedString)\n")
    }

}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            compute(text)
        }
        return true
    }
}

