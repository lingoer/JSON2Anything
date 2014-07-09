//
// JSON2Anything.swift
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

import Foundation

protocol JSON2AnythingProtocol {
    class func anythingWithJSON(JSON:[AnyObject]) -> Self?
}

struct JSON2Object <T: NSObject> {
    
    static func objectFromObjectJSON(objectJSON: Dictionary<String, [AnyObject]>) -> T? {
        
        if objectJSON.count != 1 {
            return nil
        }

        for (className:String, methodsJSON:[AnyObject]) in objectJSON {
            
            /* Fist time always get false, sencond time get true, Why?
            if let aClass: AnyClass = NSClassFromString(className) as? T.Type {
                return T.anythingWithJSON(methodsJSON)
            }*/
            return T.anythingWithJSON(methodsJSON)
        }
        
        return nil
    }
    
    static func objectFromMethodsJSON(methodsJSON: [AnyObject]) -> T? {
        return T.anythingWithJSON(methodsJSON)
    }
}