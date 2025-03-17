//: [Previous](@previous)

import Foundation

let json = """
{
    "id": "FF8A6B26-84EA-48A2-BDC5-6A61C3651BC6",
    "title": "Meditate",
    "thumbnail": "meditate",
    "period": "daily",
    "target": 1,
    "created_on": "2020-01-01T00:00:00Z",
    "notes": "some notes here",
    "activities": [
        {
            "id": "48151EAB-AC03-4AC0-A116-06C78B943E1E",
            "start_on": "${weekstart}",
            "end_on": "${weekend}",
            "count": 0
        },
        {
            "id": "B0EA2A2B-8313-4D22-A4CF-75C4E4E59491",
            "start_on": "${thisweek - 1}",
            "end_on": "${thisweek - 1}",
            "count": 1
        },
        {
            "id": "F27F8EBA-E199-4AC3-BC08-045F61900652",
            "start_on": "${thisweek - 2}",
            "end_on": "${thisweek - 2}",
            "count": 1
        }
    ]
}
""".data(using: .utf8)!


enum Period: String, CaseIterable, Decodable {
    case daily, weekly, monthly, yearly
}

struct Activity: Identifiable, Decodable {
    var id: String?
    var startOn: Date
    var endOn: Date
    var count: Int
    
    func toString() -> String {
        var df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .none
        var id_ = id ?? ""
        return "\(id_): \(count) times from \(df.string(from: startOn)) to \(df.string(from: endOn))"
    }
}

struct Goal: Identifiable, Decodable {
    var id: String?
    var title: String
    var thumbnail: String
    var period: Period
    var target: Int
    var createdOn: Date
    var notes: String
    var activities: [Activity]
    
    func toString() -> String {
        var id_ = id ?? ""
        var repr = "Goal \(id_): \n"
        repr += "  title: \(title)\n"
        repr += "  thumbnail: \(thumbnail)\n"
        repr += "  period: \(period.rawValue)\n"
        repr += "  target: \(target)\n"
        repr += "  createdOn: \(createdOn)\n"
        repr += "  notes: \(notes)\n"
        repr += "  activities:\n"
        for activity in activities {
            repr += "    \(activity.toString())\n"
        }
        return repr
    }
}

func decodeDate(decoder: Decoder) -> Date {
    // Date will either be in ISO 8601 or template form ${today - n}
    let df = ISO8601DateFormatter()
    df.formatOptions = [.withFullDate]
    df.timeZone = .current
    
    var regex = /\${today\s*\-\s*(\d+)}/
    var today = "${today}"
    
    do {
        let container = try decoder.singleValueContainer()
        var date = try container.decode(String.self)
        if date == today {
            return Calendar.current.startOfDay(for: Date.now)
        } else if let match = date.firstMatch(of: regex) {
            let n = Int(match.1)! * -1
            return Calendar.current.date(byAdding: .day, value: n, to: Date.now)!
        } else if let dt = df.date(from: date) {
            return dt
        } else {
            return Date.distantPast
        }
    } catch {
        return Date.distantFuture
    }
}


let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .custom(decodeDate)
var goal = try decoder.decode(Goal.self, from: json)
print(goal.toString())

//: [Next](@next)
