require "csv"
require "nkf"

# This program is written for 駅データ
new_csv = open('data/m_station_utf8.csv', "wb", :row_sep => :auto)
open('data/m_station.csv', mode = "rb:EUC-JP:UTF-8", :row_sep => :auto).each{ |line|
  CSV.parse(line).each {|row|
    begin
      NKF::nkf("-w", row.to_s)
    rescue
      #row.to_s.encode("UTF-16BE", invalid: :replace, undef: :replace, replace: '?').encode("UTF-8")
    ensure
      #CSV.dump('data/m_station_utf8.csv')
      new_csv << row
    end
  }
}
