//
//  ClubModel.swift
//  Techl
//
//  Created by Doy Kim on 2022/08/24.
//

import UIKit

struct ClubModel {
    var badge: String
    var thumbnail: String
    var status: String
    var title: String
    var location: String
    var description: String
    var startDate: String
}
// test용 프로퍼티
extension ClubModel {
    static let list: [ClubModel] = [
    
        ClubModel(badge: " NEW ", thumbnail: "bookclub-cover-1", status: " 모집중 2/10 ", title: "슬기로운 읽기 클럽🥑", location: "온라인 Zoom", description: "클린 코드를 읽고 줌(Zoom)에서 토론하는 시간을 매주 2회 가집니다.", startDate: "8월 31일(수)"),
        
        ClubModel(badge: " NEW ", thumbnail: "bookclub-cover-2", status: " 모집중 3/6 ", title: "페이퍼📄 함께읽기", location: "잠실나루역", description: "책의 모태가 되는 Sequential programming 논문을 주 1회 함께 읽습니다.", startDate: "8월 27일(토)"),
        
        ClubModel(badge: " HOT ", thumbnail: "bookclub-cover-4", status: " 마감임박 7/8 ", title: "🎙연사 특강+북클럽", location: "신촌역 스터디룸", description: "매주 시니어 개발자를 모시고 짧은 특강 세션과 북클럽 세션을 합니다", startDate: "9월 13일(화)"),
        
        ClubModel(badge: " NEW ", thumbnail: "bookclub-cover-3", status: " 모집중 1/6 ", title: "하루 한 소챕터", location: "공덕 스타트업 라운지", description: "평일 중 매일 만나서 하루 한 소챕터씩 함께 읽습니다. 휴일 없이 진행됩니다.", startDate: "8월 31일(수)"),
        
        ClubModel(badge: " HOT ", thumbnail: "bookclub-cover-6", status: " 모집중 4/20 ", title: "심야🌜 북클럽", location: "테클 디스코드", description: "2개월에 한 권씩, 로버트 마틴 책을 완독하는 모임입니다. 매주 평일 밤 9시.", startDate: "9월 9일(금)")
    
    ]
}
