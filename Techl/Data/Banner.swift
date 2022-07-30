//
//  Banner.swift
//  Techl
//
//  Created by Doy Kim on 2022/07/30.
//

enum BannerKind: String {
    case event
    case notification
    case article
    case guide
    
    func getString() -> String {
        switch self {
        case .event: return "이벤트"
        case .notification: return "공지사항"
        case .article : return "아티클"
        case .guide : return "가이드"
        }
    }
}

struct Banner {
    var id: Int
    var kind : BannerKind //이벤트, 공지
    var title: String
    var image : String
    
}


extension Banner {
    static let banners : [Banner] = [
        Banner(id: 0, kind: .guide, title: "테클 사용법 모아보기", image: "banner-1"),
        Banner(id: 1, kind: .article, title: "테클 추천도서", image: "banner-2"),
        Banner(id: 2, kind: .event, title: "신규가입,추천인 이벤트", image: "banner-3")
    ]
}
