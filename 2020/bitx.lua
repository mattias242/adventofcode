function printx(x)
  print(string.format("%#010x",x))
end

x=1
i=0
while i<32 do
  x=bit32.lshift(x,1)
  printx(x)
  i = i+1
end

