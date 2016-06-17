--[[ Typical background sizes:
320x240 - DDR 1st-Extreme, most NVLM_ZK songs
640x480 - most simfiles in distribution today are this big.
768x480 - 16:10 aspect ratio backgrounds
854x480 - pump it up pro
]]

--[[ "Most backgrounds are 640x480. Some are 768x480. Stretch the 4:3 ones."
function Actor:scale_or_crop_background()
	if (self:GetWidth() * 3) / 4 == self:GetHeight() then
		self:stretchto( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT );
	else
		self:scaletocover( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT );
	end
end
--]]

function Actor:scale_or_crop_background()
	local width = self:GetWidth();
	local height = self:GetHeight();
	local ratio = height/width;
	self:x(SCREEN_CENTER_X);
	self:y(SCREEN_CENTER_Y);
	--[[
	if ratio > 0.75 then
		self:zoomto(480/ratio,480);
	elseif ratio > 0.65 then
		self:zoomto(640,640*ratio);
	else
		self:zoomto(SCREEN_WIDTH,SCREEN_WIDTH*ratio);
	end
	--]]
	if GetScreenAspectRatio() > 1.7 then
		if ratio > 0.65 then
			self:zoomto(SCREEN_WIDTH,SCREEN_WIDTH*ratio);
		else
			self:zoomto(SCREEN_WIDTH,SCREEN_WIDTH*ratio);
		end
	else
		if ratio > 0.75 then
			self:zoomto(SCREEN_WIDTH,SCREEN_WIDTH*ratio);
		elseif ratio > 0.65 then
			self:zoomto(640,640*ratio);
		else
			self:zoomto(SCREEN_WIDTH,SCREEN_WIDTH*ratio);
		end
	end;
end
	
function Actor:zoom_to_banner()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(256,256);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(256,104);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(256,126);
	else
	-- その他、通常DDR	
		self:zoomto(256,80);
	end
end

-- zoom line
function Actor:zoom_to_banner_line()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(256,256);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(256,104);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(256,126);
	else
	-- その他、通常DDR	
		self:zoomto(256,80);
	end
end

-- コース用　ミニ表示
function Actor:zoom_to_course_banner()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(54,54);
	-- マリオ用
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(66.4,26.6);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用	
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(60,29.2);
	else
	-- その他、通常DDR
		self:zoomto(68,21.25);
	end
end

-- zoomとか使うときはこちら。ホイールはこれだと表示が崩れる
function Actor:scale_to_clip_banner()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:scaletoclipped(256,256);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:scaletoclipped(256,104);
	-- ホッテストパーティー1・2 フルフルパーティー　WinxClub DisneyGrooves用	
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:scaletoclipped(256,126);
	else
	-- その他、通常DDR	
		self:scaletoclipped(256,80);
	end
end

-- line
function Actor:scale_to_clip_banner_line()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:scaletoclipped(256,256);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:scaletoclipped(256,104);
	-- ホッテストパーティー1・2 フルフルパーティー　WinxClub DisneyGrooves用	
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:scaletoclipped(256,126);
	else
	-- その他、通常DDR	
		self:scaletoclipped(256,80);
	end
end
-------------------- strider fonction ------------
-- Zoom parameters after music select in stage information-
function Actor:banner_scale_stage_line()
	-- Banner X2 X3 2013
	if self:GetWidth() == self:GetHeight() then
		self:scaletoclipped(464,464);
	-- banner	
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:scaletoclipped(464,192);
	-- Banner from WinxClub DisneyGrooves	
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:scaletoclipped(464,230);
	else
	-- Banner old DDR	
		self:scaletoclipped(464,148);
	end
end
-- Zoom parameters after music select in stage information-
function Actor:banner_scale_stage()
	-- Banner X2 X3 2013
	if self:GetWidth() == self:GetHeight() then
		self:scaletoclipped(460,460);
	-- banner	
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:scaletoclipped(460,188);
	-- Banner from WinxClub DisneyGrooves	
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:scaletoclipped(460,226);
	else
	-- Banner old DDR	
		self:scaletoclipped(460,144);
	end
