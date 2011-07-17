#!/usr/bin/env ruby -w

### Pre processing
# ruby -a -F, -i -ne 'puts $F' names.txt
# sort -g names.txt > names_alf.txt

total_names_score=0
File.open("resources/names_alf.txt", "r").each_line do |line|
  line.delete!("\"").strip!
  alf_val=0
  line.upcase.each_char do |char|
    alf_val_char = char.ord - 64
    alf_val+=alf_val_char
  end
  total_names_score += alf_val * $.
end

p total_names_score

