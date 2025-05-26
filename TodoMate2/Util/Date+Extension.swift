//
//  Date+Extension.swift
//  TodoMate2
//
//  Created by hs on 8/13/24.
//

import Foundation

extension Date {
	var yearMonthDay: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
    return formatter.string(from: self)
  }

	var yearMonth: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy년 M월"
    return dateFormatter.string(from: self)
  }
	
	var month: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "M"
		return dateFormatter.string(from: self)
	}

  var day: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    return dateFormatter.string(from: self)
  }

  func isSameDay(as date: Date) -> Bool {
    return Calendar.current.isDate(self, inSameDayAs: date)
  }

  var isToday: Bool {
    return Calendar.current.isDateInToday(self)
  }

  var startOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }
}
