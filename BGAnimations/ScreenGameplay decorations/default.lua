local t = LoadFallbackB()
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local mpn = GAMESTATE:GetMasterPlayerNumber();

-- Course Stage Save
if GAMESTATE:IsCourseMode() then
	for pn in ivalues(PlayerNumber) do
		if GAMESTATE:IsPlayerEnabled(pn) then
			-- 個別のステージ数を記録
			t[#t+1] = Def.ActorFrame {
				CurrentSongChangedMessageCommand=function(self,params)
					local cstage = getenv("CourseStage"..ToEnumShortString(pn));
				--	if GAMESTATE:GetPlayMode() == "PlayMode_Oni" and STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetFailed() then
					if STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetFailed() then
						return;
					end;
					setenv("CourseStage"..ToEnumShortString(pn),cstage+1);
				end;
			};
		end;
	end;
	-- 全体のステージ数、コースとエンドレスのカロリー用、チャレンジは個別のステージ数で判断する
	t[#t+1] = Def.ActorFrame {
		CurrentSongChangedMessageCommand=function(self,params)
			local csall = getenv("CourseStageAll");
			setenv("CourseStageAll",csall+1);
			-- エンドレスのsong用
			if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
				local estage = getenv("EndlessSong");
				local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
				-- ループ対策
				if coursestages == estage then
					setenv("EndlessSong",1);
				else
					setenv("EndlessSong",estage+1);
				end;
			end;
		end;
	};
	-- 表示チェック用
	--[[
	t[#t+1] = LoadFont("common normal") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-50+200;draworder,51;zoom,2);
		CurrentSongChangedMessageCommand=function(self,params)
			self:queuecommand("Check");
		end;
		CheckCommand=function(self,params)
			local estage = getenv("EndlessSong");
			self:settext(estage);
		end;
	};
	--]]
