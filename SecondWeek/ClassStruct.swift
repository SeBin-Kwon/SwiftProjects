//
//  ClassStruct.swift
//  SecondWeek
//
//  Created by Sebin Kwon on 1/2/25.
//

import Foundation

// 1. 가지고 있는 프로퍼티를 모두 초기화
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언
//class Monster {
//    var clothes: String?
//    let speed = 5
//    let power = 10
//    let experience = 100
//}

class Monster {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
    
//    func initializer(clothes: String, speed: Int, power: Int, experience: Int) {
//        self.clothes = clothes
//        self.speed = speed
//        self.power = power
//        self.experience = experience
//    }
}

class BossMonster: Monster {
    
}


class SuperMonser: BossMonster {
    
}


struct MonsterStruct {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    // init이 없어도 기본적으로 제공해줌 -> 멤버와이즈 초기화 구문
}
