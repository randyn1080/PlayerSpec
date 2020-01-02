PlayerSpec = {}
SLASH_REPORTSPEC1 = "/rs"
local SendAddonMessage = C_ChatInfo.SendAddonMessage
local Regi = C_ChatInfo.RegisterAddonMessagePrefix("SPC")



SlashCmdList.REPORTSPEC = function() 
    
    local str = "";
    -- local name = UnitName("player")
    local class = UnitClass("player")
    
    for i = 1, 3 do
        local id, _, desc = GetTalentTabInfo(i) -- need to break up into 3 seperate variables
        str = str .. ' ' .. id .. ' ' .. desc
    end

    str = class .. str

    SendAddonMessage("SPC",str,"GUILD")

end



function eventThing(table, event, addonChan, msg, chan, nameServ, name)

    if addonChan == "SPC" then

        tinsert(PlayerSpec,{
            [name] = msg,
            Date = date()
        })

        print(msg)
    end
  
end



local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:SetScript("OnEvent", eventThing)

-----------------------------------
--Widget/XML--
-----------------------------------

-- local UIConfig = CreateFrame("Frame","MUI_BuffFrame", UIParent, "BasicFrameTemplateWithInset");

-- UIConfig:SetSize(300, 360);
-- UIConfig:SetPoint("CENTER", UIParent, "CENTER")

-- UIConfig.title = UIConfig:CreateFontString(nil, "OVERLAY")
-- UIConfig.title:SetFontObject("GameFontHighlight")
-- UIConfig.title:SetPoint("LEFT",UIConfig.TitleBg, "LEFT",5,0)
-- UIConfig.title:SetText("MUI Buff Options");
