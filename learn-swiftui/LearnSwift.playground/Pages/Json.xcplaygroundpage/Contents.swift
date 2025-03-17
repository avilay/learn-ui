//: [Previous](@previous)

import Foundation
/*:
 This is the most simple and straightforward way of decoding JSON into Dictionary object.
 */
let trackJson = """
{
    "trackName": "Poor George",
    "artistName": "James Supercave",
    "albumName": "Never Happened",
    "ts": "2022-02-22T01:17:55Z",
    "reasonStart": "trackdone",
    "reasonEnd": "trackdone"
}
""".data(using: .utf8)!

let obj = try JSONSerialization.jsonObject(with: trackJson, options: [])
print(obj)


/*:
 This is the most simple and straightforward way of decoding JSON in an object. Here the JSON property names match the receiving
 struct's property names. All I have to do is have the struct derive out of Decodable. If I want to be able to encode
 the struct back to JSON as well then I need to derive it out of Codable. Any nested types also need to derive from
 Decodable. For enums, if I use the same case names as the strings that show up in JSON I don't have to do anything.
 But if I want to map the JSON string values to better case names, it is fairly simple.
*/


//enum Reason: String, Decodable {
//    case appload, backbtn, clickrow, fwdbtn, playbtn, remote, trackdone, endplay
//}
enum Reason: String, Decodable {
    case appLoad = "appload"
    case backButton = "backbtn"
    case clickRow = "clickrow"
    case forwardButton = "fwdbtn"
    case playButton = "playbtn"
    case remote = "remote"
    case trackDone = "trackdone"
    case endPlay = "endplay"
}

struct SimpleTrack: Decodable {
    var trackName: String
    var artistName: String
    var albumName: String
    var ts: String
    var reasonStart: Reason
    var reasonEnd: Reason
    
    func repr() -> String {
        var ret = "Track"
        ret += "  trackName: \(trackName)\n"
        ret += "  artistName: \(artistName)\n"
        ret += "  albumName: \(albumName)\n"
        ret += "  ts: \(ts)\n"
        ret += "  reasonStart: \(reasonStart)\n"
        ret += "  reasonEnd: \(reasonEnd)\n"
        return ret
    }
}

var decoder = JSONDecoder()

var track = try? decoder.decode(SimpleTrack.self, from: trackJson)
print(track!.repr())

/*:
 A common thing that happens is that the input JSON is usually in snake case (go Python!), but I want to preserve the
 naming conventions of Swift. JSONDecoder has a handy keyDecodingStrategy property that I can set for this. Nothing else is
 required.
 */

let track_json = """
{
    "track_name": "Poor George",
    "artist_name": "James Supercave",
    "album_name": "Never Happened",
    "ts": "2022-02-22T01:17:55Z",
    "reason_start": "trackdone",
    "reason_end": "trackdone"
}
""".data(using: .utf8)!

decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

track = try? decoder.decode(SimpleTrack.self, from: track_json)
print(track!.repr())

/*:
 Another very common thing is to decode the JSON string to Date objects. All I have to do is set the handy dateDecodingStrategy
 of JSONDecoder. In this case I got lucky because the input date was in ISO 8601 format and Swift has really good support
 for that.
 */
struct TimestampedTrack: Decodable {
    var trackName: String
    var artistName: String
    var albumName: String
    var ts: Date
    var reasonStart: Reason
    var reasonEnd: Reason
    
    func repr() -> String {
        var ret = "Track"
        ret += "  trackName: \(trackName)\n"
        ret += "  artistName: \(artistName)\n"
        ret += "  albumName: \(albumName)\n"
        ret += "  ts: \(ts)\n"
        ret += "  reasonStart: \(reasonStart)\n"
        ret += "  reasonEnd: \(reasonEnd)\n"
        return ret
    }
}

decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .iso8601

var tstrack = try? decoder.decode(TimestampedTrack.self, from: track_json)
print(tstrack!.repr())

/*:
 Even if the input JSON has date in some other format, I can always just set the dateDecodingStrategy to a DateFormatter
 object. If the input dates are in a format that Swift's DateFormatter class cannot parse, there is still a way to
 decode them, but I'll explain that after I have explained how the JSONDecoder works.
 */

let tsjson = """
{
    "track_name": "Poor George",
    "artist_name": "James Supercave",
    "album_name": "Never Happened",
    "ts": "Feb 22, 2022 at 1:17:55 AM",
    "reason_start": "trackdone",
    "reason_end": "trackdone"
}
""".data(using: .utf8)!

decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
var df = DateFormatter()
df.dateStyle = .medium
df.timeStyle = .medium
decoder.dateDecodingStrategy = .formatted(df)

tstrack = try? decoder.decode(TimestampedTrack.self, from: tsjson)
print(tstrack!.repr())

/*:
 If my receiving struct has differernt property names than the incoming JSON then I can define an enum named `CodingKeys`.
 The name has to be exactly this, otherwise it won't work. The astute reader will notice that I can use this technique
 to implement the snake case convert strategy.
 */

struct Song: Decodable {
    var title: String
    var album: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "track_name"
        case album = "album_name"
    }
}
decoder = JSONDecoder()
var song = try? decoder.decode(Song.self, from: tsjson)
print(song!)

/*:
 If none of these decoding techniques work for me, I can implement my own super custom decoder. The Decoder protocol
 has a default init that does all the above magic. But I can always override this init function with my own and do
 whatever I want in there. The decoder can give me a container, think of it like a dict, that has pre-populated keys.
 The key names are given by the CodingKeys enum. Then I can decode individual properties from this container as long
 as the individual elements are themselves decodable.
 */
struct PlayHistoryItem: Decodable {
    var song: String
    var by: String
    var duration: DateInterval
    
    func repr() -> String {
        var ret = "PlayHistoryItem:\n"
        ret += "  song: \(song)\n"
        ret += "  by: \(by)\n"
        ret += "  duration: \(duration)\n"
        return ret
    }
    
    private enum CodingKeys: String, CodingKey {
        case trackName = "track_name"
        case artistName = "artist_name"
        case albumName = "album_name"
        case ts = "ts"
        case reasonStart = "reason_start"
        case reasonEnd = "reason_end"
    }
    
    init(from decoder: Decoder) throws {
        let cal = Calendar.current
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            song = try container.decode(String.self, forKey: CodingKeys.trackName)
            by = try container.decode(String.self, forKey: CodingKeys.artistName)
            
            var ts = try container.decode(String.self, forKey: CodingKeys.ts)
            var df = DateFormatter()
            df.dateStyle = .medium
            df.timeStyle = .medium
            if let date = df.date(from: ts) {
                duration = cal.dateInterval(of: .day, for: date)!
            } else {
                duration = cal.dateInterval(of: .day, for: Date.now)!
            }
        } catch {
            print(error)
            song = ""
            by = ""
            duration = cal.dateInterval(of: .day, for: Date.now)!
        }
    }
}

decoder = JSONDecoder()
var phi = try? decoder.decode(PlayHistoryItem.self, from: tsjson)
print(phi!.repr())

/*:
 Lets come back to the super custom date decoder which is needed because my date format is so custom that Swift's
 DateFormatter class will not suffice. The dateDecodingStrategy can also accept a function that takes in the decoder
 and outputs the date.
 */

let playedTrackJson = """
{
    "track_name": "Poor George",
    "artist_name": "James Supercave",
    "album_name": "Never Happened",
    "ts": "${today}",
    "reason_start": "trackdone",
    "reason_end": "trackdone"
}
""".data(using: .utf8)!

struct PlayedTrack: Decodable {
    var trackName: String
    var artistName: String
    var albumName: String
    var ts: Date
    var reasonStart: Reason
    var reasonEnd: Reason
    
    static func decodeDateTemplate(decoder: Decoder) -> Date {
        do {
            let container = try decoder.singleValueContainer()
            let ts = try container.decode(String.self)
            if ts == "${today}" {
                return Calendar.current.startOfDay(for: Date.now)
            } else {
                return Date.distantFuture
            }
        } catch {
            print(error)
            return Date.distantPast
        }
    }
    
    func repr() -> String {
        var ret = "Track"
        ret += "  trackName: \(trackName)\n"
        ret += "  artistName: \(artistName)\n"
        ret += "  albumName: \(albumName)\n"
        ret += "  ts: \(ts)\n"
        ret += "  reasonStart: \(reasonStart)\n"
        ret += "  reasonEnd: \(reasonEnd)\n"
        return ret
    }
}

decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .custom(PlayedTrack.decodeDateTemplate)
var playedTrack = try? decoder.decode(PlayedTrack.self, from: playedTrackJson)
print(playedTrack!.repr())

/*:
 Finally here is how to read a text file into a Data object.
 */
var jsonFile = URL.homeDirectory.appending(path: "projects/bitbucket/learn/learn-swift/data.json")
if let json = try? Data(contentsOf: jsonFile) {
    print(json)
}

//: [Next](@next)

