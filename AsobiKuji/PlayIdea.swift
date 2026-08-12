import Foundation

enum PlayPlace: String, CaseIterable, Identifiable, Codable {
    case indoor = "室内"
    case outdoor = "屋外"
    var id: String { rawValue }
}

enum PlayDuration: String, CaseIterable, Identifiable, Codable {
    case five = "5分"
    case ten = "10分"
    case twenty = "20分"
    case thirtyPlus = "30分以上"
    var id: String { rawValue }

    var minutes: Int {
        switch self {
        case .five: return 5
        case .ten: return 10
        case .twenty: return 20
        case .thirtyPlus: return 30
        }
    }
}

enum ParentEnergy: String, CaseIterable, Identifiable, Codable {
    case low = "限界"
    case tired = "疲れた"
    case normal = "普通"
    case energetic = "元気"
    var id: String { rawValue }

    var level: Int {
        switch self {
        case .low: return 0
        case .tired: return 1
        case .normal: return 2
        case .energetic: return 3
        }
    }
}

struct PlayIdea: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let description: String
    let minAge: Int
    let maxAge: Int
    let place: PlayPlace
    let minutes: Int
    let parentEnergy: Int
    let materials: String
    let parentRole: String
}
