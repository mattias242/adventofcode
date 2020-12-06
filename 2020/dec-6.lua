-- dec-5.lua

  allquestions={}

function initallquestions()
  for i=1,26 do
    allquestions[string.char(string.byte('a')+i-1)]=0
  end
end

function dec4part1(...)
  initallquestions()
  groupquestions = {}
  for questions in io.lines("input-6.txt") do
    if questions ~= "" then 
      for match in string.gmatch(questions,"%a") do
        groupquestions[match] = (groupquestions[match] > 1 or 1)
      end
    else
      for k,v in pairs(table_name) do
        allquestions[k]=allquestions[k] + v
      end
      groupquestions={}
    end
  end
  print("December 4 part 1: ", maxseat)
end

function dec4part2(...)
  for i=minseat,maxseat do
    if passengers[i] == nil then myseat = i end
  end
  print("December 4 part 2: ", myseat)
end

readboardingcards()
dec4part1()
dec4part2()