end;
t[#t+1] = StandardDecorationFromFileOptional("ScoreFrameP1","ScoreFrameP1");
t[#t+1] = StandardDecorationFromFileOptional("ScoreFrameP2","ScoreFrameP2");
t[#t+1] = StandardDecorationFromFileOptional("SongTitle","SongTitle");
t[#t+1] = StandardDecorationFromFileOptional("StageFrame", "StageFrame");
t[#t+1] = StandardDecorationFromFileOptional("SongFrame","SongFrame");
t[#t+1] = StandardDecorationFromFileOptional("GameOverBatteryP1","GameOverBatteryP1");
t[#t+1] = StandardDecorationFromFileOptional("GameOverBatteryP2","GameOverBatteryP2");

t[#t+1] = LoadActor("StageDisplay") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-212.5;draworder,51);
};

--　Battle Stream Frame Back
t[#t+1] = LoadActor("ScoreDisplayRave_back") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-160;draworder,5);
	Condition=GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
};

-- Battle StageFrame Back
t[#t+1] = LoadActor("ScreenGameplay_StageFrameRave") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-209.5;draworder,1);
	Condition=GAMESTATE:GetPlayMode() == 'PlayMode_Rave';
};
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------
--[[
local speed_cs={"",""};
local speed_ce={"",""};
local speed_cnt={0,0};
local scroll={false,false};
local scroll_per={0,0};
local scroll_cnt={0,0};
fn=""..PROFILEMAN:GetProfileDir('ProfileSlot_Machine').."SpeedMods.txt";
local l="";
if FILEMAN:DoesFileExist(fn) then
	local f=RageFileUtil.CreateRageFile();
	f:Open(fn,1);
	l=f:GetLine();
	f:Close();
	f:destroy();
end;
local speeds="";
if l==nil or l=="" then
	speeds="1x";
else
	speeds=split(",",l);
end;
local now_speed_t={1,1};
local now_speed_s={"nil","nil"};
local bpm_h={1,1};
for pn in ivalues(PlayerNumber) do
	t[#t+1] = Def.Quad{
		InitCommand=function(self)
			self:visible(false);
			local p=((pn=="PlayerNumber_P1") and 1 or 2);
			for i=1,#speeds do
				local modstr=GAMESTATE:GetPlayerState(pn):GetPlayerOptionsString("ModsLevel_Preferred");
				if string.find(modstr,speeds[i],0,true) then
					now_speed_t[p]=i;
					now_speed_s[p]=speeds[i];
					break;
				end;
			end;
			if now_speed_s[p]=="nil" then
				for i=1,#speeds do
					if speeds[i]=="1x" then
						now_speed_t[p]=i;
						now_speed_s[p]=speeds[i];
					end;
				end;
			end;
			local _st=GAMESTATE:GetCurrentSteps(pn);
			local _td=_st:GetTimingData();
			local bpms=_td:GetBPMs();
			bpm_h[p]=bpms[1];
			for i=1,#bpms do
				if bpms[i]>bpm_h[p] then bpm_h[p]=bpms[i]; end;
			end;
		end;
	};
end;
]]--
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--[[
-- SpeedChange
-- From speedkills by hanubeki
t[#t+1] = Def.ActorFrame {
	CodeMessageCommand = function(self, params)
		local pn = params.PlayerNumber;
		local ps = GAMESTATE:GetPlayerState(pn);
		local po = ps:GetPlayerOptions("ModsLevel_Preferred");
		local speed = po:GetXMod() or 0;
		speed = math.floor(speed * 4 + 0.5) / 4;
		local speedDelta = 0;
		if params.Name == "SpeedUp" then
			if speed == 0.25 then
				speedDelta = 0.25;
			else
				speedDelta = 0.5;
			end;
		elseif params.Name == "SpeedDown" then
			if speed == 0.5 then
				speedDelta = -0.25;
			else
				speedDelta = -0.5;
			end;
		end;
		speed = math.max(0.25, math.min(speed + speedDelta, 8.0));
		local modstring = ps:GetPlayerOptionsString("ModsLevel_Preferred");
		-- HACK: Add "default, " to prevent crash
		-- [ja] クラッシュを防ぐために「default, 」を付け加える
		modstring = "default, " .. modstring;
		modstring = modstring .. ", " .. speed .. "x";
		ps:SetPlayerOptions("ModsLevel_Preferred", modstring);
	end;
}; ]]--
 
----------------------------------------------------------------------------------------------
-- Hiddon+ test
if GAMESTATE:GetPlayMode() ~= "PlayMode_Oni" and GAMESTATE:GetPlayMode() ~= "PlayMode_Rave" then
	local HidSudVisible = {1,1}
	local HidSudVisible2 = {1,1}
	local HidSudY = {0,0}
	local HidSudY2 = {0,0}

	local IsUsingCenter1Player = PREFSMAN:GetPreference('Center1Player');
	local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
	local NumSides = GAMESTATE:GetNumSidesJoined();

	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local loadhidsud = PlayerOptionsAppearance(pn);
		local HSY = PlayerOptionsAppearance_HidSudY(pn);
		if loadhidsud == "HiddenPlus" or loadhidsud == "SuddenPlus" or loadhidsud == "HiddenSuddenPlus" then
			local p=((pn == PLAYER_1) and 1 or 2);
			local pname = ToEnumShortString(pn);
			local function XPosition()
				if IsUsingCenter1Player and NumPlayers == 1 and NumSides == 1 then return SCREEN_CENTER_X; end;
				local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
				local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
				return THEME:GetMetric("ScreenGameplay","Player".. pname .. strPlayer .. strSide .."X");
			end;
			local bComboGraphic = ComboGraphic(pn);
			t[#t+1] = Def.Sprite {
				InitCommand = function(self)
					(cmd(draworder,40;x,XPosition()))(self)
					if st == "StepsType_Dance_Double" then
						if bComboGraphic == "x2" then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Double_X2"));
						elseif bComboGraphic == 'x3' or bComboGraphic == '2013' then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Double_X3"));
						else
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Double_Default"));
						end;
					elseif st == "StepsType_Dance_Solo" then 
						if bComboGraphic == "x2" then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Solo_X2"));
						elseif bComboGraphic == 'x3' or bComboGraphic == '2013' then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Solo_X3"));
						else
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Solo_Default"));
						end;
					else
						if bComboGraphic == "x2" then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Single_X2"));
						elseif bComboGraphic == 'x3' or bComboGraphic == '2013' then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Single_X3"));
						else
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Single_Default"));
						end;
					end;
					if loadhidsud == "HiddenPlus" then
						if HSY == "Off" then
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								HidSudY[p] = 420
							else
								HidSudY[p] = -420
							end;
						else
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								-- +0を付けないと効かない
								if HSY+0 < 0 then
									HidSudY[p] = -HSY
								else
									HidSudY[p] = HSY
								end;
							else
								if HSY+0 > 0 then
									HidSudY[p] = -HSY
								else
									HidSudY[p] = HSY
								end;
							end;
						end;
					elseif loadhidsud == "SuddenPlus" then
						if HSY == "Off" then
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								HidSudY[p] = -420
							else
								HidSudY[p] = 420
							end;
						else
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								if HSY+0 > 0 then
									HidSudY[p] = -HSY
								else
									HidSudY[p] = HSY
								end;
							else
								if HSY+0 < 0 then
									HidSudY[p] = -HSY
								else
									HidSudY[p] = HSY
								end;
							end;
						end;
					elseif loadhidsud == "HiddenSuddenPlus" then
						if HSY == "Off" then
							HidSudY[p] = 420
						else
							HidSudY[p] = HSY
						end;
					end;
					self:y(SCREEN_CENTER_Y + HidSudY[p]);
				end;
				CodeMessageCommand = function(self, params)
					if params.PlayerNumber ~= pn then return end
					if params.Name == "HiddenSuddenStart" then
						if HidSudVisible[p] == 0 then
							self:diffusealpha(1);
							HidSudVisible[p] = 1;
						else
							self:diffusealpha(0);
							HidSudVisible[p] = 0;
						end;
					return end;
					if loadhidsud == "HiddenPlus" then
						if params.Name == "HiddenSuddenUp" then
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								-- +0を付けないと一番最初で合致した場合効かない
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == 0 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(-20);
								HidSudY[p] = HidSudY[p]-20
							else
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == -480 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(-20);
								HidSudY[p] = HidSudY[p]-20
							end;
						elseif params.Name == "HiddenSuddenDown" then
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == 480 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(20);
								HidSudY[p] = HidSudY[p]+20
							else
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == 0 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(20);
								HidSudY[p] = HidSudY[p]+20
							end;
						end;
					elseif loadhidsud == "SuddenPlus" then
						if params.Name == "HiddenSuddenUp" then
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == -480 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(-20);
								HidSudY[p] = HidSudY[p]-20
							else
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == 0 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(-20);
								HidSudY[p] = HidSudY[p]-20
							end;
						elseif params.Name == "HiddenSuddenDown" then
							if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == 0 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(20);
								HidSudY[p] = HidSudY[p]+20
							else
								if HidSudVisible[p] == 0 or HidSudY[p]+0 == 480 then return end;
								self:finishtweening();
								self:diffusealpha(1);
								self:linear(0.1);
								self:addy(20);
								HidSudY[p] = HidSudY[p]+20
							end;
						end;
					elseif loadhidsud == "HiddenSuddenPlus" then
						if params.Name == "HiddenSuddenUp" then
							if HidSudVisible[p] == 0 or HidSudY[p]+0 == 240 then return end;
							self:finishtweening();
							self:diffusealpha(1);
							self:linear(0.1);
							self:addy(-20);
							HidSudY[p] = HidSudY[p]-20
						elseif params.Name == "HiddenSuddenDown" then
							if HidSudVisible[p] == 0 or HidSudY[p]+0 == 480 then return end;
							self:finishtweening();
							self:diffusealpha(1);
							self:linear(0.1);
							self:addy(20);
							HidSudY[p] = HidSudY[p]+20
						end;
					end;
				end;
				OffCommand = function(self)
					if PROFILEMAN:IsPersistentProfile(pn) then
						local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
						WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_HidSudY_"..profileGUID,HidSudY[p]);
					else
						WritePrefToFile("FirstReMIX_PlayerOptionsAppearance_HidSudY_"..pname,HidSudY[p]);
					end;
				end;
			};
			t[#t+1] = Def.Sprite {
				InitCommand = function(self)
					(cmd(visible,false;draworder,40;x,XPosition()))(self)
					if st == "StepsType_Dance_Double" then
						if bComboGraphic == "x2" then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Double_X2"));
						elseif bComboGraphic == 'x3' or bComboGraphic == '2013' then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Double_X3"));
						else
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Double_Default"));
						end;
					elseif st == "StepsType_Dance_Solo" then 
						if bComboGraphic == "x2" then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Solo_X2"));
						elseif bComboGraphic == 'x3' or bComboGraphic == '2013' then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Solo_X3"));
						else
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Solo_Default"));
						end;
					else
						if bComboGraphic == "x2" then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Single_X2"));
						elseif bComboGraphic == 'x3' or bComboGraphic == '2013' then
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Single_X3"));
						else
							self:Load(THEME:GetPathB("ScreenGameplay","decorations/LaneCover_Single_Default"));
						end;
					end;
					if loadhidsud == "HiddenSuddenPlus" then
						self:visible(true);
						if HSY == "Off" then
							HidSudY2[p] = -420
						else
							HidSudY2[p] = -HSY
						end;
					end;
					self:y(SCREEN_CENTER_Y + HidSudY2[p]);
				end;
				CodeMessageCommand = function(self, params)
					if params.PlayerNumber ~= pn then return end
					if loadhidsud == "HiddenSuddenPlus" then
						if params.Name == "HiddenSuddenUp" then
							if HidSudVisible2[p] == 0 or HidSudY2[p]+0 == -240 then return end;
							self:finishtweening();
							self:diffusealpha(1);
							self:linear(0.1);
							self:addy(20);
							HidSudY2[p] = HidSudY2[p]+20
						elseif params.Name == "HiddenSuddenDown" then
							if HidSudVisible2[p] == 0 or HidSudY2[p]+0 == -480 then return end;
							self:finishtweening();
							self:diffusealpha(1);
							self:linear(0.1);
							self:addy(-20);
							HidSudY2[p] = HidSudY2[p]-20
						elseif params.Name == "HiddenSuddenStart" then
							if HidSudVisible2[p] == 0 then
								self:diffusealpha(1);
								HidSudVisible2[p] = 1;
							else
								self:diffusealpha(0);
								HidSudVisible2[p] = 0;
							end;
						end;
					end;
				end;
			};
		end;
	end;
end;
		
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) then
		local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
		-- Difficulty Frame
		t[#t+1] = LoadActor("DifficultyFrame")..{
			InitCommand=function(self)
				self:draworder(40);
			--	self:zoomx(WideScale(1,1.33));
				self:horizalign(left);
				if pn == PLAYER_1 then
					self:x(SCREEN_LEFT);
					
				--	self:zoomx(WideScale(1,1.33));
				elseif pn == PLAYER_2 then
					self:x(SCREEN_RIGHT);
					self:rotationy(180);
				--	self:zoomx(-WideScale(1,1.33));
				end;
				if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
					self:y(SCREEN_CENTER_Y-297);
					self:rotationx(180);
				elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' and CalorieDisplay(pn) == "on" then
					self:y(SCREEN_CENTER_Y+185-22);
				else
					self:y(SCREEN_CENTER_Y+275);
				end;
			end;
		};
		-- Diffculty text
		--[[
		t[#t+1] = LoadFont("_serpentinedbol 19px") .. {
		--	InitCommand=cmd(draworder,41;zoomx,WideScale(0.8,1);zoomy,0.8;horizalign,left);
			InitCommand = function(self)
				self:draworder(41);
				self:player(pn);
				if GAMESTATE:PlayerIsUsingModifier(pn,'reverse') then
					self:y(SCREEN_CENTER_Y-199-1);
				elseif GAMESTATE:GetPlayMode() == 'PlayMode_Endless' and CalorieDisplay(pn) == "on" then
					self:y(SCREEN_CENTER_Y+185-22);
				else
					self:y(SCREEN_CENTER_Y+185);
				end;
				self:zoomx(WideScale(0.8,1));
				self:zoomy(WideScale(0.64,0.8));
				if pn == PLAYER_1 then
					self:x(WideScale(SCREEN_CENTER_X-253,SCREEN_CENTER_X-335));
				else
					self:x(WideScale(SCREEN_CENTER_X+254,SCREEN_CENTER_X+336));
				end;
			end;
			OnCommand=function(self)
				local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
				self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff)));
				self:diffuse(CustomDifficultyToColor(diff));
			end;
		};
		--]]
		--[[
		-- Score Frame-------------------------------------------------------------------------- SCOREFRAME
		local bComboGraphic = ComboGraphic(pn);
		local function ScoreFramePath()
			if bComboGraphic == '2013' then
				return THEME:GetPathB('','_frame 3x1'),'ScoreFrame_2013',WideScale(186,248);
			else
				return THEME:GetPathB('','_frame 3x1'),'ScoreFrame_default',WideScale(186,250);
			end;
		end;
	--	t[#t+1] = LoadActor(THEME:GetPathB('','_frame 3x1'),'ScoreFrame_default',WideScale(186,250))..{
		t[#t+1] = LoadActor(ScoreFramePath())..{
			InitCommand=function(self)
				self:draworder(45);
				self:y(SCREEN_CENTER_Y+204);
				if pn == PLAYER_1 then
					if bComboGraphic == '2013' then
						self:x(WideScale(SCREEN_CENTER_X-225+1,SCREEN_CENTER_X-301+1));
					else
						self:x(WideScale(SCREEN_CENTER_X-225,SCREEN_CENTER_X-301));
					end;
				else
					if bComboGraphic == '2013' then
						self:x(WideScale(SCREEN_CENTER_X+225-1,SCREEN_CENTER_X+301-1));
					else
						self:x(WideScale(SCREEN_CENTER_X+225,SCREEN_CENTER_X+301));
					end;
				end;
			end;
		}; ]]--
	end;
end

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
	local ScoreMode = 'DDR SuperNOVA 2';
	
	t[#t+1] = Def.Actor {
		Condition = not GAMESTATE:IsDemonstration();
		JudgmentMessageCommand=function(self, params)
			if params.Player == pn then	
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_Invalid' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then	
					if pss:GetFailed() ~= true then
						pss:SetScore(Scoring[ScoreMode](params,pss));
					end
				end
			end
		end;
	};
end

return t