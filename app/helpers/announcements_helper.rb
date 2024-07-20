module AnnouncementsHelper
  def parse_to_real(value)
    number_to_currency(value, precision: 2, unit: "R$", delimiter: ".", separator: ",", format: "%u %n")
  end
end
