//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 10/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let displayLabel = UILabel()
    let button0 = UIButton()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let buttonMult = UIButton()
    let buttonDiv = UIButton()
    let buttonSub = UIButton()
    let buttonAdd = UIButton()
    let buttonEnter = UIButton()
    
    var stack = Stack()
    var isTypingNumber = false
    var displayValue: Float {
        get {
            let text = displayLabel.text ?? "0"
            return (text as NSString).floatValue
        }
        
        set {
            displayLabel.text = "\(newValue)"
            isTypingNumber = false
        }
    }

    
    func buttonTapped(button: UIButton) {
        
        guard let digit = button.currentTitle else { return }
        
        if isTypingNumber {
            var calculatorLabel = displayLabel.text ?? ""
            calculatorLabel = calculatorLabel + digit
        } else {
            displayLabel.text = digit
            isTypingNumber = true
        }
    }
    
    func enter() {
        isTypingNumber = false
        stack.push(displayValue)
        stack.log()
        
    }
    
    func operatorButton(button: UIButton) {
        guard let operation = button.currentTitle else { return }
        
        if isTypingNumber {
            enter()
        }
        
        if stack.count() >= 2 {
            let float1 = stack.pop()!
            let float2 = stack.pop()!
            
            switch operation {
            case "÷":
                displayValue = float2 / float1
            case "✕":
                displayValue = float2 * float1
            case "−":
                displayValue = float2 - float1
            case "+":
                displayValue = float2 + float1
            default:
                stack.push(float1)
                stack.push(float2)
                
            }
            
            enter()
        }
    }

    var buttonsArray: [UIView] = []
    var numberButtonsArray: [UIButton] = []
    var widthButtonArray: [UIView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blackColor()
        buttonsArray = [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonAdd, buttonSub, buttonMult, buttonDiv, buttonEnter]
        numberButtonsArray = [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9]
        widthButtonArray = [button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonAdd, buttonSub, buttonMult, buttonDiv, buttonEnter]
        setupLabel()
        setupButtons()
        setupButtonConstraints()
        setupLabelConstraints()
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupLabel() {
        displayLabel.backgroundColor = .blackColor()
        view.addSubview(displayLabel)
        for button in buttonsArray {
            view.addSubview(button)
        }
        displayLabel.font = displayLabel.font.fontWithSize(50)
        displayLabel.textAlignment = .Center
        displayLabel.textColor = .whiteColor()
        displayLabel.text = ""

    }
    
    func setupButtons() {
        for button in numberButtonsArray {
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.blackColor().CGColor
            button.backgroundColor = .lightGrayColor()
            button.setTitleColor(.blackColor(), forState: .Normal)
            button.titleLabel?.font = .systemFontOfSize(25.0)
            button.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
        }
        
        button0.setTitle("0", forState: .Normal)
        button1.setTitle("1", forState: .Normal)
        button2.setTitle("2", forState: .Normal)
        button3.setTitle("3", forState: .Normal)
        button4.setTitle("4", forState: .Normal)
        button5.setTitle("5", forState: .Normal)
        button6.setTitle("6", forState: .Normal)
        button7.setTitle("7", forState: .Normal)
        button8.setTitle("8", forState: .Normal)
        button9.setTitle("9", forState: .Normal)
        
        let divide = buttonDiv
        divide.layer.borderWidth = 0.5
        divide.layer.borderColor = UIColor.blackColor().CGColor
        divide.backgroundColor = .orangeColor()
        divide.setTitle("/", forState: .Normal)
        divide.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divide)
        
        let multilply = buttonMult
        multilply.layer.borderWidth = 0.5
        multilply.layer.borderColor = UIColor.blackColor().CGColor
        multilply.backgroundColor = .orangeColor()
        multilply.setTitle("*", forState: .Normal)
        multilply.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(multilply)
        
        let subtract = buttonSub
        subtract.layer.borderWidth = 0.5
        subtract.layer.borderColor = UIColor.blackColor().CGColor
        subtract.backgroundColor = .orangeColor()
        subtract.setTitle("-", forState: .Normal)
        subtract.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtract)
        
        let add = buttonAdd
        add.layer.borderWidth = 0.5
        add.layer.borderColor = UIColor.blackColor().CGColor
        add.backgroundColor = .orangeColor()
        add.setTitle("+", forState: .Normal)
        add.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(add)
        
        let enter = buttonEnter
        enter.layer.borderWidth = 0.5
        enter.layer.borderColor = UIColor.blackColor().CGColor
        enter.backgroundColor = .greenColor()
        enter.setTitle("Enter", forState: .Normal)
        enter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enter)


    }
    
    
    func setupButtonConstraints() {
        button0.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        button5.translatesAutoresizingMaskIntoConstraints = false
        button6.translatesAutoresizingMaskIntoConstraints = false
        button7.translatesAutoresizingMaskIntoConstraints = false
        button8.translatesAutoresizingMaskIntoConstraints = false
        button9.translatesAutoresizingMaskIntoConstraints = false
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        buttonSub.translatesAutoresizingMaskIntoConstraints = false
        buttonMult.translatesAutoresizingMaskIntoConstraints = false
        buttonDiv.translatesAutoresizingMaskIntoConstraints = false
        buttonEnter.translatesAutoresizingMaskIntoConstraints = false

        //Leading and trailing constraints of top row
        let button7LeadingConstraint = NSLayoutConstraint(item: button7, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let button8LeadingConstraint = NSLayoutConstraint(item: button8, attribute: .Leading, relatedBy: .Equal, toItem: button7, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let button9LeadingConstraint = NSLayoutConstraint(item: button9, attribute: .Leading, relatedBy: .Equal, toItem: button8, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonDivLeadingConstraint = NSLayoutConstraint(item: buttonDiv, attribute: .Leading, relatedBy: .Equal, toItem: button9, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonDivTrailingConstraint = NSLayoutConstraint(item: buttonDiv, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button7LeadingConstraint, button8LeadingConstraint, button9LeadingConstraint, buttonDivLeadingConstraint, buttonDivTrailingConstraint])

        //Leading and trailing Constraints of second row from top
        let button4LeadingConstraint = NSLayoutConstraint(item: button4, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let button5LeadingConstraint = NSLayoutConstraint(item: button5, attribute: .Leading, relatedBy: .Equal, toItem: button4, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let button6LeadingConstraint = NSLayoutConstraint(item: button6, attribute: .Leading, relatedBy: .Equal, toItem: button5, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonMultLeadingConstraint = NSLayoutConstraint(item: buttonMult, attribute: .Leading, relatedBy: .Equal, toItem: button6, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonMultTrailingConstraint = NSLayoutConstraint(item: buttonMult, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)

        view.addConstraints([button4LeadingConstraint, button5LeadingConstraint, button6LeadingConstraint, buttonMultLeadingConstraint, buttonMultTrailingConstraint])

        //Leading and Trailing of third row from the top
        let button1Leading = NSLayoutConstraint(item: button1, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let button2Leading = NSLayoutConstraint(item: button2, attribute: .Leading, relatedBy: .Equal, toItem: button1, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let button3Leading = NSLayoutConstraint(item: button3, attribute: .Leading, relatedBy: .Equal, toItem: button2, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonSubLeading = NSLayoutConstraint(item: buttonSub, attribute: .Leading, relatedBy: .Equal, toItem: button3, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonSubTrailing = NSLayoutConstraint(item: buttonSub, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button1Leading, button2Leading, button3Leading, buttonSubLeading, buttonSubTrailing])
        
        //Leading and trailing of bottom row
        let button0Leading = NSLayoutConstraint(item: button1, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let buttonEnterLeading = NSLayoutConstraint(item: buttonEnter, attribute: .Leading, relatedBy: .Equal, toItem: button0, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonAddLeading = NSLayoutConstraint(item: buttonAdd, attribute: .Leading, relatedBy: .Equal, toItem: buttonEnter, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let buttonAddTrailing = NSLayoutConstraint(item: buttonAdd, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button0Leading, buttonEnterLeading, buttonAddLeading, buttonAddTrailing])
        
        //Top row top topConstraints
        let button7TopConstraint = NSLayoutConstraint(item: button7, attribute: .Top, relatedBy: .Equal, toItem: displayLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let button8TopConstraint = NSLayoutConstraint(item: button8, attribute: .Top, relatedBy: .Equal, toItem: displayLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let button9TopConstraint = NSLayoutConstraint(item: button9, attribute: .Top, relatedBy: .Equal, toItem: displayLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let buttonDivTopConstraint = NSLayoutConstraint(item: buttonDiv, attribute: .Top, relatedBy: .Equal, toItem: displayLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button7TopConstraint, button8TopConstraint, button9TopConstraint, buttonDivTopConstraint])
        
        //second row from top top constraints
        let button4TopConstraint = NSLayoutConstraint(item: button4, attribute: .Top, relatedBy: .Equal, toItem: button7, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let button5TopConstraint = NSLayoutConstraint(item: button5, attribute: .Top, relatedBy: .Equal, toItem: button8, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let button6TopConstraint = NSLayoutConstraint(item: button6, attribute: .Top, relatedBy: .Equal, toItem: button9, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let buttonMultTopConstraint = NSLayoutConstraint(item: buttonMult, attribute: .Top, relatedBy: .Equal, toItem: buttonDiv, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button4TopConstraint, button5TopConstraint, button6TopConstraint, buttonMultTopConstraint])
        
        //Third row from top top constraints
        let button1TopConstraint = NSLayoutConstraint(item: button1, attribute: .Top, relatedBy: .Equal, toItem: button4, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let button2TopConstraint = NSLayoutConstraint(item: button2, attribute: .Top, relatedBy: .Equal, toItem: button5, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let button3TopConstraint = NSLayoutConstraint(item: button3, attribute: .Top, relatedBy: .Equal, toItem: button6, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let buttonSubTopConstraint = NSLayoutConstraint(item: buttonSub, attribute: .Top, relatedBy: .Equal, toItem: buttonMult, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button1TopConstraint, button2TopConstraint, button3TopConstraint, buttonSubTopConstraint])
        
        //Bottom Row Top Constraints
        let button0TopConstraint = NSLayoutConstraint(item: button0, attribute: .Top, relatedBy: .Equal, toItem: button1, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let buttonEnterTopConstraint = NSLayoutConstraint(item: buttonEnter, attribute: .Top, relatedBy: .Equal, toItem: button3, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let buttonAddTopConstraint = NSLayoutConstraint(item: buttonAdd, attribute: .Top, relatedBy: .Equal, toItem: buttonSub, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        view.addConstraints([button0TopConstraint, buttonEnterTopConstraint, buttonAddTopConstraint])
        
        //Botton Height Constraints
        for button in buttonsArray {
            let heightContstraint = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.75/4, constant: 0)
            view.addConstraints([heightContstraint])

        }
        
        //Button width Constraints
        for button in widthButtonArray {
            let widthConstraint = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
            view.addConstraints([widthConstraint])
        }
        
        //Zero Button width Constraint
        let button0widthConstraint = NSLayoutConstraint(item: button0, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.5, constant: 0)
        view.addConstraints([button0widthConstraint])
    }
    
    func setupLabelConstraints() {
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelWitdth = NSLayoutConstraint(item: displayLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0)
        let labelHeight = NSLayoutConstraint(item: displayLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100.0)
        let displayLabelY = NSLayoutConstraint(item: displayLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 100.0)
        view.addConstraints([labelWitdth, labelHeight, displayLabelY])
        
    }
    
//    func 
    
}























