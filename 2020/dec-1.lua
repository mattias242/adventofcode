expense = {}
for item in io.lines("input-1.txt") do
	expense[item-0] = item
end

for item in next, expense do
	diff = 2020 - item
	itemx = expense[diff]
	if itemx then
			print("December 1 - part 1: ", item * itemx)
		break
	end
end

found = false
for item in next, expense do
	for itemx in next, expense do
		for itemy in next, expense do
			if item + itemx + itemy == 2020 then
				print ("December 1 - part 2: ", item * itemx * itemy)
				found = true
				return
			end
		end
	end
end


