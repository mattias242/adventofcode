function mapdatatobits(mapdata,bits)
	--print(mapdata,bits)
	local bitpattern = 0
	for i=1,bits do
		local tree = string.sub(mapdata,i,i)
		--print(i,tree)
		if tree =="." then
		    bitpattern=bit32.bor(bitpattern,0)
		elseif tree== "#" then
		    bitpattern=bit32.bor(bitpattern,1)
		else
			print("ERROR!")
			return nil
		end
		bitpattern = bit32.lshift(bitpattern,1)
		--printx(bitpattern)
	end
	return bitpattern
end

function printmap(mapdata)
	for _,maprow in next, mapdata do
		print(maprow)
	end
end

function printx(x)
  print(string.format("%#010x",x))
end

function printbits(data,bits)
	local bitstring=""
	local i=bits
	--printx(data)
	while i>0 do
		bitstring = bitstring .. tostring(bit32.extract(data,i))
		i = i -1
	end
	print(bitstring)
end

local map = {}
function readmap(...)
	local row=1
	for trees in io.lines("input-3.txt") do
		map[row] = mapdatatobits(trees,31)
		--printbits(map[row],31)
		row=row+1
	end
end

function dec3part1(...)
	readmap()

	local treeshit = 0
	local toboggan = bit32.rrotate(1,1)
	bit = 1
	for k,v in pairs(map) do
		hittree = bit32.band(v,toboggan)
		printbits(toboggan,31)
		printbits(v,31)
		print(hittree>0)
		if hittree>0 then treeshit = treeshit + 1	end

		if toboggan == 0 then
			print("ERROR")
			return
		end
		toboggan = bit32.rrotate(toboggan,3)
		bit = bit + 3
		if bit > 31 then
			toboggan = bit32.rrotate(1,4)
			bit = 1
		end
	end

	print("December - Part 1 The toboggan hit ", treeshit, " trees on our way down.")
end

function dec3part2(...)
	-- body
end

dec3part1()
dec3part2()




