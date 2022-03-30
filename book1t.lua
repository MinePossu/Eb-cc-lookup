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

--check book compatibility
function lastcheck()
if string.find(book.name, "ebwizardry") then
 print(book.name)
 bookit()
end
end
--get book id for name
function bookit()
  id1 = split(gib(ids), "\n")
  for i = 1, #id1 do
    if tonumber(id1[i]) == book.damage then
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
   print(book.damage .. bkname2)
  --print(split(bkname, " ")[2])

  --sleep(3)
end

while true do

turtle.select(1)
ids="https://raw.githubusercontent.com/MinePossu/Eb-cc-lookup/main/lazyidtable"
names="https://raw.githubusercontent.com/MinePossu/Eb-cc-lookup/main/names"


book = turtle.getItemDetail()
if book == nil then
term.clear()
term.setCursorPos(1,1)
print("waiting for eb spellbook to scan")
--print(book)
else
  --print(book.damage)
  if oldbk ~= book.damage then
    --print("here")
    term.clear()
    term.setCursorPos(1,1)
    oldbk = book.damage
    lastcheck()
  end
end
end
