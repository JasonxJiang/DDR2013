-- Base from default

local c;
local player = Var "Player";
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local pname = ToEnumShortString(player);
local profileGUID = PROFILEMAN:GetProfile(player):GetGUID();
local ts = {0,0};

local function ShowFastSlow()
	if GAMESTATE:IsDemonstration() or (not GAMESTATE:IsSideJoined(player) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave') then
		return false
	else
		return FastSlow(player)
	end
end;
local bShowFastSlow = ShowFastSlow();

-- ComboGraphic
local bComboGraphic = ComboGraphic(player);

-- FastSlowGraphic Set
local function FastSlowGraphic()
	if bComboGraphic == '2013' then
		return THEME:GetPathG("Player","judgment/FastSlow_2013");
	elseif bComboGraphic == 'x3' then
		return THEME:GetPathG("Player","judgment/FastSlow_x3");
	else
--		return THEME:GetPathG("Player","judgment/FastSlow_x2");
		return THEME:GetPathG("Player","judgment/FastSlow_2013");
	end;
end;
local bFastSlowGraphic = FastSlowGraphic();

local JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "default_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "default_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "default_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "default_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "default_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "default_JudgmentMissCommand" );
--	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "2013_JudgmentW1Command" );
--	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "2013_JudgmentW2Command" );
--	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "2013_JudgmentW3Command" );
--	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "2013_JudgmentW4Command" );
--	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "2013_JudgmentW5Command" );
--	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "2013_JudgmentMissCommand" );
};

local JudgeCmdsPlayer = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", bComboGraphic.."_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", bComboGraphic.."_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", bComboGraphic.."_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", bComboGraphic.."_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", bComboGraphic.."_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", bComboGraphic.."_JudgmentMissCommand" );
	---------------------------------------------------------------------------------------------------
	--[[TapNoteScore_W1 = THEME:GetMetric( "Judgment","2013_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment","2013_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment","2013_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment","2013_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment","2013_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment","2013_JudgmentMissCommand" );]]--
};

local TargetScore_JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "TargetScore_default_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "TargetScore_default_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "TargetScore_default_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "TargetScore_default_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "TargetScore_default_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "TargetScore_default_JudgmentMissCommand" );
	---------------------------------------------------------------------------------------------------------
	--[[TapNoteScore_W1 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentMissCommand" );]]--
};

local TargetScore_JudgeCmdsPlayer = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "TargetScore_"..bComboGraphic.."_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment",  "TargetScore_"..bComboGraphic.."_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment",  "TargetScore_"..bComboGraphic.."_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment",  "TargetScore_"..bComboGraphic.."_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment",  "TargetScore_"..bComboGraphic.."_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment",  "TargetScore_"..bComboGraphic.."_JudgmentMissCommand" );
	----------------------------------------------------------------------------------------------------------------
	--[[TapNoteScore_W1 = THEME:GetMetric( "Judgment", "TargetScore_2013_JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment",  "TargetScore_2013_JudgmentMissCommand" );]]--
};

local TNSFrames = {
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 1;
	TapNoteScore_W3 = 2;
	TapNoteScore_W4 = 3;
	TapNoteScore_W5 = 4;
	TapNoteScore_Miss = 5;
};

