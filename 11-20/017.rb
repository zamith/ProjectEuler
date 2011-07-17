#!/usr/bin/env ruby -w

## NOTE: The changes to the Fixnum class were based on http://raveendran.wordpress.com/2009/05/29/ruby-convert-number-to-english-word/

class Fixnum
  def english_word
    @h = {0=>"zero", 1=>"one", 2=>"two", 3=>"three",
          4=>"four", 5=>"five",6=>"six", 7=>"seven", 8=>"eight",
          9=>"nine",10=>"ten",11=>"eleven",12=>"twelve",
          13=>"thirteen",14=>"fourteen",15=>"fifteen",
          16=>"sixteen",17=>"seventeen",18=>"eighteen",
          19=>"nineteen",20=>"twenty",30=>"thirty",
          40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",
          80=>"eighty",90=>"ninety"}
    @i=0
    @array=[]
    @result=""
    if self > 99
      str_num=self.to_s #@num.to_s
      str_num_len=str_num.length
      str_full_num=str_num.insert(0,"0"*(11-str_num_len))
      str_full_num=str_num.insert(8,"0")
      str_full_num.scan(/../) { |x|  @array<<x }
      6.times do
        self.def_calc
        @i+=1
      end
      return @result
    else
      if self > 9
        return @h[self] if @h[self]
        return (self.proc_double_dig((self/10)*10))+(self.proc_single_dig(self%10))
      elsif self > 0
        return self.proc_single_dig(self)
      else
        return "AMOUNT NOT KNOWN or NILL"
      end
    end
  end

  def def_calc
    case @i
    when 0
      str=self.proc_unit(@array[@i])
      if (str.scan(/\w+/)).length!=0
      then str=str+ "hundred & "
        @result=@result+str
      end
    when 1
      str=self.proc_unit(@array[@i])
      if (str.scan(/\w+/)).length!=0
      then str=str+ " Crore, "
        @result=@result+str
      end
    when 2
      str=self.proc_unit(@array[@i])
      if (str.scan(/\w+/)).length!=0
      then str=str+ " Lakh, "
        @result=@result+str
      end
    when 3
      str=self.proc_unit(@array[@i])
      if (str.scan(/\w+/)).length!=0
      then str=str+ " thousand"
        @result=@result+str
      end
    when 4
      str=self.proc_unit(@array[@i])
      size=(str.scan(/\w+/)).length      
      str=" "+str+ " hundred" if size == 1
      str=str+ " hundred" if size > 1        
      @result=@result+str
    when 5
      str=self.proc_unit(@array[@i])
      if (str.scan(/\w+/)).length!=0
      then str=" and "+str
        @result=@result+str
      end
      @result.sub(/..$/,"")
    else
    end
  end

  def proc_unit(x)
    if x.to_i>0
      if x.to_i<=10
        return self.proc_single_dig(x.to_i)
      else
        if x.to_i<=20
          return self.proc_double_dig(x.to_i)
        else
          return (self.proc_double_dig((x.to_i/10)*10))+(self.proc_single_dig(x.to_i%10))
        end
      end
    else
      return self.proc_single_dig(0)
    end
    return ""
  end

  def proc_double_dig(z)
    if z==0
      return ""
    else
      return @h[z]
    end
  end

  def proc_single_dig(y)
    if y==0
      return ""
    else
      return @h[y]
    end  
  end
  protected :def_calc, :proc_unit, :proc_double_dig,
    :proc_single_dig

end

def count_letters str
  str.tr!(' ','')
  str.size
end  

res=(1..1000).inject(0) do |sum,num|
  sum+=count_letters num.english_word
end

p res