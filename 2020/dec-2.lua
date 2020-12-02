correct = 0
for item in io.lines("input-2.txt") do
	_,_,min,max,char,password = string.find(item,"(%d+)-(%d+) (%a): (%a+)")
	_,count = string.gsub(password,char,"#")
	if count >= tonumber(min) and count <= tonumber(max) then
		correct = correct + 1
	end
	--print (min,max,char,password, count)
end
print("December 2 - part 1: ", correct)

correct = 0
for item in io.lines("input-2.txt") do
	_,_,fst,snd,char,password = string.find(item,"(%d+)-(%d+) (%a): (%a+)")
	fstfound = string.byte(char) == string.byte(password,tonumber(fst))
	sndfound = string.byte(char) == string.byte(password,tonumber(snd))
	if fstfound then 
		if not sndfound then
			correct = correct + 1
		end
	else 
		if sndfound then
			correct = correct + 1
		end
	end 
end
print("December 2 - part 2: ", correct)
