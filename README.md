##JSON2Anything
JSON2Anything(J2A) converts JSON to NSObject's subclass, struts, enum etc.

1. Dynamic control an app's UI  in server-side.
2. Fix bug in server-side.
3. Upgrade app in server-side.

## Introduction
Here's a simple example:

A JSON file named "view.json" in project
```JSON
{
   "UIView":[
      {
         "initWithFrame:":[ { "CGRect":[ 20,20,50,50 ] } ]
      },
      {
         "setBackgroundColor:":[
            {
               "UIColor":[
                  {
                     "initWithRed:green:blue:alpha:": [
                        {"Double":[0.9] },
                        {"Double":[0.1] },
                        {"Double":[0.2] },
                        {"Double":[1.0]
                        }
                     ]
                  }
               ]
            }
         ]
      }
   ]
}
```

 A function that return a UIView with \*.json's file's name
```swift
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
```

Call jsonView: in loadView()
```swift
    override func loadView() {
        super.loadView()
        if let view = jsonView("view") {
            self.view.addSubview(view)
        }
    }
```
##System Requirements
JSON2Anything supports OS X 10.9+ and iOS 7.0+.

## License

JSON2Anything is available under the MIT license. See the LICENSE file for more info.
