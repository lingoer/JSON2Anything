//
// CGGeometry+J2A.swift
//
// Copyright (c) 2014 Pinglin Tang
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

import UIKit

extension CGPoint: JSON2AnythingProtocol {
    
    static func anythingWithJSON(argumentJSON:[AnyObject]) -> CGPoint? {

        if argumentJSON.count == 2 {
            return nil
        }
        
        var v: [CGFloat] = []
        
        for o: AnyObject in argumentJSON {
            if let o_n = o as? NSNumber {
                v.append(CGFloat(o_n.floatValue))
            } else if let o_s = o as? NSString {
                v.append(CGFloat(o_s.floatValue))
            } else {
                return nil
            }
        }
        
        return CGPoint(x:v[0],y:v[1])
    }
}

extension CGSize: JSON2AnythingProtocol {
    
    static func anythingWithJSON(argumentJSON:[AnyObject]) -> CGSize? {
        
        if argumentJSON.count == 2 {
            return nil
        }
        
        var v: [CGFloat] = []
        
        for o: AnyObject in argumentJSON {
            if let o_n = o as? NSNumber {
                v.append(CGFloat(o_n.floatValue))
            } else if let o_s = o as? NSString {
                v.append(CGFloat(o_s.floatValue))
            } else {
                return nil
            }
        }
        
        return CGSize(width:v[0],height:v[1])
    }
}

extension CGRect: JSON2AnythingProtocol{
    
    static func anythingWithJSON(argumentJSON:[AnyObject]) -> CGRect? {

        if argumentJSON.count != 4 {
            return nil
        }

        var v: [CGFloat] = []

        for o: AnyObject in argumentJSON {
            if let o_n = o as? NSNumber {
                v.append(CGFloat(o_n.floatValue))
            } else if let o_s = o as? NSString {
                v.append(CGFloat(o_s.floatValue))
            } else {
                return nil
            }
        }
        
        return CGRect(x:v[0],y:v[1],width:v[2],height:v[3])
    }
}