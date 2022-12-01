require 'date'

class DateVerification
  def self.get_date(date)
    date = valid_date?(date) ? date : valid_date?(date)
    while date == false
      print 'Use correct date format[dd/mm/yyyy]: '
      date = gets.chomp
      date = valid_date?(date) ? date : valid_date?(date)
    end
    date
  end

  def self.valid_date?(date)
    date_format = '%d/%m/%Y'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end
end
