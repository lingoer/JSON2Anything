## Introduction
JSON2Anything(J2A) is a magical library that converts pure JSON to any Cocoa Objects, Structs, Enums ets.

With J2A interated in your projects, you can:

1. Dynamic control an app's UI  from your server-side.
2. Fix bugs from your server-side.
3. Apply Hot Fix Patches to your app online, and, from your server-side.

## Usage
Here's a simple example showing the way to load a custom UIView dynamically:

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
