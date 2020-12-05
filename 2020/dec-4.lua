-- dec-4.lua

passports={}
function readpassports(...)
 
  local passportline
  local passportdata =""
  for passportline in io.lines("input-4.txt") do
    passportdata = passportdata .. passportline .. " "
    if passportline=="" then 
     table.insert(passports, passportdata)
     passportdata=""
   end
  end
  if passportdata~="" then 
   table.insert(passports, passportdata)
  end
end

function ispassportfieldspresent(passportdata)
  local fields = {"byr:","iyr:","eyr:","hgt:","hcl:","ecl:","pid:"}
  for k,v in pairs(fields) do
    if string.find(passportdata,v) == nil then 
      return false 
    end
  end
  return true
end

function ispassportcontentsvalid(passportdata)
  -- byr (Birth Year) - four digits; at least 1920 and at most 2002.
  -- iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  -- eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  -- hgt (Height) - a number followed by either cm or in:
  -- If cm, the number must be at least 150 and at most 193.
  -- If in, the number must be at least 59 and at most 76.
  -- hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  -- ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  -- pid (Passport ID) - a nine-digit number, including leading zeroes.
  -- cid (Country ID) - ignored, missing or not.

  local minmax = 1
  local unit = 2
  local option = 3
  local length = 4

  local fields = { "(byr):(%d+)","(iyr):(%d+)","(eyr):(%d+)","(hgt):(%d+%a+)","(hcl):#(%x+)","(ecl):(%a+)","(pid):(%d+)"}

  local fieldrules = { 
    ["hcl"] = function (value) if #value == 6 then return true else return false end end,
    ["byr"] = function (value) value = tonumber(value); if value >= 1920 and value <= 2002 then return true else return false end end,
    ["iyr"] = function (value) value = tonumber(value); if value >= 2010 and value <= 2020 then return true else return false end end,
    ["eyr"] = function (value) value = tonumber(value); if value >= 2020 and value <= 2030 then return true else return false end end,
    ["hgt"] = function (value) height,unit = string.match(value,"(%d+)(%a+)"); 
                               height=tonumber(height); 
                               if unit == "cm" and height >= 150 and height <=193 then return true end;
                               if unit == "in" and height >= 59 and height <=76 then return true end;
                               return false end,
    ["ecl"] = function (value) for i,v in ipairs({"amb", "blu", "brn", "gry", "grn", "hzl", "oth"}) do if value==v then return true end end return false end,
    ["pid"] = function (value) if #value == 9 then return true else return false end end
  }

  for i,v in ipairs(fields) do
    --print("Checking: ", v)
    field, fielddata = string.match(passportdata,v)
    if field ~= nil then
      if fieldrules[field](fielddata) == false then 
        return false
      end
    else
      return false
    end
  end
  return true
end

function dec4part1(...)
  local validpassports = 0
  local passportdata = ""
  for i,passportdata in ipairs(passports) do
    --print("Next: ", passportdata)
    if ispassportfieldspresent(passportdata) then validpassports = validpassports + 1 end
  end
  print("December 4 part 1: ", validpassports)
end

function dec4part2(...)
  local validpassports = 0
  local passportdata = ""
  for i,passportdata in ipairs(passports) do
    --print("Next: ", passportdata)
    if ispassportcontentsvalid(passportdata) then validpassports = validpassports + 1 end
  end
  print("December 4 part 2: ", validpassports)
end

readpassports()
dec4part1()
dec4part2()

