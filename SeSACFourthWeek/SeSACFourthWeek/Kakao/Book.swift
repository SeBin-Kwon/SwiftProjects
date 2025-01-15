//
//  Book.swift
//  SeSACFourthWeek
//
//  Created by Sebin Kwon on 1/15/25.
//

import Foundation

struct Book: Decodable {
    let documents: [BookDetail]
}

struct BookDetail: Decodable {
    let contents: String
    let price: Int
    let title: String
    let thumbnail: String
}

