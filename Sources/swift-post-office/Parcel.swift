//
//  Parcel.swift
//  mylift
//
//  Created by Jon Maloney on 27/11/18.
//  Copyright © 2018 mylift.ai, Inc. All rights reserved.
//

import Foundation

open class Parcel<T>{
    
    private let content: T
    
    init(_ content: T){
        self.content = content
    }
    
    public func getContent() -> T {
        return self.content
    }
    
}

