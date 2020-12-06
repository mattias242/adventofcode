-- dec-6.lua
require("niceones")

function dec6(...)
  allquestions={}
  groupquestions = {}
  groupreplies = {}
  groupsize = 0
  uniquequestions = 0 
  for questions in io.lines("input-6.txt") do
    groupsize = groupsize + 1
    if questions ~= "" then 
      for match in string.gmatch(questions,"%a") do
        groupquestions[match] = ((groupquestions[match] or 0) > 1 or 1)
        groupreplies[match] = ((groupreplies[match] or 0) + 1)
      end
    else
      for k,v in pairs(groupquestions) do
        allquestions[k] = (allquestions[k] or 0) + v
      end
      groupsize = groupsize - 1
      for k,v in pairs(groupreplies) do
        if groupreplies[k] >= groupsize then 
          uniquequestions = uniquequestions + 1 
        end
      end
      groupquestions={}
      groupreplies={}
      groupsize = 0
    end
  end
  if questions == nil  then
    for k,v in pairs(groupquestions) do
      allquestions[k] = (allquestions[k] or 0) + v
    end
    groupsize = groupsize -1 
    for k,v in pairs(groupreplies) do
      if groupreplies[k] >= groupsize then uniquequestions = uniquequestions + 1 end
    end
  end

  sum = 0
  for _,v in pairs(allquestions) do
    sum = sum + v
  end

  print("December 6 part 1: ", sum)
  print("December 6 part 2: ", uniquequestions)
end

dec6()

