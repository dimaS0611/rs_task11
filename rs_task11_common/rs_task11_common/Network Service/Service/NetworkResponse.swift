//
//  NetworkResponse.swift
//  rs_task11_common
//
//  Created by Dzmitry Semenovich on 10.09.21.
//

import Foundation

public enum NetworkResponse: String, Error {
    case success
    case authentificationError = "Ошибка авторизации"
    case failed = "Ошибка"
    case noData = "Нет данных"
    case ubableToDecode = "Невозможно декодировать"
}
