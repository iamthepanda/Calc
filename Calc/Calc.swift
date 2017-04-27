//
//  Calc.swift
//  Calc
//
//  Created by George Jone on 4/26/17.
//  Copyright © 2017 George Jone. All rights reserved.
//

import Foundation

protocol CalcDelegate {
    func updateExpression()
    func updateResult()
}

class Calc {
    static let calc = Calc()
    
    var buffer: String = "0"
    
    var delegate: CalcDelegate?
    
    func addToBuffer(_ token: String) {
        
        if buffer == "0" {
            buffer = ""
        }
        
        if buffer.characters.count <= 16 {
            buffer += token
            delegate?.updateExpression()
        }
    }
    
    func clearBuffer() {
        if buffer != "0" {
            buffer = "0"
        }
        
        delegate?.updateExpression()
        delegate?.updateResult()
    }
    
    func deleteLastToken() {
        if !buffer.isEmpty {
            buffer = buffer.substring(to: buffer.index(before: buffer.endIndex))
        }
        
        delegate?.updateExpression()
    }
    
    func evaluate() {
        delegate?.updateResult()
    }
}
