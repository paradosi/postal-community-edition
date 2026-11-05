local Postal = LibStub("AceAddon-3.0"):GetAddon("Postal")
local Postal_TradeBlock = Postal:NewModule("TradeBlock", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Postal")
Postal_TradeBlock.description = L["Block incoming trade requests while in a mail session."]
local IsAddOnLoadedSafe = (C_AddOns and C_AddOns.IsAddOnLoaded) or IsAddOnLoaded
local blockedByUs = false -- only undo a BlockTrades we set ourselves

function Postal_TradeBlock:OnEnable()
	if Postal.WOWBCClassic then
		self:RegisterEvent("MAIL_SHOW")
	else
		Postal_TradeBlock:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
	end
end

function Postal_TradeBlock:OnDisable()
	-- Disabling modules unregisters all events/hook automatically
	if blockedByUs then
		SetCVar("BlockTrades", 0)
		blockedByUs = false
	end
	ClosePetition()
	PetitionFrame:RegisterEvent("PETITION_SHOW")
end

-- WoW 10.0 Release Show/Hide Frame Handlers
function Postal_TradeBlock:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(eventName, ...)
	local paneType = ...
	if paneType ==  Enum.PlayerInteractionType.MailInfo then Postal_TradeBlock:MAIL_SHOW() end
end

function Postal_TradeBlock:PLAYER_INTERACTION_MANAGER_FRAME_HIDE(eventName, ...)
	local paneType = ...
	if paneType ==  Enum.PlayerInteractionType.MailInfo then Postal_TradeBlock:MAIL_CLOSED() end
end

function Postal_TradeBlock:MAIL_SHOW()
	if IsAddOnLoadedSafe("Lexan") then return end
	PetitionFrame:UnregisterEvent("PETITION_SHOW")
	-- Always listen for the close, so petitions come back even when trades
	-- were already blocked by the player's own setting
	if Postal.WOWBCClassic then
		self:RegisterEvent("MAIL_CLOSED", "Reset")
	else
		Postal_TradeBlock:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", "Reset")
	end
	self:RegisterEvent("PLAYER_LEAVING_WORLD", "Reset")
	if GetCVar("BlockTrades") == "0" then
		SetCVar("BlockTrades", 1)
		blockedByUs = true
	end
end

function Postal_TradeBlock:Reset(event, paneType)
	-- PLAYER_INTERACTION_MANAGER_FRAME_HIDE fires for every NPC window
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_HIDE" and paneType ~= Enum.PlayerInteractionType.MailInfo then return end
	if Postal.WOWBCClassic then
		self:UnregisterEvent("MAIL_CLOSED")
	else
		self:UnregisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_HIDE")
	end
	self:UnregisterEvent("PLAYER_LEAVING_WORLD")
	if blockedByUs then
		SetCVar("BlockTrades", 0)
		blockedByUs = false
	end
	ClosePetition()
	PetitionFrame:RegisterEvent("PETITION_SHOW")
end
