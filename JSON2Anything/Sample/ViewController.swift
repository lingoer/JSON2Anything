//
// ViewController.swift
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

class ViewController: UIViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let view1 = jsonView("view1") {
            self.view.addSubview(view1)
        }

        if let view2 = jsonView("view2") {
            self.view.addSubview(view2)
        }
        
        if let view3 = jsonView("view3") {
            self.view.addSubview(view3)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonView(fileName: String) -> UIView? {
        let bundle = NSBundle.mainBundle()
        if let url = bundle.URLForResource(fileName, withExtension: "json") {
            let data = NSData.dataWithContentsOfURL(url,options:NSDataReadingOptions.DataReadingUncached,error:nil)
            if let json = NSJSONSerialization.JSONObjectWithData(data,options:NSJSONReadingOptions.AllowFragments,error:nil) as? Dictionary<String, [AnyObject]>{
                let view = JSON2Object<UIView>.objectFromObjectJSON(json)
                return view
            }
        }
        return nil
    }
}
