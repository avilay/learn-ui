//: [Previous](@previous)

import Foundation

/*
 There are two main date objects, Date and Calendar. Out of these, Date is pretty much
 useless for direct use, Calendar is where all the action is at. Even in Calendar there
 are a bunch of useless functions and variables, and some downright unintuitive ones.
 
 !!WARN!!: Do not use the quarter component, it always returns 0.
 */

var now = Date.now
let cal = Calendar.current

/*
 There are two main ways to format datetimes, using the DateFormatter class or the
 ISO8601DateFormatter class. Staying true to its unintuitive form, ISO8601DateFormatter
 is not a child class of DateFormatter, rather they are both sister classes derived from
 the generic Formatter class.
 
 Format strings are the same as the IEEE format -
 https://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
 */
var df = DateFormatter()
df.dateStyle = .medium
df.timeStyle = .medium
print(df.string(from: now))  // Jul 19, 2023 at 12:24:35 AM
df.setLocalizedDateFormatFromTemplate("EEEE")  // Wednesday
print(df.string(from: now))

var isodf = ISO8601DateFormatter()
// isodf.formatOptions = [.withFullDate, .withFullTime, .withSpaceBetweenDateAndTime]
isodf.formatOptions = [.withFullDate]
isodf.timeZone = .current
print(isodf.string(from: now))  // 2023-07-19

// will use this function throughout this notebook
func strptime(_ date: Date) {
    var df = DateFormatter()
    df.dateStyle = .medium
    df.timeStyle = .medium
    print(df.string(from: date))
}

/*
 Calendar components like year, month, day, second, etc. are central to the Calendar
 APIs. These strings are enum'ed into the Calendar.Component enum. The corresponding
 DateComponents struct holds the values of these components. For example, DateComponents
 has a var called year, and there is a corresponding Calendar.Component case called year.
 Almost all of these components are integer form. Calendar has a bunch of covenience
 methods to get the string names of these components as well.
 
 Here is the essence of both types -
 
 enum CalendarComponent {
     case era
     case year
     case yearForWeekOfYear -> wtf?!?
     case quarter
     case month
     case weekOfYear
     case weekOfMonth
     case weekday
     case weekdayOrdinal
     case day
     case hour
     case minute
     case second
     case nanonsecond
     case calendar
     case timeZone
 }
 
 struct DateComponents {
     var calendar: Calendar?
     var timeZone: TimeZone?
     var isValidDate: Bool
     var date: Date?
     var era: Int?
     var year: Int?
     var yearForWeekOfYear: Int?
     var quarter: Int?
     var month: Int?
     var isLeapMonth: Bool?
     var weekOfMonth: Int?
     var weekOfYear: Int?
     var weekday: Int?
     var weekdayOrdinal: Int?
     var day: Int?
     var hour: Int?
     var minute: Int?
     var second: Int?
     var nanonsecond: Int?
 }
 */
// Get some specific date components
var dc = cal.dateComponents([.year, .month, .day], from: now)
print(type(of: dc), dc)  // DateComponents year: 2023 month: 7 day: 19 isLeapMonth: false


// Get all the date components
dc = cal.dateComponents(in: cal.timeZone, from: now)
print(dc)
/*
 Will print -
     calendar: gregorian (current)
     timeZone: America/Los_Angeles (fixed (equal to current))
     era: 1
     year: 2023
     month: 7
     day: 19
     hour: 0
     minute: 34
     second: 10
     nanosecond: 448173999
     weekday: 4
     weekdayOrdinal: 3
     quarter: 0
     weekOfMonth: 4
     weekOfYear: 29
     yearForWeekOfYear: 2023
     isLeapMonth: false
 */

// Methods to get the string names of components
// Beware that the component value is not the direct index into the string array.
// It is off by 1, i.e., if I pretend that the string arrays start with index 1,
// then I can map the component integer values to the string array element.
// e.g. month value of January is 1, not 0.
print(cal.monthSymbols)
var m = cal.component(.month, from: now)
print(m, cal.monthSymbols[m-1])
print(cal.shortMonthSymbols)
print(cal.veryShortMonthSymbols)
print(cal.weekdaySymbols)
print(cal.shortWeekdaySymbols)
print(cal.veryShortWeekdaySymbols)

