//
//  Bundle+Extension.swift
//  CodeBasedMovie
//
//  Created by Sebin Kwon on 1/15/25.
//

import Foundation

extension Bundle {
    var apiKey: String? {
        return infoDictionary?["API_KEY"] as? String
    }
}
