# This is notes for learning the **Landmark** [project demo](https://developer.apple.com/tutorials/SwiftUI) by Apple.

# key points in Swift UI
## Some important keywords for biding data with views.
### StateObject & EnvirionmentObject
1. Usage: mark one variable in Swift with this wrapper, then Swift UI will automatically update whenever this variable changes.
```
@StateObject var model = DataModel() // create a variable and init it once
```
2. pass the Object to sub views using `environmentObject(model)`
3. use the object in sub views when pass from parent views
```
@EnvirionmentObject var model: DataModel()
```
The above code will not create a new object, but using the object passed frm parent view.
4. we can use a binding to change the object's property in each view.
```
Toggle("Enabled", isOn: $model.isEnabled) // use $ to make a biding
```
### Toggle
Toggle is a control to change state of on and off, using isOn to binding a label and you can change that labels value between false and true.
```
@State private var showFavoritesOnly = false
Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
```
### List
A container which can contain many items in rows, and you can click on each item.
### NavigationView
If you want to change the view to another view when click, you have to use the NavigationView.

In its body, use method `navigationLink{ destination view} label:{current view}