// Convert datetime to date
var today = cal.startOfDay(for: now)
strptime(today)  // Jul 19, 2023 at 12:00:00 AM

// Create a date with a specific day/month/year, etc.
var d = cal.date(from: DateComponents(year: 1976, month: 1, day: 30, hour: 3, minute: 30))
strptime(d!)  // Jan 30, 1976 at 3:30:00 AM

// Create a date as an offset of some reference date
d = cal.date(byAdding: DateComponents(month: 1), to: now)
strptime(d!)

// Another convenience method for doing the same thing
d = cal.date(byAdding: .month, value: 1, to: now)
strptime(d!)

// Both these methods have an optional param called wrappingComponents
// that is set to false by default. This determines whether the date rolls forward.
// Again true to its non-intuitiveness, setting this to true means that the date
// will **not** wrap around.
d = cal.date(byAdding: .day, value: 20, to: now, wrappingComponents: false)
strptime(d!)
d = cal.date(byAdding: .day, value: 20, to: now, wrappingComponents: true)
strptime(d!)

/*
 The date interval family of APIs is very interesting and potentially useful, they give
 the interval that contains the specified instance of time (as specified by the datetime
 object ofcourse). The granularity of the interval is also an input argument given by the user.
 
 The return type is DateInterval which is a useful little struct -
 
 struct DateInterval {
    var start: Date
    var end: Date
    var duration: TimeInterval
    
    func intersection(with: DateInterval) -> DateInterval?
    func intersects(DateInterval) -> Bool
    func contains(Date) -> Bool
 
    // some more equality ops
 }
 
 Even though the documentation of the date interval family of APIs says that the interval returned
 is [start, end], it is actually [start, end).
 */
print("\n\n")
strptime(now)  // Jul 20, 2023 at 6:38:29 PM
var interval = cal.dateInterval(of: .month, for: now)
print(interval!)  // 2023-07-01 07:00:00 +0000 to 2023-08-01 07:00:00 +0000

// Note that the output is printed in GMT timezone. To get a more realistic picture -
extension DateInterval {
    func repr() -> String {
        var df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .medium
        return "\(df.string(from: start)) - \(df.string(from: end))"
    }
}
print(interval!.repr())  // Jul 1, 2023 at 12:00:00 AM - Aug 1, 2023 at 12:00:00 AM
// This is the month that contains this instance of time.

interval = cal.dateInterval(of: .day, for: now)
print(interval!.repr())  // Jul 20, 2023 at 12:00:00 AM - Jul 21, 2023 at 12:00:00 AM

// A related method gets the next weekend that occurs after this date. Today Jul 20 is a Thursday
// Saturday is the 22nd and Sunday is the 23rd.
interval = cal.nextWeekend(startingAfter: now)
print(interval!.repr())  // Jul 22, 2023 at 12:00:00 AM - Jul 24, 2023 at 12:00:00 AM

print("Is now in today? ", cal.isDateInToday(now))
print("Is now in tomorrow? ", cal.isDateInTomorrow(now))
print("Is now in yesterday? ", cal.isDateInYesterday(now))
print("Is now a weekend? ", cal.isDateInWeekend(now))

// Comparing datetimes is a pain, just like comparing floats. There needs to be a way to specify
// the tolerance. The following API provides just that -
var yesterday = now - TimeInterval(24 * 60 * 60)
print(yesterday == now)
print(cal.isDate(now, equalTo: yesterday, toGranularity: .month))

// Converting UTC to local: The date object is the same regardless of whether I represent
// the date as UTC or local timezone. So when I say "convert" I mean **display** in local
// timezone. DateFormatter automatically converts to local timezone even if I don't specify.
let ts = Date.now
let dateFormatter = DateFormatter()
//dateFormatter.calendar = Calendar(identifier: .iso8601)
//dateFormatter.locale = Locale(identifier: "en_US_POSIX")
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"
let ds = dateFormatter.string(from: ts)
print(ts, ds)


//: [Next](@next)

