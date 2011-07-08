#!/usr/bin/env ruby -w

$currentM2=0
$currentM1=2
$sum=2

def fibNext
  current = 4 * $currentM1 + $currentM2
  $currentM2 = $currentM1
  $currentM1 = current 
  current
end  

while((current=fibNext)<4000000)
  $sum += current
end  

p $sum