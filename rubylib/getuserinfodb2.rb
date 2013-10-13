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

#key="CAACEdEose0cBAGHJDgX2r8rn6AAHAOk1rKZBXoy3g3NfZA9wbJKeiSEJsyWZCtFre33w8R6jsjY9jMXrUPMFKb8RaG9ZCZARFeXUgn0htZAnShQLOG8iZB4tFw8JUMKgCfH6HZCydJqLCpIHyYCUefvXm0AiZAtn0j5zbUdR42fV0ZCTfDLrxbZBjqKPsVMAyrunvWCGAJBDEncuAZDZD"
key="CAACEdEose0cBAIzP9rr6F0xSw11fLB8Fivt2QrHzQHu1B6anPVmgLKB9QZC7XCgZAbLLiZCzRouvKyDsBtBTktzaZB6yuXh8pWP2ALM2hZAQLCsx9hUlGmon02WYEG9HotgSvYTNVCXJiwWESs0lQGrndgRn01DuIJse6MCCnd3ZAiEO0vVmT36OZCPNiMSDKr5w1VoZA8QqEAZDZD"
#id=""
id=""

jj = %x{ curl "https://graph.facebook.com/#{id}?fields=friends.fields(name,education,work)&access_token=#{key}"}.force_encoding("UTF-8")

#puts jj

#jj = ''
#File.open('result','r'){|i|
#        jj = i.read
#}
#puts jj
oo = JSON.parse(jj)

s = 0
meid = "999999999"
result = ""
((oo["friends"].first().to_a)[1]).to_a.each{|i|
        result += "node:{ \"id\":\"#{i["id"]}\" , \"name\":\"#{i["name"]}\" } \n"
	#set me link
	  result += "links:{\"src\":\"#{meid}\" , \"des\":\"#{i["id"]}\" , \"name\":\"my friend\"}\n"
	a = nil
        x = getschool(i["education"])
          if x != nil
                aa = x.split(",")
                result += "node:{ \"id\":\"#{aa[0]}\" , \"name\":\"#{aa[1]}\" } \n"

                result += "links:{\"src\":\"#{i["id"]}\" , \"des\":\"#{aa[0]}\" , \"name\":\"school info\"}\n"
          end
        
	a = getcomopy(i["work"])
	  if a != nil
		aa = a.split(",")
                result += "node:{ \"id\":\"#{aa[0]}\" , \"name\":\"#{aa[1]}\" } \n"
	  
        	result += "links:{\"src\":\"#{i["id"]}\" , \"des\":\"#{aa[0]}\" , \"name\":\"work info\"}\n"
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

