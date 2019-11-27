//
//  NSDate+Extension.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.


import Foundation

public extension Date {
    static var milliseconds: TimeInterval {
        get { return Date().timeIntervalSince1970 * 1000 }
    }
    
    func week() -> String {
        let myWeekday: Int = (Calendar.current as NSCalendar).components([NSCalendar.Unit.weekday], from: self).weekday!
        switch myWeekday {
        case 0:
            return "Sunday" //周日
        case 1:
            return "Monday" //周一
        case 2:
            return "Tuesday" //周二
        case 3:
            return "Wednesday" //周三
        case 4:
            return "Thursday"  //周四
        case 5:
            return "Friday"  //周五
        case 6:
            return "Saturday" //周六
        default:
            break
        }
        return "No data retrieved" //未取到数据
    }
    
    static func messageAgoSinceDate(_ date: Date) -> String {
        return self.timeAgoSinceDate(date, numericDates: false)
    }
    
    static func timeAgoSinceDate(_ date: Date, numericDates: Bool) -> String {
        let calendar = Calendar.current
        let now = Date()
        let earliest = (now as NSDate).earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:DateComponents = (calendar as NSCalendar).components([
            NSCalendar.Unit.minute,
            NSCalendar.Unit.hour,
            NSCalendar.Unit.day,
            NSCalendar.Unit.weekOfYear,
            NSCalendar.Unit.month,
            NSCalendar.Unit.year,
            NSCalendar.Unit.second
            ], from: earliest, to: latest, options: NSCalendar.Options())
        
        if (components.year! >= 2) {
            return "\(String(describing: components.year!)) Years ago"  //年前
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 Years ago"  //年前
            } else {
                return "last year"  //去年
            }
        } else if (components.month! >= 2) {
            return "\(String(describing: components.month!)) Month ago"  //月前
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 Month ago" //  个月前
            } else {
                return "last month" //上个月
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(String(describing: components.weekOfYear!)) Week ago"  //周前
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 Week ago" //周前
            } else {
                return "Last week"  //上一周
            }
        } else if (components.day! >= 2) {
            return "\(String(describing: components.day!)) Days ago"  //天前
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 天前" //天前
            } else {
                return "yesterday"  //昨天
            }
        } else if (components.hour! >= 2) {
            return "\(String(describing: components.hour!)) hour ago"  //小时前 // An hour ago
        } else if (components.hour! >= 1){
            return "1 hour ago" //小时前   //1 An hour ago
        } else if (components.minute! >= 2) {
            return "\(String(describing: components.minute!)) Min ago"  //分钟前   //Minutes ago
        } else if (components.minute! >= 1){
            return "1 Min ago" //分钟前
        } else if (components.second! >= 3) {
            return "\(String(describing: components.second!)) Sec ago" //秒前
        } else {
            return "Just" //刚刚
        }
    }
    
    public func removeTimeStamp() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let datenew = dateFormatter.string(from: self)
        return datenew
    }
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    var dayShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: self)
    }
    
    var monthShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
  
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
        formatter.dateFormat = "h:mm a"
//        formatter.amSymbol = "AM"
//        formatter.pmSymbol = "PM"
        
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    
    func toStringCell() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd, MMMM yyyy h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let dateString = formatter.string(from: self)
        return dateString
    }
 
    func toStringformat(format:String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func toStringformat() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
    func timeAgoStringFromDate(dateStr: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date1 = dateFormatter.date(from: dateStr)
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        
        let now = Date()
        
        let calendar = NSCalendar.current
        let unitFlags = Set<Calendar.Component>([.day, .month, .year, .hour, .weekOfMonth, .minute, .second])
        let components = calendar.dateComponents(unitFlags, from: date1!, to: now)
        
        
        if components.year! > 0 {
            formatter.allowedUnits = .year
        } else if components.month! > 0 {
            formatter.allowedUnits = .month
        } else if components.weekOfMonth! > 0 {
            formatter.allowedUnits = .weekOfMonth
        } else if components.day! > 0 {
            formatter.allowedUnits = .day
        } else if components.hour! > 0 {
            formatter.allowedUnits = .hour
        } else if components.minute! > 0 {
            formatter.allowedUnits = .minute
        } else {
            formatter.allowedUnits = .second
        }
        
        let formatString = NSLocalizedString("%@ ago", comment: "Used to say how much time has passed. e.g. '2 hours ago'")
        
        guard let timeString = formatter.string(from: components) else {
            return nil
        }
        return String(format: formatString, timeString) as String
    }
}





