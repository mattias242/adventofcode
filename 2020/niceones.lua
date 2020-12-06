-- niceones.lua

function printtable(tbl)
  print(string.rep("-",80))
  for k,v in pairs(tbl) do
    print(k,v)
  end
  print(string.rep("-",80))
end

