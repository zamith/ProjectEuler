#!/usr/bin/env ruby -w

def isPalindrome str
  return str == str.reverse
end  

max = 0
999.downto 100 do |first_set|
  999.downto 100 do |second_set|
     result=first_set*second_set
     if result <= max
       break
     end 
     max = result if isPalindrome(result.to_s) && result > max     
  end
end    

print max
