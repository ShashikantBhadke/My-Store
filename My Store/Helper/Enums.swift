//
//  Enums.swift
//  My Store
//
//  Created by Shashikant Bhadke on 26/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import Foundation

enum AlertTitle: String {
    case Error      = "Error!"
    case Warning    = "Warning!"
    case Bonzi      = "Bonzi..😀!"
    case Success    = "Success..!"
}

enum AlertBtn: String {
    case Ok = "Ok"
    case Cancel = "Cancel"
}

enum AlertMessage: String {
    case parseError     = "Unable to parse data"
    case somethingWrong = "Oops something went wrong..!"
    case productUpdate  = "Product update successfuly."
}
