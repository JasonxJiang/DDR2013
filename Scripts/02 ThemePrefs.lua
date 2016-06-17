function InitUserPrefs()
	if GetUserPref("FirstReMIX_ComboUnderField") == nil then
		SetUserPref("FirstReMIX_ComboUnderField", 'false');
	end;
	if GetUserPref("FirstReMIX_JudgmentUnderField") == nil then
		SetUserPref("FirstReMIX_JudgmentUnderField", 'false');
	end;
	if GetUserPref("FirstReMIX_ShowDancingCharacters") == nil then
		SetUserPref("FirstReMIX_ShowDancingCharacters", 'true');
	end;
	if GetUserPref("FirstReMIX_DifficultyMeter") == nil then
		SetUserPref("FirstReMIX_DifficultyMeter", '20Meter');
	end;
	if PREFSMAN:GetPreference("PercentageScoring") ~= false then
		PREFSMAN:SetPreference("PercentageScoring",false);
	end
	if PREFSMAN:GetPreference("AllowW1") ~= "AllowW1_Everywhere" then
		PREFSMAN:SetPreference("AllowW1","AllowW1_Everywhere");
	end
end;

-- Screen Filter
function FirstReMIX_ScreenFilter()
	local t = {
		Name = "FirstReMIX_ScreenFilter";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = true;
		Choices = {"OFF", "DARK", "DARKER", "DARKEST", "BLUE LANE", "RED LANE", "GREEN LANE", "YELLOW LANE", "DARK LANE", "TOKIMEKI MIYUKI", "TOKIMEKI KAORI", "TOKIMEKI MIHO", "TOKIMEKI MAHO"};
--		Choices = {"OFF", "DARK", "DARKER", "DARKEST"};

		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("FirstReMIX_ScreenFilter_"..profileGUID) ~= nil then
					if GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='OFF' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARK' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARKER' then
						list[3] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARKEST' then
						list[4] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='BLUE LANE' then
						list[5] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='RED LANE' then
						list[6] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='GREEN LANE' then
						list[7] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='YELLOW LANE' then
						list[8] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='DARK LANE' then
						list[9] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='TOKIMEKI MIYUKI' then
						list[10] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='TOKIMEKI KAORI' then
						list[11] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='TOKIMEKI MIHO' then
						list[12] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..profileGUID)=='TOKIMEKI MAHO' then
						list[13] = true
					end
				else
					WritePrefToFile("FirstReMIX_ScreenFilter_"..profileGUID, 'OFF');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("FirstReMIX_ScreenFilter_"..pname) ~= nil then
					if GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='OFF' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARK' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARKER' then
						list[3] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARKEST' then
						list[4] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='BLUE LANE' then
						list[5] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='RED LANE' then
						list[6] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='GREEN LANE' then
						list[7] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='YELLOW LANE' then
						list[8] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='DARK LANE' then
						list[9] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='TOKIMEKI MIYUKI' then
						list[10] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='TOKIMEKI KAORI' then
						list[11] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='TOKIMEKI MIHO' then
						list[12] = true
					elseif GetUserPref("FirstReMIX_ScreenFilter_"..pname)=='TOKIMEKI MAHO' then
						list[13] = true 
					end
				else
					WritePrefToFile("FirstReMIX_ScreenFilter_"..pname, 'OFF');
					list[1] = true
				end;
			end;
		end;
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='OFF';
			elseif list[2] then
				val='DARK';
			elseif list[3] then
				val='DARKER';
			elseif list[4] then
				val='DARKEST';
			elseif list[5] then
				val='BLUE LANE';
			elseif list[6] then
				val='RED LANE';
			elseif list[7] then
				val='GREEN LANE';
			elseif list[8] then
				val='YELLOW LANE';
			elseif list[9] then
				val='DARK LANE';
			elseif list[10] then
				val='TOKIMEKI MIYUKI';
			elseif list[11] then
				val='TOKIMEKI KAORI';
			elseif list[12] then
				val='TOKIMEKI MIHO';
			elseif list[13] then
				val='TOKIMEKI MAHO';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_ScreenFilter_"..profileGUID, val);
			else
				WritePrefToFile("FirstReMIX_ScreenFilter_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-------------------------------------------------------------------------------
-- FastSlow
function FirstReMIX_FastSlow()
	local t = {
		Name = "FirstReMIX_FastSlow",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','On') },
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if GetUserPrefB("FirstReMIX_FastSlow_" .. profileGUID) then
					local bShow = GetUserPrefB("FirstReMIX_FastSlow_" .. profileGUID)
					if bShow then
						list[2] = true
					else
						list[1] = true
					end
				else
					list[1] = true
				end
			else
				if GetUserPrefB("FirstReMIX_FastSlow_" .. pname) then
					local bShow = GetUserPrefB("FirstReMIX_FastSlow_" .. pname)
					if bShow then
						list[2] = true
					else
						list[1] = true
					end
				else
					list[1] = true
				end
			end;
		end,
		SaveSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			local bSave = list[2] and true or false
			if PROFILEMAN:IsPersistentProfile(pn) then
				SetUserPref("FirstReMIX_FastSlow_" .. profileGUID, bSave)
			else
				SetUserPref("FirstReMIX_FastSlow_" .. pname, bSave)
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-- Combo Graphic
function FirstReMIX_ComboGraphic()
	local t = {
		Name = "FirstReMIX_ComboGraphic",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = true,
		Choices = { 'DEFAULT','1st･2nd','3rd･4th','5th','MAX・MAX2','EXTREME','SuperNOVA','SuperNOVA2','X','X2','X3','2013' },
		--Choices = { '2013' },
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("FirstReMIX_ComboGraphic_"..profileGUID) ~= nil then
					if GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='2013' then
						list[1] = true
     			    elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='1st' then
					    list[2] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='3rd' then
					    list[3] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='5th' then
					    list[4] = true
				    elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='max' then
				        list[5] = true
				    elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='extreme' then
						list[6] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='supernova1' then
					    list[7] = true
			        elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='supernova2' then
			            list[8] = true
	                elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='x1' then
						list[9] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='x2' then
						list[10] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='x3' then
						list[11] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. profileGUID)=='2013' then
						list[12] = true
					end						
				else
					WritePrefToFile("FirstReMIX_ComboGraphic_"..profileGUID, '2013');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("FirstReMIX_ComboGraphic_" .. pname) ~= nil then
					if GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='2013' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='1st' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='3rd' then
						list[3] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='5th' then
						list[4] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='max' then
						list[5] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='extreme' then
						list[6] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='supernova1' then
						list[7] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='supernova2' then
						list[8] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='x1' then
						list[9] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='x2' then
						list[10] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='x3' then
						list[11] = true
					elseif GetUserPref("FirstReMIX_ComboGraphic_" .. pname)=='2013' then
						list[12] = true
					end
				else
					WritePrefToFile("FirstReMIX_ComboGraphic_" .. pname, '2013')
					list[1] = true
				end
			end;
		end,
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='2013';
			elseif list[2] then
				val='1st';
			elseif list[3] then
				val='3rd';
			elseif list[4] then
				val='5th';
			elseif list[5] then
				val='max';
			elseif list[6] then
				val='extreme';
			elseif list[7] then
				val='supernova1';
			elseif list[8] then
				val='supernova2';
			elseif list[9] then
				val='x1';
			elseif list[10] then
				val='x2';
			elseif list[11] then
				val='x3';
			elseif list[12] then
				val='2013';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_ComboGraphic_"..profileGUID, val);
			else
				WritePrefToFile("FirstReMIX_ComboGraphic_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-- CalorieDisplay
function FirstReMIX_CalorieDisplay()
	local t = {
		Name = "FirstReMIX_CalorieDisplay";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = false;
		Choices = {THEME:GetString("OptionNames","On"),THEME:GetString("OptionNames","Off")};
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("FirstReMIX_CalorieDisplay_"..profileGUID) ~= nil then
					if GetUserPref("FirstReMIX_CalorieDisplay_" .. profileGUID)=='on' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_CalorieDisplay_" .. profileGUID)=='off' then
						list[2] = true
					else
						list[1] = true
					end						
				else
					WritePrefToFile("FirstReMIX_CalorieDisplay_"..profileGUID, 'on');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("FirstReMIX_CalorieDisplay_" .. pname) ~= nil then
					if GetUserPref("FirstReMIX_CalorieDisplay_" .. pname)=='on' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_CalorieDisplay_" .. pname)=='off' then
						list[2] = true
					else
						list[1] = true
					end
				else
					WritePrefToFile("FirstReMIX_CalorieDisplay_" .. pname, 'on')
					list[1] = true
				end
			end;
		end,
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='on';
			elseif list[2] then
				val='off';
			else
				val='on';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_CalorieDisplay_"..profileGUID, val);
			else
				WritePrefToFile("FirstReMIX_CalorieDisplay_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-- Target Score
function FirstReMIX_TargetScore()
	local t = {
		Name = "FirstReMIX_TargetScore",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','Machine'),THEME:GetString('OptionNames','Personal') },
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("FirstReMIX_TargetScore_"..profileGUID) ~= nil then
					if GetUserPref("FirstReMIX_TargetScore_" .. profileGUID)=='off' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. profileGUID)=='machine' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. profileGUID)=='personal' then
						list[3] = true
					end						
				else
					WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'off');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("FirstReMIX_TargetScore_" .. pname) ~= nil then
					if GetUserPref("FirstReMIX_TargetScore_" .. pname)=='off' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='machine' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='personal' then
						list[3] = true
					end
				else
					WritePrefToFile("FirstReMIX_TargetScore_" .. pname, 'off')
					list[1] = true
				end
			end;
		end,
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='off';
			elseif list[2] then
				val='machine';
			elseif list[3] then
				val='personal';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, val);
			else
				WritePrefToFile("FirstReMIX_TargetScore_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-- Target Score (no profile)
function FirstReMIX_TargetScore_NoProfile()
	local t = {
		Name = "FirstReMIX_TargetScore_NoProfile",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','On')},
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			if ReadPrefFromFile("FirstReMIX_TargetScore_" .. pname) ~= nil then
				if GetUserPref("FirstReMIX_TargetScore_" .. pname)=='off' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='machine' then
					list[2] = true
				elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='personal' then
					list[2] = true
				end
			else
				WritePrefToFile("FirstReMIX_TargetScore_" .. pname, 'off')
				list[1] = true
			end
		end,
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			if list[1] then
				val='off';
			elseif list[2] then
				val='machine';
			end;
			WritePrefToFile("FirstReMIX_TargetScore_"..pname, val);
		end
	}
	setmetatable(t, t)
	return t
end