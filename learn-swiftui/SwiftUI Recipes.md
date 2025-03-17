# SwiftUI Recipes

### TODO

Add recipe for big button.

### Refreshing Pages

The only way a page auto-refreshes is when its `@State` variable changes within it. To update different views I need to use `@StateObject` in the root view and its companion `@ObservableObject` and `@EnvironmentObject` in the child views. Changes made to this shared object anywhere in the view heirarchy will be reflected in all the entire view tree. However, this does not mean that the root view will be automatically re-rendered. The changes will be seen only if I actually navigate back to any of the views, including the root view. So the real question now is how to automatically re-render a view when something changes in some other currently rendered view?

Again, I'll have to use `@StateObject` and `@ObservableObject` or `@EnvironmentObject` for this. In the root view I can explicitly call different views based on the value of the state object. E.g., 

```swift
struct RootView: View {
  @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: false)

  var body: some View {
    if book.isRead {
      ReadView(book: book)
    } else {
      UnreadView(book: book)
    }
  }
}
```

At first when the root view is rendered, it will immediately redirect to `UnreadView`. Now if I change the value of `book.isRead` in the `UnreadView`, the effect will be that `ReadView` is rendered immediately and back and forth. Ofcourse what happened is that the control went back to the `RootView` which then redirected based on the if condition. This pattern works even if I wrap the if-statement inside a `VStack` or a `Group`. Wrapping such conditional routing in a `Group` is a very common pattern that I have seen in the wild, so something like this -

```swift
struct RootView: View {
  @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: false)
  
  var body: some View {
    Group {
      if book.isRead {
        ReadView(book: book)
      } else {
        UnreadView(book: book)
      }
    }
  }
}
```

The end-user effect does not change, so not sure of the actual value of doing this. I can just as easily use `VStack` to wrap and the effect still remains.

Interestingly enough, this also works with `NavigationStack`, like this -

```swift
struct RootView: View {
  @StateObject var book = Book(title: "Thinking Fast and Slow", isRead: false)
  
  var body: some View {
    NavigationStack {
      VStack {
        // some content here
        Button("Show Read View") {
          book.isRead = true
        }
      }
      .navigationDestination($book.isRead) {
        ReadView(book: book)
      }
    }
  }
}
```

Clicking on the button will take me to the `ReadView` and if I change the `book.isRead` value there, it will right away drop me back in the `RootView`. Interestingly enough if I just click the `< Back` link in `ReadView`, it will automatically set `book.isRead` to `false` and drop me back to the `RootView`!!

### Text with background

```swift
Text("Edit")
	.foregroundColor(.white)
  .padding([.leading, .trailing, .top, .bottom], 10)
  .frame(width: 100)
  .background(
    RoundedRectangle(cornerRadius: 5)
    	.fill(.blue)
    	.shadow(radius: 5)
  )
```

### Web style edit and delete buttons

```swift
HStack {
	NavigationLink {
  	UpdateView()
  } label: {
		TextWithBackground("Edit")
  }
  .buttonStyle(.plain)
                
  NavigationLink {
  	DeleteView()
  } label: {
    TextWithBackground("Delete")
  }
  .buttonStyle(.plain)
}
```

### Custom Padding

If I want to set a different custom padding for each edge -

```swift
SomeView()
.padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
```



If I want to set the same custom padding for some/all edges -

```swift
SomeView()
.padding([.leading, .trailing], 20)
```