end


-- Base from Default+Jacket by A.C
-- ジャケットがないときはバナーを選択
function GetJacketBanner(song)
	local gpath;
	if song then
		if song:HasJacket() then
			gpath=song:GetJacketPath();
		elseif song:HasBanner() then
			gpath=song:GetBannerPath();
		else
			gpath=THEME:GetPathG("Common fallback","banner");
		end;
	else
		gpath=THEME:GetPathG("Common fallback","banner");
	end;
	return gpath;
end;

function GetSidePlayer(player)
	if player==PLAYER_1 then
		if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
			return PLAYER_1;
		else
			return PLAYER_2;
		end;
	else
		if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
			return PLAYER_2;
		else
			return PLAYER_1;
		end;
	end;
	return PLAYER_1;
end;

-- 20 Meter check
function TwentyMeterCheck(song,st)
	local mc;
	list = {"Difficulty_Challenge","Difficulty_Hard","Difficulty_Medium","Difficulty_Easy","Difficulty_Beginner"}
	for i,value in ipairs(list) do
		local steps = song:GetOneSteps( st, value );
		if steps ~= nil then 
			if steps:GetMeter() > 10 then
				mc = true
				break;
			-- 軽さを重視するため消しておく
			--[[
			elseif value == "Difficulty_Hard" then
				meter = GetConvertDifficulty(song,st,"Difficulty_Hard","ddr","LV100");
				-- 10段階激の公式譜面最低が20.39のCHAOSなので、念のためそれよりもポイントを3下げて対応しておく
				-- スクリプト更新、CHAOS激が18.79になったのでそれにしておく
			--	if steps:GetMeter() == 10 and meter <= 20.3-3 then
				if steps:GetMeter() == 10 and meter <= 18.7 then
					mc = true
					break;
				end;
			--]]
			else
				mc = false
			end;
		end
	end
	return mc
end;

-- DifficultyMeter
function DifficultyMeter(song,diff,st)
	local metertext;
	local steps = song:GetOneSteps(st,diff);
	local group = song:GetGroupName();
	local GetMeterGroup = ReadPrefFromFile("FirstReMIX_DifficultyMeter_"..group);
	if GetUserPref("FirstReMIX_DifficultyMeter") == "10Meter" then
		local meter = GetConvertDifficulty(song,st,diff,"test","DDR MAX10");
		if GetMeterGroup == "20Meter" then
			if steps:GetMeter() >= 15 then
				metertext = 10;
			elseif steps:GetMeter() <= 15 and meter == 10 then
				metertext = 9;
			else
				metertext = meter;
			end;
		else
			metertext = steps:GetMeter();
		end;
	elseif GetUserPref("FirstReMIX_DifficultyMeter") == "20Meter" then
		local meter = GetConvertDifficulty(song,st,diff,"test","DDR X");
		if GetMeterGroup == "10Meter" then
			if steps:GetMeter() == 10 and meter <= 15 then
				metertext = 15;
			elseif steps:GetMeter() < 10 and meter >= 15 then
				metertext = 14;
			else
				metertext = meter;
			end;
		else
			if TwentyMeterCheck(song) == true then
				metertext = steps:GetMeter();
			else
				metertext = meter;
			end;
		end;
	else
		metertext = steps:GetMeter();
	end;
	return metertext
end;

-- (c) 2006 Glenn Maynard
-- All rights reserved.
--
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, and/or sell copies of the Software, and to permit persons to
-- whom the Software is furnished to do so, provided that the above
-- copyright notice(s) and this permission notice appear in all copies of
-- the Software and that both the above copyright notice(s) and this
-- permission notice appear in supporting documentation.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
-- THIRD PARTY RIGHTS. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS
-- INCLUDED IN THIS NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT
-- OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
-- OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
-- OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-- PERFORMANCE OF THIS SOFTWARE.

