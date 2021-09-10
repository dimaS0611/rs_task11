//
//  NetResult.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation

public enum NetResult<Error> {
    case success
    case failure(Error)
}
