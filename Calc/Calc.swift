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
    func next()
}

class Calc {
    static let calc = Calc()
    
    var buffer: String = ""
    var result: String = ""

    var tokenStream: TokenStream = []
    let parser = Parser()
    
    var delegate: CalcDelegate!
    
    func addToBuffer(_ token: String) {
        if buffer.characters.count <= 16 {
            buffer += token
            tokenStream.append(Token.TString(token))
            delegate?.updateExpression()
        }
    }
    
    func clearBuffer() {
        if buffer != "" {
            buffer = ""
            result = ""
            tokenStream.removeAll()
        }
        
        delegate?.updateExpression()
        delegate?.updateResult()
    }
    
    func deleteLastToken() {
        if !buffer.isEmpty {
            buffer = buffer.substring(to: buffer.index(before: buffer.endIndex))
            tokenStream.removeLast()
        }
        
        delegate?.updateExpression()
    }
    
    func evaluate() {

        do {
            try print(parser.parse(TokenStream([Token.TString("5")])))
        } catch Lexer.LexerError.NextTokenUnparsable {
            print("next token unparsable")
        } catch ParseError.Error("") {
            print("parse error")
        } catch let error {
            print(error.localizedDescription)
        }

        result = buffer
        delegate?.updateResult()
    }

    func next() {
        if !buffer.isEmpty {
            delegate?.next()
        }
    }

}
