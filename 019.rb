#!/usr/bin/env ruby -w

require 'Date'

# Faster solution
$t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
def dow(d, m, y)
  y -= m if m < 3
  return (y + y/4 - y/100 + y/400 + $t[m-1] + d) % 7
end

nrSundays = 0
(1901..2000).each do |year|
  (1..12).each do |month|
    nrSundays+= 1 if dow(1,month,year) == 0
  end  
end  

p nrSundays

# Cleaner solution

def get_sundays(date_start,date_end)
  nrSundays = 0  
  while date_start.year <= date_end.year # Want to check all months, no need to compare that
    nrSundays += 1 if date_start.wday == 0
    date_start = date_start >> 1 
  end
  nrSundays
end  

p get_sundays(Date::civil(1901, 1, 1).gregorian, Date::civil(2000, 12, 31).gregorian)

# Even cleaner (not 100% certain)

p 1200/7 