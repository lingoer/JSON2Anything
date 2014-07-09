//
// J2AInvocation.swift
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

extension J2AInvocation {
    
    func setArgumentsWithArgumentsJSON(argumentsJSON: [AnyObject]){
        for index in 0..<argumentsJSON.count {
            if let subJSON = argumentsJSON[index] as? Dictionary<String, [AnyObject]> {
                for (subAnyName, subArgumentsJson) in subJSON {
                    let cType: CString = self.methodSignature().getArgumentTypeAtIndex(2+index)
                    if let argumentType:String = String.fromCString(cType) {
                        switch argumentType {
                        case "@":
                            if let aClass : AnyClass = NSClassFromString(subAnyName) {
                                var ret : AnyObject! = aClass.alloc()
                                for anyObject:AnyObject in subArgumentsJson {
                                    if let methodJSON = anyObject as? Dictionary<String, [AnyObject]> {
                                        for (methodName, argumentsJSON) in methodJSON {
                                            if let invovation = J2AInvocation.invocationWithTarget(ret as NSObject, selector: Selector(methodName), argumentsJSON: argumentsJSON) {
                                                invovation.invoke()
                                                if methodName.hasPrefix("init") {
                                                    invovation.getReturnValue(&ret)
                                                }
                                            }
                                            break
                                        }
                                    }
                                }
                                self.setArgument(&ret,atIndex:2+index)
                            }
                        case "c","i","s","l","C","I","S","L","q","Q":
                            var int = Int.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&int,atIndex:2+index)
                        case "f":
                            var float = Float.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&float,atIndex:2+index)
                        case "d":
                            var double  = Double.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&double,atIndex:2+index)
                        case "B":
                            var bool  = Bool.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&bool,atIndex:2+index)
                        case let type where type.hasPrefix("{CGRect="):
                            var rect  = CGRect.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&rect,atIndex:2+index)
                        case let type where type.hasPrefix("{CGSize="):
                            var size  = CGSize.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&size,atIndex:2+index)
                        case let type where type.hasPrefix("{CGPoint="):
                            var point  = CGPoint.anythingWithJSON(subArgumentsJson)
                            self.setArgument(&point,atIndex:2+index)
                        default:
                            println("miss the type:\(argumentType)")
                        }
                    }
                    break
                }
            }
        }
    }
    
    class func invocationWithTarget(target: NSObject, selector: Selector, argumentsJSON: [AnyObject]) -> Self?{
        
        if let signature = target.methodSignatureForSelector(selector) {

            let invocation = self(methodSignature:signature)
            let numberOfArguments = signature.numberOfArguments
            if numberOfArguments == 2 + argumentsJSON.count {
                invocation.setSelector(selector)
                invocation.setTarget(target)
                invocation.retainArguments()
                invocation.setArgumentsWithArgumentsJSON(argumentsJSON)
                return invocation;
            }
        }
        return nil
    }
}