//
//  ColoringTextView.swift
//  ColoringTextView
//
//  Created by vojta on 17.09.2021.
//

import UIKit

class ColoringTextView: UIViewController, UITextViewDelegate {

    lazy var textView: UITextView = {
        var TextView = UITextView()
        
        return TextView
    }()
    
    let attributes: [String:UIColor] =
    ["if": UIColor.red,"else":UIColor.red,"{":UIColor.green,"}":UIColor.green]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textView)
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = true
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: view.leftAnchor),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor),
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.attributedText = textView.attributedText.string.colorTheText(atributes: attributes)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        NotificationCenter.default.post(name: NSNotification.Name.textViewText,
                                        object: textView.attributedText.string)
    }

}
