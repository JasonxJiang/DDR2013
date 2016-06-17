-- [ScreenGameplay] LifeP1X
function LifeP1X()
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
		return WideScale(SCREEN_CENTER_X-178,SCREEN_CENTER_X-231.5)
	else
		local mpn = GAMESTATE:GetMasterPlayerNumber();
		local bComboGraphic = ComboGraphic(mpn);
		if bComboGraphic == '2013' then
			return WideScale(SCREEN_CENTER_X-178,SCREEN_CENTER_X-231.5-9)
		else
			return WideScale(SCREEN_CENTER_X-178,SCREEN_CENTER_X-231.5)
		end
	end;
end;

-- [ScreenGameplay] LifeP2X
function LifeP2X()
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
		return WideScale(SCREEN_CENTER_X+178,SCREEN_CENTER_X+231.5)
	else
		local mpn = GAMESTATE:GetMasterPlayerNumber();
		local bComboGraphic = ComboGraphic(mpn);
		if bComboGraphic == '2013' then
			return WideScale(SCREEN_CENTER_X+178,SCREEN_CENTER_X+231.5+9)
		else
			return WideScale(SCREEN_CENTER_X+178,SCREEN_CENTER_X+231.5)
		end
	end;
end;

-- [LifeMeterBattery] BatteryP1X
function BatteryP1X()
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
		return WideScale(-6,-2)
	else
		local mpn = GAMESTATE:GetMasterPlayerNumber();
		local bComboGraphic = ComboGraphic(mpn);
		if bComboGraphic == '2013' then
			return WideScale(-6,-2+9)
		else
			return WideScale(-6,-2)
		end
	end;
end;

-- [LifeMeterBattery] BatteryP2X
function BatteryP2X()
	local style = GAMESTATE:GetCurrentStyle():GetStyleType()
	if style == "StyleType_TwoPlayersTwoSides" then
		return WideScale(-6,-2)
	else
		local mpn = GAMESTATE:GetMasterPlayerNumber();
		local bComboGraphic = ComboGraphic(mpn);
		if bComboGraphic == '2013' then
			return WideScale(-6,-2+9)
		else
			return WideScale(-6,-2)
		end
	end;
end;
