require 'rubygems'
require 'json'

def getschool(c)
        if c != nil
          c.each{|s|
                #p s["school"]["id"] + "," +  s["school"]["name"]
		if s["type"] =~ /.*(College|Graduate).*/
                   return "#{s["school"]["id"]} , #{s["school"]["name"]}"
		end
          }
        end
	return nil
end

def getcomopy(c)
        if c != nil
          c.each{|x|
		#get one record
                return "#{x["employer"]["id"]} , #{x["employer"]["name"]}"
		break
          }
        end
	return nil
end

key="CAACEdEose0cBAGQvUIYlE6CiVIlk0ZB0PcTmCr7XwZCS05De4UjGNvdnkKBbbgRZATqglfrEZCe47pMVHZCC7QHIaaNpBchwwhtsiKlH0N3eMMW2Ov9kigvrRDYaQTDGPlg3DxuGi9d7SE1aRPUGcu0LF9ODeJT2lNiVHvFXePU6C0jFnuRynOU7DEOjzrcFoFLuI98jBVwZDZD"


#puts jj

#jj = ''
#File.open('result','r'){|i|
#        jj = i.read
#}
#puts jj
oo = JSON.parse(jj)

s = 0
result = ""
((oo["friends"].first().to_a)[1]).to_a.each{|i|
        result += "node:{ id:#{i["id"]} , name:#{i["name"]} } \n"
	a = nil
        x = getschool(i["education"])
          if x != nil
                aa = x.split(",")
                result += "node:{ id:#{aa[0]} , name:#{aa[1]} } \n"

                result += "linke:{src:#{i["id"]} , des:#{aa[0]} , name:school info}\n"
          end
        
	a = getcomopy(i["work"])
	  if a != nil
		aa = a.split(",")
                result += "node:{ id:#{aa[0]} , name:#{aa[1]} } \n"
	  
        	result += "linke:{src:#{i["id"]} , des:#{aa[0]} , name:work info}\n"
	  end
}
puts result
=begin
n = 0
jj.each{|i|
         i.each{|o|
                p o
                n += 1
        }
}
puts n
=end

