//
// J2AInvocation.m
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

#import "J2AInvocation.h"

@interface J2AInvocation()

@property (nonatomic, strong) NSInvocation *invocation;

@end

@implementation J2AInvocation

+ (instancetype)invocationWithMethodSignature:(NSMethodSignature *)sig {
    J2AInvocation *ret = [J2AInvocation new];
    ret.invocation = [NSInvocation invocationWithMethodSignature:sig];
    return ret;
}

- (NSMethodSignature *)methodSignature {
    return [self.invocation methodSignature];
}

- (void)retainArguments {
    return [self.invocation retainArguments];
}

- (BOOL)argumentsRetained {
    return [self.invocation argumentsRetained];
}

- (id)target {
    return [self.invocation target];
}

- (void)setTarget:(id)target {
    [self.invocation setTarget:target];
}

- (SEL)selector {
    return [self.invocation selector];
}

- (void)setSelector:(SEL)selector {
    return [self.invocation setSelector:selector];
}

- (void)getReturnValue:(void *)retLoc {
    [self.invocation getReturnValue:retLoc];
}

- (void)setReturnValue:(void *)retLoc {
    [self.invocation setReturnValue:retLoc];
}

- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx {
    [self.invocation getArgument:argumentLocation atIndex:idx];
}

- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx {
    [self.invocation setArgument:argumentLocation atIndex:idx];
}

- (void)invoke {
    [self.invocation invoke];
}

- (void)invokeWithTarget:(id)target {
    [self.invocation invokeWithTarget:target];
}

@end
