//
//  NetworkRouterCompletion.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation


public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()
