-- 2021
-- dec-1.lua

function readprogram(filename)
  local program={}
  for programline in io.lines(filename) do
    operator,sign,operand = string.match(programline,"(%S+) (%p?)(%d+)")
    table.insert(program,{opcode=operator,operand=tonumber(sign..operand)})
  end
  return program
end


function runprogram(programcode)
  current = 1
  accumulator = 0
  local running = true
  local steps = 0
  local executed = {}

  exceute = {
    ["nop"] = function (operand) current = current +1; return true end,
    ["acc"] = function (operand) current = current +1; accumulator = accumulator + operand; return accumulator; end,
    ["jmp"] = function (operand) current = current + operand; return current; end
  }

  max = #program
  while running and current <= max do
    v=program[current]
    if (executed[current] or 0) == 0 then
      executed[current] = 1
      exceute[v.opcode](v.operand)
      steps = steps + 1
    else
      running = false
    end
  end
  return running, acummulator
end

function printprogram(program)
  print("Program ", program)
  print(string.rep("-", 80))
  for i,v in ipairs(program) do
    print(v.opcode,v.operand)
  end
  print(string.rep("-", 80))
end

function dec8part1(file,istest,expected)
  program = readprogram(file)
  success, acummulator = runprogram(program)
  if istest then 
    assert(accumulator == expected) 
    print("December 8 part #1: ", accumulator, "(Test: ", expected, istest,")")
  else
    print("December 8 part #1: ", accumulator)
  end
end

function dec8part2(file,istest,expected)
  opcodes = {{"nop","jmp"},{"jmp","nop"}}
  for index=1,2 do
    for i,v in ipairs(program) do
      program = readprogram(file)
      if program[i].opcode == opcodes[index][1] then 
        program[i].opcode=opcodes[index][2] 
      end
      success, acummulator = runprogram(program)
      if success then break end
    end
  end
  if istest then 
    assert(accumulator == expected) 
    print("December 8 part #2: ", accumulator, "(Test: ", expected, istest,")")
  else
    print("December 8 part #2: ", accumulator)
  end
end


print("Testing")
dec8part1("input-8-test.txt",true,5)
dec8part2("input-8-test.txt", true, 8)

print("Real data")
dec8part1("input-8.txt")
dec8part2("input-8.txt")


