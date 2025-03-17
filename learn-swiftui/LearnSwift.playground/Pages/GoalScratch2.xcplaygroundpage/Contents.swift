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
    "notes": "some notes here"
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
        var id_ = id ?? "nil"
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
    var activities: [Activity]?
    
    func toString() -> String {
        var id_ = id ?? "nil"
        var repr = "Goal \(id_): \n"
        repr += "  title: \(title)\n"
        repr += "  thumbnail: \(thumbnail)\n"
        repr += "  period: \(period.rawValue)\n"
        repr += "  target: \(target)\n"
        repr += "  createdOn: \(createdOn)\n"
        repr += "  notes: \(notes)\n"
        repr += "  activities:\n"
        if let activities {
            for activity in activities {
                repr += "    \(activity.toString())\n"
            }
        }
        return repr
    }
}

func genActivities(goal: Goal, genId: (() -> String?) = {nil}) -> [Activity] {
    var numActivities = Int.random(in: 5...8)
    var activities: [Activity] = []
    
    var component: Calendar.Component!
    switch goal.period {
    case Period.daily:
        component = Calendar.Component.day
    case Period.weekly:
        component = Calendar.Component.weekOfMonth
    case Period.monthly:
        component = Calendar.Component.month
    case Period.yearly:
        component = Calendar.Component.year
    }
    
    let cal = Calendar.current
    
    // Generate the activities for the last periods so I can control the counts
    var mid = max(1, goal.target/2)
    
    // activity for period 0
    var di = cal.dateInterval(of: component, for: Date.now)!
    var activity = Activity(
        id: genId(),
        startOn: di.start,
        endOn: di.end,
        count: 0
    )
    activities.append(activity)
    
    // activity for period -1
    di = cal.dateInterval(of: component, for: cal.date(byAdding: component, value: -1, to: Date.now)!)!
    activity = Activity(
        id: genId(),
        startOn: di.start,
        endOn: di.end,
        count: Int.random(in: 1...mid)
    )
    activities.append(activity)
    
    // activity for period -2
    di = cal.dateInterval(of: component, for: cal.date(byAdding: component, value: -2, to: Date.now)!)!
    activity = Activity(
        id: genId(),
        startOn: di.start,
        endOn: di.end,
        count: Int.random(in: mid...goal.target)
    )
    activities.append(activity)
    
    for i in 3..<numActivities {
        var refDate = cal.date(byAdding: component, value: -i, to: Date.now)!
        var di = cal.dateInterval(of: component, for: refDate)!
        var activity = Activity(
            id: genId(),
            startOn: di.start,
            endOn: di.end,
            count: Int.random(in: 0...goal.target)
        )
        activities.append(activity)
    }
    
    return activities
}

var decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .iso8601
var goal: Goal! = try? decoder.decode(Goal.self, from: json)
goal.activities = genActivities(goal: goal, genId: {UUID().uuidString})
print(goal.toString())

//: [Next](@next)
