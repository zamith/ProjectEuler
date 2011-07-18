#!/usr/bin/env ruby -w

$currentM2=1
$currentM1=1

def fibNext
  current = $currentM1 + $currentM2
  $currentM2 = $currentM1
  $currentM1 = current 
  current
end

size=0
pos=2
while size < 1000
  val = fibNext
  pos+=1
  size = val.to_s.split('').size
end 

p pos 