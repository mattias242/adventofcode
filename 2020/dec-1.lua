expenserecord = {}
for item in io.lines("input-1.txt") do
	expenserecord[item-0] = item
end

for item in next, expenserecord do
	diff = 2020 - item
	itemx = expenserecord[diff]
	if itemx then
			print("December 1 - part 1: ", item * itemx)
		break
	end
end

function findrecord( exprecord, initial)
	for item in next, exprecord do
			print(item,initial)
		if tonumber(item) < initial then 
			print(item)
			return item, findrecord( exprecord, initial-item)
		end
	end
end

findrecord(expenserecord, 2020)


found = false
for item in next, expenserecord do
	for itemx in next, expenserecord do
		for itemy in next, expenserecord do
			if item + itemx + itemy == 2020 then
				print ("December 1 - part 2: ", item,itemx,itemy,item * itemx * itemy)
				found = true
				return
			end
		end
	end
end


