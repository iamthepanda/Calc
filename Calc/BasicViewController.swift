//
//  BasicViewController.swift
//  Calc
//
//  Created by George Jone on 4/26/17.
//  Copyright © 2017 George Jone. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
    let calc = Calc.calc
    
    @IBAction func equal(_ sender: UIButton) {
        calc.evaluate()
    }
    @IBAction func backspace(_ sender: UIButton) {
        calc.deleteLastToken()
    }
    @IBAction func enter(_ sender: UIButton) {
        calc.clearBuffer()
    }
    @IBAction func multiply(_ sender: UIButton) {
        calc.addToBuffer("*")
    }
    @IBAction func divide(_ sender: UIButton) {
        calc.addToBuffer("÷")
    }
    @IBAction func plus(_ sender: UIButton) {
        calc.addToBuffer("+")
    }
    @IBAction func minus(_ sender: UIButton) {
        calc.addToBuffer("-")
    }
    @IBAction func sin(_ sender: UIButton) {
        calc.addToBuffer("sin")
    }
    @IBAction func cos(_ sender: UIButton) {
        calc.addToBuffer("cos")
    }
    @IBAction func tan(_ sender: UIButton) {
        calc.addToBuffer("tan")
    }
    @IBAction func modulo(_ sender: UIButton) {
        calc.addToBuffer("%")
    }
    @IBAction func factorial(_ sender: UIButton) {
        calc.addToBuffer("!")
    }
    @IBAction func hat(_ sender: UIButton) {
        calc.addToBuffer("^")
    }
    @IBAction func sqrt(_ sender: UIButton) {
        calc.addToBuffer("√")
    }
    @IBAction func openParen(_ sender: UIButton) {
        calc.addToBuffer("(")
    }
    @IBAction func closeParen(_ sender: UIButton) {
        calc.addToBuffer(")")
    }
    @IBAction func dot(_ sender: UIButton) {
        calc.addToBuffer(".")
    }
    @IBAction func x(_ sender: UIButton) {
        calc.addToBuffer("x")
    }
    @IBAction func numEuler(_ sender: UIButton) {
        calc.addToBuffer("e")
    }
    @IBAction func numPi(_ sender: UIButton) {
        calc.addToBuffer("π")
    }
    @IBAction func num0(_ sender: UIButton) {
        calc.addToBuffer("0")
    }
    @IBAction func num1(_ sender: UIButton) {
        calc.addToBuffer("1")
    }
    @IBAction func num2(_ sender: UIButton) {
        calc.addToBuffer("2")
    }
    @IBAction func num3(_ sender: UIButton) {
        calc.addToBuffer("3")
    }
    @IBAction func num4(_ sender: UIButton) {
        calc.addToBuffer("4")
    }
    @IBAction func num5(_ sender: UIButton) {
        calc.addToBuffer("5")
    }
    @IBAction func num6(_ sender: UIButton) {
        calc.addToBuffer("6")
    }
    @IBAction func num7(_ sender: UIButton) {
        calc.addToBuffer("7")
    }
    @IBAction func num8(_ sender: UIButton) {
        calc.addToBuffer("8")
    }
    @IBAction func num9(_ sender: UIButton) {
        calc.addToBuffer("9")
    }
}
