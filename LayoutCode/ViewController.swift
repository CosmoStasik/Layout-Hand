//
//  ViewController.swift
//  LayoutCode
//
//  Created by Stanislav Sobolevsky on 27.08.22.
//

import UIKit

class FirstView : UIView{
    let horizontalStackView = UIStackView()
    let image = UIImageView(image: UIImage(named: "h"))
    let firstVelticalStackView = UIStackView()
    let secondVelticalStackView = UIStackView()
    let labelFirst = UILabel()
    let labelMiddle = UILabel()
    let labelLast = UILabel()
    let textFldFirst = UITextField()
    let textFldMiddle = UITextField()
    let textFldLast = UITextField()
    
    func addSubviews(){
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.addArrangedSubview(image)
        horizontalStackView.addArrangedSubview(firstVelticalStackView)
        firstVelticalStackView.axis = .vertical
        firstVelticalStackView.distribution = .fillEqually
        horizontalStackView.addArrangedSubview(secondVelticalStackView)
        secondVelticalStackView.axis = .vertical
        secondVelticalStackView.distribution = .fillEqually
        secondVelticalStackView.spacing = 4
        horizontalStackView.spacing = 5

        image.translatesAutoresizingMaskIntoConstraints = false
        firstVelticalStackView.translatesAutoresizingMaskIntoConstraints = false
        secondVelticalStackView.translatesAutoresizingMaskIntoConstraints = false

        firstVelticalStackView.addArrangedSubview(labelFirst)
        firstVelticalStackView.addArrangedSubview(labelMiddle)
        firstVelticalStackView.addArrangedSubview(labelLast)
        labelFirst.text = "First"
        labelMiddle.text = "Middle"
        labelLast.text = "Last"
        secondVelticalStackView.addArrangedSubview(textFldFirst)
        textFldFirst.borderStyle = .roundedRect
        textFldFirst.placeholder = "Enter First Name"
        secondVelticalStackView.addArrangedSubview(textFldMiddle)
        textFldMiddle.borderStyle = .roundedRect
        textFldMiddle.placeholder = "Enter Middle Name"
        secondVelticalStackView.addArrangedSubview(textFldLast)
        textFldLast.borderStyle = .roundedRect
        textFldLast.placeholder = "Enter Last Name"
        
        
        NSLayoutConstraint.activate([
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            horizontalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: image.bottomAnchor),
            image.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            firstVelticalStackView.widthAnchor.constraint(equalTo: secondVelticalStackView.widthAnchor, multiplier: 0.3333333)
        ])
    }
    
}

class NotesView : UIView{
    let textView = UITextView()
    
    func addSubviews(){
        addSubview(textView)
        textView.font = .systemFont(ofSize: 18)
        textView.backgroundColor = .none
        textView.text = "Notes..."
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            textView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
}
class ThirdView : UIView{
    let horizontalStackView = UIStackView()
    let buttonSave = UIButton()
    let buttonCancel = UIButton()
    let buttonClear = UIButton()
    
    func addSubviews(){
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 15
        
        horizontalStackView.addArrangedSubview(buttonSave)
        horizontalStackView.addArrangedSubview(buttonCancel)
        horizontalStackView.addArrangedSubview(buttonClear)
        
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.setTitleColor(.link, for: .normal)
        
        buttonCancel.setTitle("Cancel", for: .normal)
        buttonCancel.setTitleColor(.link, for: .normal)
       
        buttonClear.setTitle("Clear", for: .normal)
        buttonClear.setTitleColor(.link, for: .normal)
        
        NSLayoutConstraint.activate([
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            horizontalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

class ViewController: UIViewController,UITextFieldDelegate {
    
    let firstView = FirstView()
    let secondView = NotesView()
    let thirdView = ThirdView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.addSubviews()
       
        self.view.addSubview(secondView)
        secondView.backgroundColor = .lightGray
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubviews()
       
        self.view.addSubview(thirdView)
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.addSubviews()
       
        NSLayoutConstraint.activate([
            firstView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            firstView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            thirdView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            thirdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 15),
            secondView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            secondView.bottomAnchor.constraint(equalTo: thirdView.topAnchor, constant: -15)
        ])
    }
    
    
}