local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	InitCommand = function(self)
		c = self:GetChildren();
	end;
	LifeChangedMessageCommand=function(self,params)
		if params.Player ~= player then return end;
		if params.LivesLeft == 0 then
			self:visible(false);
		else
			self:visible(true);
		end;
	end;

	Def.Sprite {
		Name="Judgment";
		InitCommand=function(self)
			self:pause();
			self:visible(false);
			if GAMESTATE:IsDemonstration() or (not GAMESTATE:IsSideJoined(player) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave') then
				self:Load(THEME:GetPathG("Player","judgment/_judgment_default"));
			--	self:Load(THEME:GetPathG("Player","judgment/_judgment_2013"));
			else
				self:Load(THEME:GetPathG("Player","judgment/_judgment_".. bComboGraphic));
--				self:Load(THEME:GetPathG("Player","judgment/_judgment_2013"));
			end;
		end;
		OnCommand=THEME:GetMetric("Judgment","JudgmentOnCommand");
		ResetCommand=cmd(finishtweening;stopeffect;visible,false);
		JudgmentMessageCommand=function(self, params)
			if params.Player ~= player then return end;
			if params.HoldNoteScore then return end;
			local iFrame = TNSFrames[params.TapNoteScore];
			if not iFrame then return end
			self:playcommand("Reset");
			self:visible( true );
			self:setstate( iFrame );
			if GAMESTATE:IsDemonstration() or (not GAMESTATE:IsSideJoined(player) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave') then
				JudgeCmds[params.TapNoteScore](c.Judgment);
			else
				JudgeCmdsPlayer[params.TapNoteScore](c.Judgment);
			end
		end;
	};
};

-- FastSlow
if bShowFastSlow then
	t[#t+1] = Def.Sprite {
		InitCommand=function(self)
			self:horizalign(left);
			self:vertalign(bottom);
			self:diffusealpha(0);
			self:animate(false);
			self:Load(bFastSlowGraphic);
			if GAMESTATE:PlayerIsUsingModifier(player,'reverse') then
				self:y(-127);
			else
				self:y(77);
			end;
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			if params.LivesLeft == 0 then
				self:visible(false);
			else
				self:visible(true);
			end;
		end;
		JudgmentMessageCommand=function(self, params)
			if params.Player ~= player then return end;
			if params.TapNoteScore == 'TapNoteScore_W1' or params.TapNoteScore == 'TapNoteScore_W5' or params.TapNoteScore == 'TapNoteScore_Miss' or params.TapNoteScore == 'TapNoteScore_HitMine' or params.HoldNoteScore then return end;
			self:finishtweening();
			if params.Early then
				self:setstate(0);
			else
				self:setstate(1);
			end
			self:queuecommand("Move");
		end;
		-- x軸の移動ズレ防止のためにひとつコマンドを挟む
		MoveCommand=function(self)
			self:diffusealpha(1);
			self:zoom(1.33);
			self:linear(0.05);
			self:zoom(1);
			self:sleep(0.5);
			self:diffusealpha(0);
		end;
		ComboCommand=function(self, params)
			if not params.Combo then return end;
			local iCombo = params.Combo;
			if iCombo then
				if bComboGraphic == 'default' then
				    if iCombo > 9999 then
						self:x(51-5);
					elseif iCombo > 999 then
						self:x(43-5);
					elseif iCombo > 99 then
						self:x(40-5);
					elseif iCombo > 89 then
						self:x(14-5);
					elseif iCombo > 79 then
						self:x(12-5);
					elseif iCombo > 69 then
						self:x(10-5);
					elseif iCombo > 59 then
						self:x(8-5);
					elseif iCombo > 49 then
						self:x(6-5);
					elseif iCombo > 39 then
						self:x(4-5);
					elseif iCombo > 29 then
						self:x(2-5);
					elseif iCombo > 19 then
						self:x(0-5);
					elseif iCombo > 9 then
						self:x(-2-5);
					else
						self:x(-9-5);
--[[				if iCombo > 9999 then
						self:x(42);
					elseif iCombo > 999 then
						self:x(25);
					elseif iCombo > 99 then
						self:x(7);
					elseif iCombo > 89 then
						self:x(-11);
					elseif iCombo > 79 then
						self:x(-12);
					elseif iCombo > 69 then
						self:x(-13);
					elseif iCombo > 59 then
						self:x(-14);
					elseif iCombo > 49 then
						self:x(-15);
					elseif iCombo > 39 then
						self:x(-17);
					elseif iCombo > 29 then
						self:x(-18);
					elseif iCombo > 19 then
						self:x(-19);
					elseif iCombo > 9 then
						self:x(-20);
					else
						self:x(-33);]]--
					end; 
				elseif bComboGraphic == '1st' then
					if iCombo > 9999 then
						self:x(41);
					elseif iCombo > 999 then
						self:x(24);
					else
						self:x(0);
					end;
				elseif bComboGraphic == '3rd' then
					if iCombo > 9999 then
						self:x(36);
					elseif iCombo > 999 then
						self:x(19);
					else
						self:x(4);
					end;
				elseif bComboGraphic == '5th' then
					if iCombo > 9999 then
						self:x(44);
					elseif iCombo > 999 then
						self:x(27);
					else
						self:x(4);
					end;
				elseif bComboGraphic == 'max' then
					if iCombo > 9999 then
						self:x(26);
					elseif iCombo > 999 then
						self:x(4);
					else
						self:x(4);
					end;
				elseif bComboGraphic == 'extreme' then
					if iCombo > 9999 then
						self:x(17);
					elseif iCombo > 999 then
						self:x(4);
					else
						self:x(4);
					end;
				elseif bComboGraphic == 'supernova1' then
					if iCombo > 9999 then
						self:x(51);
					elseif iCombo > 999 then
						self:x(33);
					elseif iCombo > 99 then
						self:x(25);
					elseif iCombo > 89 then
						self:x(-1);
					elseif iCombo > 79 then
						self:x(-2);
					elseif iCombo > 69 then
						self:x(-3);
					elseif iCombo > 59 then
						self:x(-4);
					elseif iCombo > 49 then
						self:x(-5);
					elseif iCombo > 39 then
						self:x(-6);
					elseif iCombo > 29 then
						self:x(-7);
					elseif iCombo > 19 then
						self:x(-8);
					elseif iCombo > 9 then
						self:x(-9);
					else
						self:x(-23.5);
					end;
				elseif bComboGraphic == 'supernova2' then
					if iCombo > 9999 then
						self:x(49);
					elseif iCombo > 999 then
						self:x(31);
					elseif iCombo > 99 then
						self:x(24);
					elseif iCombo > 89 then
						self:x(-2);
					elseif iCombo > 79 then
						self:x(-3);
					elseif iCombo > 69 then
						self:x(-4);
					elseif iCombo > 59 then
						self:x(-5);
					elseif iCombo > 49 then
						self:x(-6);
					elseif iCombo > 39 then
						self:x(-8);
					elseif iCombo > 29 then
						self:x(-9);
					elseif iCombo > 19 then
						self:x(-10);
					elseif iCombo > 9 then
						self:x(-11);
					else
						self:x(-26);
					end;
				elseif bComboGraphic == 'x1' then
					if iCombo > 9999 then
						self:x(41);
					elseif iCombo > 999 then
						self:x(36);
					elseif iCombo > 99 then
						self:x(26);
					elseif iCombo > 89 then
						self:x(-2);
					elseif iCombo > 79 then
						self:x(-3);
					elseif iCombo > 69 then
						self:x(-4);
					elseif iCombo > 59 then
						self:x(-5);
					elseif iCombo > 49 then
						self:x(-7);
					elseif iCombo > 39 then
						self:x(-8);
					elseif iCombo > 29 then
						self:x(-9);
					elseif iCombo > 19 then
						self:x(-10);
					elseif iCombo > 9 then
						self:x(-11);
					else
						self:x(-27);
					end;
				elseif bComboGraphic == 'x2' then
					if iCombo > 9999 then
						self:x(43);
					elseif iCombo > 999 then
						self:x(36);
					elseif iCombo > 99 then
						self:x(40);
					elseif iCombo > 89 then
						self:x(14);
					elseif iCombo > 79 then
						self:x(12);
					elseif iCombo > 69 then
						self:x(10);
					elseif iCombo > 59 then
						self:x(8);
					elseif iCombo > 49 then
						self:x(6);
					elseif iCombo > 39 then
						self:x(4);
					elseif iCombo > 29 then
						self:x(2);
					elseif iCombo > 19 then
						self:x(0);
					elseif iCombo > 9 then
						self:x(-2);
					else
						self:x(-10);
					end;
				elseif bComboGraphic == 'x3' then
					if iCombo > 9999 then
						self:x(51);
					elseif iCombo > 999 then
						self:x(43);
					elseif iCombo > 99 then
						self:x(40);
					elseif iCombo > 89 then
						self:x(14);
					elseif iCombo > 79 then
						self:x(12);
					elseif iCombo > 69 then
						self:x(10);
					elseif iCombo > 59 then
						self:x(8);
					elseif iCombo > 49 then
						self:x(6);
					elseif iCombo > 39 then
						self:x(4);
					elseif iCombo > 29 then
						self:x(2);
					elseif iCombo > 19 then
						self:x(0);
					elseif iCombo > 9 then
						self:x(-2);
					else
						self:x(-9);
					end;
				elseif bComboGraphic == '2013' then
					if iCombo > 9999 then
						self:x(51-5);
					elseif iCombo > 999 then
						self:x(43-5);
					elseif iCombo > 99 then
						self:x(40-5);
					elseif iCombo > 89 then
						self:x(14-5);
					elseif iCombo > 79 then
						self:x(12-5);
					elseif iCombo > 69 then
						self:x(10-5);
					elseif iCombo > 59 then
						self:x(8-5);
					elseif iCombo > 49 then
						self:x(6-5);
					elseif iCombo > 39 then
						self:x(4-5);
					elseif iCombo > 29 then
						self:x(2-5);
					elseif iCombo > 19 then
						self:x(0-5);
					elseif iCombo > 9 then
						self:x(-2-5);
					else
						self:x(-9-5);
					end;
				end;

			end;
		end
	};
end

-- TargetScore
local bTargetScore = TargetScore(player);

if not GAMESTATE:IsDemonstration() and not GAMESTATE:IsCourseMode() and GAMESTATE:GetPlayMode() == 'PlayMode_Regular' and bTargetScore ~= "off" then

	local bEXScore = EXScore(player);
		
	-- Load HighScore List
	local function GetMachinePersonalHighScores()
		local profile;
		if bTargetScore == "personal" then
			if PROFILEMAN:IsPersistentProfile(player) then
				profile = PROFILEMAN:GetProfile(player);
			else
				profile = PROFILEMAN:GetMachineProfile();
			end;
		else
			profile = PROFILEMAN:GetMachineProfile();
		end;
		local song = GAMESTATE:GetCurrentSong()
		local diff = GAMESTATE:GetCurrentSteps(player):GetDifficulty()
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
		assert(scorelist);
		return scorelist:GetHighScores();
	end;

	local p=((player == PLAYER_1) and 1 or 2);

	local steps = GAMESTATE:GetCurrentSteps(player);
	local rv = steps:GetRadarValues(player);
	local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(player);
	local maxsteps = math.max(rv:GetValue('RadarCategory_TapsAndHolds')
	+rv:GetValue('RadarCategory_Holds')+rv:GetValue('RadarCategory_Rolls'),1);

	local scores = GetMachinePersonalHighScores(player);
	assert(scores);
	local topscore=0;
	if scores[1] then
	--	local song = GAMESTATE:GetCurrentSong()
	--	local diff = GAMESTATE:GetCurrentSteps(player):GetDifficulty()
	--	local steps = song:GetOneSteps( st, diff );
		for i = 1, #scores do
			if scores[i] then
				--[[
				local topscore2;
				if bEXScore == "On" then
					topscore2 = GetEXScore(scores[i]);
				else
					topscore2 = GetSN2Score(player,steps,scores[i]);
				end;
				--]]
				local topscore2 = GetNormalScore(maxsteps,scores[i],player);
			--	local topscore2 = GetSN2Score(player,steps,scores[i]);
				if topscore2 > topscore then
					topscore = topscore2;
				end;
			else
				break;
			end;
		end;
	--	topscore = GetSN2Score(player,steps,scores[1]);
	end;
	assert(topscore);
			
	local moto = topscore/maxsteps;
	
	-- ScreenEvaluation用のセーブ
	setenv("TopScoreSave"..pname,topscore);
	
	t[#t+1] = Def.ActorFrame {
		LifeChangedMessageCommand=function(self,params)
			if params.Player ~= player then return end;
			if params.LivesLeft == 0 then
				self:visible(false);
			else
				self:visible(true);
			end;
		end;
		LoadFont("_Bolster 16px") .. {
			InitCommand=function(self)
				self:x(48);
				self:y(29);
				(cmd(horizalign,right;strokecolor,color("#000000")))(self)
			end;
			JudgmentMessageCommand=function(self,params)
				if params.Player ~= player then return end;
				if params.HoldNoteScore then 
					self:visible(false);
				else
					self:visible(true);
				end;
			--	if topscore == 0 then return end;
				self:finishtweening();
				if params.TapNoteScore and
				   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
				   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
				   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
				   params.TapNoteScore ~= 'TapNoteScore_None'
				then
					local ret=0;
					local w1=pss:GetTapNoteScores('TapNoteScore_W1');
					local w2=pss:GetTapNoteScores('TapNoteScore_W2');
					local w3=pss:GetTapNoteScores('TapNoteScore_W3');
					local hd=pss:GetHoldNoteScores('HoldNoteScore_Held');
					if params.HoldNoteScore=='HoldNoteScore_Held' then
						hd=hd+1;
					elseif params.TapNoteScore=='TapNoteScore_W1' then
						w1=w1+1;
					elseif params.TapNoteScore=='TapNoteScore_W2' then
						w2=w2+1;
					elseif params.TapNoteScore=='TapNoteScore_W3' then
						w3=w3+1;
					end;
					
					if bEXScore == "On" then
						ret = w1*3 + w2*2 + w3;
						ts[p] = ts[p] + moto
						local last = math.round((ret-ts[p]));
						if last > 0 then
						--	self:diffuse(color("#66ccff"));
							self:diffuse(color("#8a97ee"));
							self:settext("+"..last);
						elseif last < 0 then
						--	self:diffuse(color("#ff6699"));
							self:diffuse(color("#ff89b1"));
							self:settext(last);
						else
							self:diffuse(color("#ffffff"));
							self:settext("0");
						end;
					else
						ret=(math.round((w1 + w2 + w3/2 + hd) *100000/maxsteps-(w2 + w3))*10);
						ts[p] = ts[p] + moto
						local last = math.round((ret-ts[p])*0.1);
						if last > 0 then
						--	self:diffuse(color("#66ccff"));
							self:diffuse(color("#8a97ee"));
							self:settext("+"..last*10);
						elseif last < 0 then
						--	self:diffuse(color("#ff6699"));
							self:diffuse(color("#ff89b1"));
							self:settext(last*10);
						else
							self:diffuse(color("#ffffff"));
							self:settext("0");
						end;
					end;
					
					--[[
					ret=(math.round((w1 + w2 + w3/2 + hd) *100000/maxsteps-(w2 + w3))*10);
					
					ts[p] = ts[p] + moto
					local last = math.round((ret-ts[p])*0.1);
					if last > 0 then
					--	self:diffuse(color("#66ccff"));
						self:diffuse(color("#8a97ee"));
						self:settext("+"..last*10);
					elseif last < 0 then
					--	self:diffuse(color("#ff6699"));
						self:diffuse(color("#ff89b1"));
						self:settext(last*10);
					else
						self:diffuse(color("#ffffff"));
						self:settext("0");
					end;
					--]]
					if GAMESTATE:IsDemonstration() or (not GAMESTATE:IsSideJoined(player) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave') then
						TargetScore_JudgeCmds[params.TapNoteScore](self)
					else
						TargetScore_JudgeCmdsPlayer[params.TapNoteScore](self)
					end
				end;
			end;
		};
	};
else
	setenv("TopScoreSave"..pname,0);
end;

return t;