# swift-post-office

An extreamly light weight and super fast internal message bus that implements both publish/subscirbe and sending messages directly to a specific receipiant. The library is aprox 40 lines of code. 

The post office allows objects to be posted between modules of code.

## Implementing the post box protocol

To register a module with the post office the post box protocol needs to be implemented.
```swift
class ViewController: UIViewController, PostBox {
  ...
}
```

## Registering a post box address
There are two ways that objects can be delivered to a post box. 
  1. Subscribe to receive objects. 
  2. Register an address. 

### Subscribing to objects

To subscribe to receive a type of object the post box protocol needs to be implemented and the subscribe function needs to be called. In this case ViewControll implements the post box protocol so it can subscribe to parcels. The example below subscribes to objects of type MyParcel that get published to the post office.
```swift
class ViewController: UIViewController, PostBox {
  override func viewDidLoad() {
    
    super.viewDidLoad()
    postOffice.subscribe(postBox: self, objectType: MyParcel.self)
    
    ...
    }
}
```

The PostBox protocol requires the funciton 'deliver' to be implemented within the class. 
```swift
func deliver<T>(_ parcel: Parcel<T>){   
    if( parcel is MyParcel){
        let unwrappedParcel = parcel as! MyParcel
        ...
    }
}
```

The post office will then ensure that any objects published of type MyParcel are delivered to the ViewController.

### Registering an address with the post office

To register specific addresses the post box protocol needs to be implemented as above. Then an address can be registered with the post office. 
```swift
  postOffice.register(postBox: self, address: "myuniqueaddress")
```

## Sending parcels

There are two ways of sending objects via the post office. 
  1. Publish the object so it is received by subscribers
  2. Send an object to an address. 

### Publish an object

To publish objects simply call the publish function
```swift
  let parcel = MyParcel()
  postOffice.publish(parcel)
```

### Sending objects

To send an object to an address
```swift
  let parcel = MyParcel()
  postOffice.send(parcel: parcel, address: "myuniqueaddress")
```
