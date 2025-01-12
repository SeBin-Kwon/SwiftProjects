//
//  ChattingProtocol.swift
//  TravelTalk
//
//  Created by Sebin Kwon on 1/12/25.
//

import Foundation

protocol ChattingProtocol: AnyObject {
    func configureUI()
    func configureData(_ item: Chat)
    func dateFormetted(_ str: String) -> String
}
