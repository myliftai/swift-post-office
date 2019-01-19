//
//  PostBox.swift
//  mylift
//
//  Created by Jon Maloney on 27/11/18.
//  Copyright © 2018 mylift.ai, Inc. All rights reserved.
//

import Foundation

protocol PostBox{
    func deliver<T>(_ parcel: Parcel<T>)
}

