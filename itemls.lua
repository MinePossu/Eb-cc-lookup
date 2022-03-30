function gib(url)
  data = http.get(url).readAll()
  return data
end

function split (inputstr, sep)
      if sep == nil then
              sep = "%s"
      end
      local t={}
      for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
              table.insert(t, str)
      end
      return t
end

--get book id for name
function bookit(fuckit, extratxt)
 id1 = split(gib(ids), "\n")
 for i = 1, #id1 do
   if tonumber(id1[i]) == fuckit then
     bkid = i
   end
 end

 --print(bkid)
 --bkid = split(gib(ids), "\n")[book.damage] --get book id
 bkname = split(gib(names), "\n")[tonumber(bkid)]

 bkname2 = ""
 for i = 2, #split(bkname, " ") do
 bkname2 = bkname2 .. " " .. split(bkname, " ")[i]
 end
 print(extratxt .. " id:" .. fuckit .. bkname2)
 --print(split(bkname, " ")[2])

 --sleep(3)
end

ids="https://raw.githubusercontent.com/MinePossu/Eb-cc-lookup/main/lazyidtable"
names="https://raw.githubusercontent.com/MinePossu/Eb-cc-lookup/main/names"

oldbooktable = {}

--new stuff
while true do
 os.queueEvent("fakeEvent");
 os.pullEvent();
 slots={}
 for x = 1, 16 do --find all with items
  cunt = turtle.getItemCount(x)
  if cunt >=1 then
   table.insert(slots, x)
  end
 end
 booktable = {}
 for xi = 1, #slots do
   turtle.select(slots[xi])
   if turtle.getItemDetail() then
     xitem = turtle.getItemDetail()
     if xitem.name ~= nil then
      --print(xitem.name)
      if string.find(xitem.name, "ebwizardry") then -- getbooks
       --print(here)
       table.insert(booktable, xitem.damage) --get ids
      end
     end
   end
 end

 sonofac = 1 --check if two tables are same
 for sonofab = 1, #booktable do
  if booktable[sonofab] ~= oldbooktable[sonofab] then
   sonofac = 0
  end
 end

 if sonofac == 0 then
  term.clear()
  term.setCursorPos(1,1)
  for dumbook = 1, #booktable do --book it
    oldbooktable = booktable
    --table.insert(oldbooktable, booktable[dumbook])
    --print(oldbooktable[dumbook])
    bookit(booktable[dumbook], dumbook)
  end
 end
end