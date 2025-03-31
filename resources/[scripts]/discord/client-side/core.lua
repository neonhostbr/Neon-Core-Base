-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vRP:Active")
AddEventHandler("vRP:Active",function(Passport,Name)
	SetDiscordAppId(1353175446300393575)
	SetDiscordRichPresenceAsset("neon")
	SetRichPresence("#"..Passport.." "..Name)
	SetDiscordRichPresenceAssetText("Neon Core")
	SetDiscordRichPresenceAssetSmall("neon")
	SetDiscordRichPresenceAssetSmallText("Neon Core")
	SetDiscordRichPresenceAction(0,"Discord","https://discord.gg/f94ZDyc48Q")
end)