local FILENAME = '/test.lua'

local github = 'https://raw.githubusercontent.com/duniyash/MCBiomePred/refs/heads/main/Turtle/test.lua'

local cacheBreak = tostring(math.random(0,0000))

res = http.get(github .. cacheBreak)
if (res == nil) then 

    print("code not retrieved")
    print("error: " .. res.getResponseCode())
    res.close()

else

    print("code retrieved")

    local newCode = res.readAll()
    
    if not (fs.exists(FILENAME)) then
        local newHarvest = fs.open(FILENAME, 'w')
        newHarvest.close()
        print("harvest file created")
    end
    
    local readFile = fs.open(FILENAME, 'r')
    local oldCode = readFile.readAll()
    
    print("old file opened")
    
    readFile.close()
    
    local file = fs.open(FILENAME, 'w')
    
    if oldCode == newCode
    then
        file.write(oldCode)
        print('NO CHANGES MADE - Same Code')
    else
        file.write(newCode)
        print('WRITING UPDATE')
        byteDiff = string.len(newCode) - string.len(oldCode)
     
        if byteDiff >= 0
        then
            print(tostring(math.abs(byteDiff)) .. ' bytes added')
        else
            print(tostring(math.abs(byteDiff)) .. ' bytes removed')
        end
    end
     
    file.close()
    res.close()
    
end
