//
// NSObject+J2A.swift
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

extension NSObject: JSON2AnythingProtocol{
    
    /*
     * methodsJSON[] like [{key:Method(String), value:Arguments([AnyObject])}, ...]
     */
    class func anythingWithJSON(methodsJSON:[AnyObject]) -> Self? {
        var ret = self.alloc()
        println(ret)
        var success:Bool = false
        
        for anyObject:AnyObject in methodsJSON {
            if let methodJSON = anyObject as? Dictionary<String, [AnyObject]> {
                for (methodName, argumentsJSON) in methodJSON {
                    if let invovation = J2AInvocation.invocationWithTarget(ret!, selector: Selector(methodName), argumentsJSON: argumentsJSON) {
                        invovation.invoke()
                        if methodName.hasPrefix("init") {
                            invovation.getReturnValue(&ret)
                            println(ret)
                            success = true
                        }
                    }
                    break
                }
            }
        }
        if success {
            return ret!
        } else {
            return nil
        }
    }
}
