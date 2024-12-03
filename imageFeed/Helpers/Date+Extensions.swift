import Foundation

extension Date {
    var dateTimeString: String { DateFormatter.dateForPhoto.string(from: self) }
}

private extension DateFormatter {
    static let dateForPhoto: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru-RU")
        dateFormatter.dateFormat = "dd MMMM YYYY"
        return dateFormatter
    }()
}

