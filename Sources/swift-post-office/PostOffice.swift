//
//  PostOffice.swift
//  mylift
//
//  Created by Jon Maloney on 27/11/18.
//  Copyright © 2018 mylift.ai, All rights reserved.
//

import Foundation


class PostOffice{
    
    private var addressBook = [ PostBoxRegister ]()
    
    public func register(postBox: PostBox, address: AnyClass!){
        
        guard let unboxedAddress = address else{
            return
        }
        
        let strAddr = String(describing: unboxedAddress)
        
        register(post: postBox, address: strAddr)
        
    }
    
    public func register( post: PostBox, address: String ){
        guard let postBoxRegister = PostBoxRegister(postBox: post, address: address) else{
            return
        }
        
        self.addressBook.append(postBoxRegister)
    }
    
    public func send<T>(_ parcel: Parcel<T>){
        
        let parcelType = type(of: parcel)
        let address = String(describing: parcelType)
        
        self.send(parcel, address: address)
    }
    
    public func send<T>(_ parcel: Parcel<T>, address: String){
        
        for registeredPostBox in self.addressBook {
            if( registeredPostBox.getAddress() == address ){
                registeredPostBox.getPostBox().deliver(parcel)
            }
        }
        
    }
    
    class PostBoxRegister{
        
        private let postBox: PostBox
        private let address: String
        
        init?(postBox: PostBox, address: String){
            self.postBox = postBox
            self.address = address
        }
        
        init?(_ postBox: PostBox, _ objectType: AnyClass!) {
            
            guard let type = objectType else{
                return nil
            }
            
            self.address = String(describing: type)
            self.postBox = postBox
        }
        
        public func getPostBox() -> PostBox {
            return self.postBox
        }
        
        public func getAddress() -> String {
            return self.address
        }
        
    }
    
}

