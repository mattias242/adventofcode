-- dec-5.lua

boardincards={}
passengers={}
function readboardingcards()
  for boardingcard in io.lines("input-5.txt") do
    table.insert(boardincards, boardingcard)
  end
end

function calcrow(boardingpass)
  boardingpass = string.gsub(boardingpass,"B","1")
  boardingpass = string.gsub(boardingpass,"F","0")
  bin = string.reverse(boardingpass)
  local sum = 0

  for i = 1, string.len(bin) do
    num = string.sub(bin, i,i) == "1" and 1 or 0
    sum = sum + num * math.pow(2, i-1)
  end
  return sum
  -- body
end

function calccol(boardingpass)
  boardingpass = string.gsub(boardingpass,"R","1")
  boardingpass = string.gsub(boardingpass,"L","0")
  bin = string.reverse(boardingpass)
  local sum = 0

  for i = 1, string.len(bin) do
    num = string.sub(bin, i,i) == "1" and 1 or 0
    sum = sum + num * math.pow(2, i-1)
  end
  return sum
  -- body
end

maxseat = 0
minseat = 1008

function dec5part1(...)
  for i,boardingcard in ipairs(boardincards) do

    row = 8 * calcrow(string.sub(boardingcard,1,7))
    col = calccol(string.sub(boardingcard,8,10))
    seat = row + col
    passengers[seat] = true
    if seat > maxseat then maxseat = seat end
    if seat < minseat then minseat = seat end
  end
  print("December 5 part 1: ", maxseat)
end

function dec5part2(...)
  for i=minseat,maxseat do
    if passengers[i] == nil then myseat = i end
  end
  print("December 5 part 2: ", myseat)
end

readboardingcards()
dec4part1()
dec4part2()

