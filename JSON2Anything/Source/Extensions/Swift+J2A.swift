//
// Swift+J2A.swift
//
// Copyright (c) 2014 Pinglin Tang.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

extension Int: JSON2AnythingProtocol {

    static func anythingWithJSON(argumentJSON:[AnyObject]) -> Int? {
        
        if argumentJSON.count != 1 {
            return nil
        }
        
        let o : AnyObject = argumentJSON[0]

        if let o_n = o as? NSNumber {
            return o_n.integerValue
        } else if let o_s = o as? NSString {
            return o_s.integerValue
        } else {
            return nil
        }
    }
}

extension Float: JSON2AnythingProtocol {

    static func anythingWithJSON(argumentJSON:[AnyObject]) -> Float? {

        if argumentJSON.count != 1 {
            return nil
        }
        
        let o : AnyObject = argumentJSON[0]
        
        if let o_n = o as? NSNumber {
            return o_n.floatValue
        } else if let o_s = o as? NSString {
            return o_s.floatValue
        } else {
            return nil
        }
    }
}

extension Double: JSON2AnythingProtocol {

    static func anythingWithJSON(argumentJSON:[AnyObject]) -> Double? {
        
        if argumentJSON.count != 1 {
            return nil
        }
        
        let o : AnyObject = argumentJSON[0]

        if let o_n = o as? NSNumber {
            return o_n.doubleValue
        } else if let o_s = o as? NSString {
            return o_s.doubleValue
        } else {
            return nil
        }
    }
}

extension Bool: JSON2AnythingProtocol {
    
    static func anythingWithJSON(argumentJSON:[AnyObject]) -> Bool? {
        
        if argumentJSON.count != 1 {
            return nil
        }
        
        let o : AnyObject = argumentJSON[0]
        
        if let o_n = o as? NSNumber {
            return o_n.boolValue
        } else if let o_s = o as? NSString {
            return o_s.boolValue
        } else {
            return nil
        }
    }
}