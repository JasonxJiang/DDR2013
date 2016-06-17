local t = LoadFallbackB();
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local GetCurLanguage = THEME:GetCurLanguage();

if ShowStandardDecoration("StepsDisplay") then
	for pn in ivalues(PlayerNumber) do
		local t2 = Def.StepsDisplay {
			InitCommand=cmd(Load,"StepsDisplayEvaluation",pn;SetFromGameState,pn;);
			UpdateNetEvalStatsMessageCommand=function(self,param)
				if GAMESTATE:IsPlayerEnabled(pn) then
					self:SetFromSteps(param.Steps)
				end;
			end;
		};
		t[#t+1] = StandardDecorationFromTable( "StepsDisplay" .. ToEnumShortString(pn), t2 );
	end
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "MachineRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "MachineRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
			if CalorieDisplay(pn) == "off" and TargetScore(pn) == "off" then
				self:addy(-35); 
			end;
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PersonalRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PersonalRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
			if CalorieDisplay(pn) == "off" and TargetScore(pn) == "off" then
				self:addy(-35); 
			end;
		end;
	};
end
---------- SCORE MISS-----------------------
-- Almost + miss test
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) then
		t[#t+1] = LoadFont("ScreenEvaluation JudgmentLineNumber") .. {
			InitCommand=cmd(y,SCREEN_TOP+507;strokecolor,color("#000000");diffusealpha,0;sleep,0.25;diffusealpha,1;zoom,1.15);
			OnCommand=function(self)
				local pss;
				if (Var "LoadingScreen") == "ScreenEvaluationNormal" or (Var "LoadingScreen") == "ScreenEvaluationRave" then
					pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
				elseif (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
					pss = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn);
				else
					return;
				end;
				local w5 = pss:GetTapNoteScores('TapNoteScore_W5');
				local miss = pss:GetTapNoteScores('TapNoteScore_Miss');
				if GAMESTATE:IsCourseMode() or (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
					self:settextf("%5i",w5+miss);
				else
					self:settextf("%4i",w5+miss);
				end;
				if pn == PLAYER_1 then
					self:x(SCREEN_CENTER_X-128);
					self:horizalign(right);
				else
					self:x(SCREEN_CENTER_X+128);	
					self:horizalign(left);
				end;
			end;
			OffCommand=cmd(diffusealpha,0);
		};
	end;
end

if not GAMESTATE:IsCourseMode() and not GAMESTATE:IsEventMode() then
	-- Long or Marathon save, not Eventmode only.
	-- GAMESTATE:GetCurrentStage() ではロングとマラソンが記録されていないため対応する
	local song = GAMESTATE:GetCurrentSong()
	local UseLongMarathonStage = getenv("GetUseLongMarathonStage");
	if song:IsLong() then
		UseLongMarathonStage = UseLongMarathonStage+1;
	elseif song:IsMarathon() then
		UseLongMarathonStage = UseLongMarathonStage+2;
	end;
	setenv("GetUseLongMarathonStage",UseLongMarathonStage);
	--Extra Stage Text
	if GAMESTATE:HasEarnedExtraStage() then
		t[#t+1] = Def.ActorFrame {
			InitCommand=cmd(draworder,105);
			-- Text
			LoadFont("_arial normal 24px") .. {
				InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+270;diffusealpha,0;zoom,1;strokecolor,color("#000000"));
				OnCommand=function(self)
					if GAMESTATE:IsExtraStage() then
						self:settext("TRY EXTRA STAGE!!");
					elseif GAMESTATE:IsExtraStage2() then
						self:settext("TRY ENCORE EXTRA STAGE!!");
					else
						return;
					end;
					(cmd(sleep,1.5;linear,0.25;diffusealpha,1))(self)
				end;
				OffCommand=cmd(linear,0.25;diffusealpha,0);
			};
			-- Sound
			LoadActor( THEME:GetPathS("ScreenEvaluation","try extra1" ) ) .. {
				OnCommand=cmd(play);
			};
		};
	end;
end;

-- TargetScore Test
for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) then
		if not GAMESTATE:IsCourseMode() and GAMESTATE:GetPlayMode() == 'PlayMode_Regular' and TargetScore(pn) ~= "off"
			and not ((Var "LoadingScreen") == "ScreenEvaluationSummary" or (Var "LoadingScreen") == "ScreenEvaluationSummaryRave" or (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave") then

			local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
			local gettopscore = getenv("TopScoreSave"..ToEnumShortString(pn));
		--	local gettopscore = 1000000*0.7;
		--	local score = pss:GetScore();
		
			local song = GAMESTATE:GetCurrentSong()
			local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
			local steps = song:GetOneSteps( st, diff );	
			local radar = steps:GetRadarValues(pn);
			local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);

			local score = GetEvaScore(maxsteps,pss,pn);
			
		--	local score = 1000000*0.7;
			local last = score - gettopscore;
		--	local last = 0;
		--	if gettopscore ~= nil then
		--		last = score-gettopscore;
		--	end;

			t[#t+1] = Def.ActorFrame {
				InitCommand=cmd(player,pn);
				OnCommand=function(self)
					if pn == PLAYER_1 then
					self:zoom(1.15);
						self:x(SCREEN_CENTER_X-336);
					else
					self:zoom(1.15);
						self:x(SCREEN_CENTER_X+336);
					end;
					if GetCurLanguage == "ja" then
						if CalorieDisplay(pn) == "on" then
							if GAMESTATE:IsEventMode() then
								self:y(SCREEN_CENTER_Y+68);
							else
								self:y(SCREEN_CENTER_Y+68);
							end;
						else
							self:y(SCREEN_CENTER_Y+93);
						end;
					else
						if CalorieDisplay(pn) == "on" then
							if GAMESTATE:IsEventMode() then
								self:y(SCREEN_CENTER_Y+43-9);
								self:zoomy(0.8);
							else
								self:y(SCREEN_CENTER_Y+57);
							end;
						else
							self:y(SCREEN_CENTER_Y+93);
						end;
					end;
				end;
				OffCommand=cmd(diffusealpha,0;zoom,0);
				-- Back
				Def.Sprite {
					InitCommand=function(self)
						if pn == PLAYER_1 then
							self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_Back_P1"));
						else
							self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_Back_P2"));
						end;
						self:zoomx(WideScale(0.9,1));
					end;
					OnCommand=cmd(diffusealpha,0;sleep,0.25;diffusealpha,1);
				};
				-- Text TARGET SCORE BAR GREY
				Def.Sprite {
					InitCommand=function(self)
						self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_Text"));
						self:x(WideScale(9,0));
					end;
					OnCommand=cmd(diffusealpha,0;sleep,0.25;diffusealpha,1);
				};
				-- TargetScore
				Def.ActorFrame {
					InitCommand=function(self)
					end;
					OnCommand=function(self)
						if gettopscore == score then
							if score == 0 then
								self:y(30);
							else
								self:y(8);
								self:sleep(1.5);
								self:linear(0.5);
								self:y(8+9);
							end;
						elseif gettopscore == 0 then
							self:y(30);
						else
							self:y(8);
						end;
					end;
					LoadActor("TargetScore_Target_Back")..{
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:zoomx(WideScale(0.9,1));
							else
								self:zoomx(WideScale(-0.9,-1));
							end;
						end;
						OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
					};
					LoadActor("TargetScore_Target_Text")..{
						OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
					};
				};
				-- Player
				Def.ActorFrame {
					InitCommand=function(self)
						if gettopscore == score then
							if score == 0 then
								self:y(12);
							else
								self:y(30);
								self:sleep(1.5);
								self:linear(0.5);
								self:y(-1);
							end;
						elseif gettopscore == 0 then
							self:y(12);
							self:sleep(1.5);
							self:linear(0.5);
							if score == 0 then
								self:y(12);
							elseif score < 160000 then
								self:y(12-4);
							else
								self:y(12-(26*score*0.000001));
							end;
						elseif gettopscore < score then
							self:y(30);
							self:sleep(1.5);
							self:linear(0.5);
							self:y(-14);
						else
							self:y(30);
						end;
					end;
					-- Player Back
					Def.Sprite {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_P1_Back"));
							else
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_P2_Back"));
							end;
							self:zoomx(WideScale(0.9,1));
						end;
						OnCommand=function(self)
							self:diffusealpha(0);
							self:sleep(0.25);
							self:linear(0.25);
							self:diffusealpha(1);
							if gettopscore == 0 then
								if score ~= 0 then
									self:sleep(1.5);
									self:glow(color("1,1,1,0"));
									self:linear(0.125);
									self:glow(color("1,1,1,0.5"));
									self:linear(0.125);
									self:glow(color("1,1,1,0"));
								end;
							elseif gettopscore < score then
								self:sleep(1);
								self:linear(0.25);
								self:zoomx(WideScale(0.99,1.1));
								self:zoomy(1.1);
								self:linear(0.25);
								self:zoomx(WideScale(0.9,1));
								self:zoomy(1);
								self:glow(color("1,1,1,0"));
								self:linear(0.125);
								self:glow(color("1,1,1,0.5"));
								self:linear(0.125);
								self:glow(color("1,1,1,0"));
							end;
						end;
					};
					-- Player Text
					Def.Sprite {
						InitCommand=function(self)
							if pn == PLAYER_1 then
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_P1_Text"));
							else
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/TargetScore_P2_Text"));
							end;
						end;
						OnCommand=function(self)
							self:diffusealpha(0);
							self:sleep(0.25);
							self:linear(0.25);
							self:diffusealpha(1);
							if gettopscore == 0 then
								if score ~= 0 then
									self:sleep(1.5);
									self:glow(color("1,1,1,0"));
									self:linear(0.125);
									self:glow(color("1,1,1,0.5"));
									self:linear(0.125);
									self:glow(color("1,1,1,0"));
								end;
							elseif gettopscore < score then
								self:sleep(1);
								self:linear(0.25);
								self:zoom(1.1);
								self:linear(0.25);
								self:zoom(1);
								self:glow(color("1,1,1,0"));
								self:linear(0.125);
								self:glow(color("1,1,1,0.5"));
								self:linear(0.125);
								self:glow(color("1,1,1,0"));
							end;
						end;
					};
				};
				-- TargetScore Text
				Def.ActorFrame {
					InitCommand=function(self)
						if gettopscore == score then
							if score == 0 then
								self:y(8);
							else
								self:y(8+9);
							end;
						elseif gettopscore == 0 then
							self:y(8);
						else
							self:y(8);
						end;
						self:x(WideScale(-9,0));
					end;
					LoadFont("_Bolster 16px") .. {
						InitCommand=function(self)
							self:x(90);
							self:zoom(0.8);
							self:horizalign(right);
							self:strokecolor(color("#000000"));
						end;
						OnCommand=function(self)
							if last > 0 then
								self:y(-40);
								self:diffuse(color("#00ffff"));
								self:settext("+"..last);
							elseif last < 0 then
								self:y(-40);
								self:diffuse(color("#ff0000"));
								self:settext(last);
							else
								self:y(-40);
								self:diffuse(color("#ffffff"));
								self:settext("0");
							end;
							self:diffusealpha(0);
							self:sleep(2.35);
							self:diffusealpha(1);
						end;
					};
				};
			};
		end;
	end;
end;

-- Calorie test
for pn in ivalues(PlayerNumber) do
	if CalorieDisplay(pn) == "on" and not ((Var "LoadingScreen") == "ScreenEvaluationSummary" or (Var "LoadingScreen") == "ScreenEvaluationSummaryRave") then
		t[#t+1] = Def.ActorFrame {
			InitCommand=cmd(player,pn;y,SCREEN_CENTER_Y+155;draworder,105);
			OnCommand=function(self)
				if pn == PLAYER_1 then
				    self:zoom(1.15);
					self:x(SCREEN_CENTER_X-336);
				else
				self:zoom(1.15);
					self:x(SCREEN_CENTER_X+336);
				end;
				-- 英語のコースでは圧縮＋移動する
				if GAMESTATE:IsCourseMode() and GetCurLanguage ~= "ja" then
					self:addy(8);
					self:zoomy(0.8);
				end;
				-- 英語でターゲットスコア使用時も圧縮＋移動する
				if not GAMESTATE:IsCourseMode() and TargetScore(pn) ~= "off" and GetCurLanguage ~= "ja" then
					self:addy(9);
					self:zoomy(0.8);
				end;
			end;
			OffCommand=cmd(diffusealpha,0);
			-- Back
			Def.Sprite {
				InitCommand=function(self)
					local Language;
					if GetCurLanguage == "ja" then
						Language = "jp";
					else
						Language = "en";
					end;
					if GAMESTATE:IsEventMode() then
						self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Kcal_back_1_"..Language));
					else
						if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
							if PROFILEMAN:IsPersistentProfile(pn) then
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Kcal_back_2_"..Language));
							else
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Kcal_back_1_"..Language));
							end;
						else
							if GAMESTATE:IsCourseMode() then
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Kcal_back_3_"..Language));
								self:zoomy(1.3)
							else
								self:Load(THEME:GetPathB("ScreenEvaluation","decorations/Kcal_back_1_"..Language));
							end;
						end;
					end
					if pn == PLAYER_1 then
						self:zoomx(WideScale(0.9,1));
					else
						self:zoomx(WideScale(-0.9,-1));
					end;
				end;
				OnCommand=cmd(diffusealpha,0;sleep,0.25;diffusealpha,1);
			};
			-- Normal Calorie
			LoadFont("_RussellSquare 24px") .. {
				InitCommand=cmd(zoom,0.5);
				OnCommand=function(self)
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
					local CaloriesBurned = pss:GetCaloriesBurned();
					local kcal_1 = CaloriesBurned;
					local kcal_2 = (CaloriesBurned*100)%100;
					self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."　　".."%3i"..".".."%02d".."kcal",kcal_1,kcal_2);
					if GetCurLanguage == "ja" then
						if GAMESTATE:IsEventMode() then
							if PROFILEMAN:IsPersistentProfile(pn) then
								self:x(103);
							else
								self:x(100);
							end;
							self:y(4);
							self:horizalign(right);
						else
							if GAMESTATE:IsCourseMode() then
								if PROFILEMAN:IsPersistentProfile(pn) then
									self:x(103);
								else
									self:x(100);
								end;
								self:y(4);
								self:horizalign(right);
							else
								self:visible(false);
							end;
						end;
					else
						if GAMESTATE:IsEventMode() then
							self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."\n　　".."%3i"..".".."%02d".."kcal",kcal_1,kcal_2);
							self:y(-27);
							self:vertspacing(5);
						else
							if GAMESTATE:IsCourseMode() then
								self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."\n　　".."%3i"..".".."%02d".."kcal",kcal_1,kcal_2);
								self:y(-37);
								self:vertspacing(5);
							else
								self:visible(false);
							end;
						end;
					end;
				end;
				BeginCommand=cmd(diffusealpha,0;sleep,0.25;diffusealpha,1);
			};
			-- Average Calorie
			LoadFont("_RussellSquare 24px") .. {
				InitCommand=cmd(zoom,0.5);
				OnCommand=function(self)
					local pss = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn);
					local CaloriesBurned = pss:GetCaloriesBurned();
					local kcal_1_average;
					local kcal_2_average;
					if GAMESTATE:IsCourseMode() then
						-- EventModeの平均カロリー用、トータルステージ数を呼び出してステージ数を加えて保存する
						local totalcstage = getenv("TotalCourseStage"..ToEnumShortString(pn));
						-- Challengeの時は個別のステージクリア数で平均を出す
						-- NonstopとEndlessはVS時に片方が閉店してもプレイ可能でカロリーが加算されるため、全体のステージ数でいい
						if GAMESTATE:GetPlayMode() == "PlayMode_Oni" then
							local cstage = getenv("CourseStage"..ToEnumShortString(pn));
							kcal_1_average = CaloriesBurned/(totalcstage+cstage);
							kcal_2_average = ((CaloriesBurned/(totalcstage+cstage))*100)%100;
							setenv("TotalCourseStage"..ToEnumShortString(pn),totalcstage+cstage);
						else
							local csall = getenv("CourseStageAll");
							kcal_1_average = CaloriesBurned/(totalcstage+csall);
							kcal_2_average = ((CaloriesBurned/(totalcstage+csall))*100)%100;
							setenv("TotalCourseStage"..ToEnumShortString(pn),totalcstage+csall);
						end;
					else
						local iStage = GAMESTATE:GetCurrentStageIndex();
						kcal_1_average = CaloriesBurned/(iStage);
						kcal_2_average = ((CaloriesBurned/(iStage))*100)%100;
					end
					local kcal_1 = CaloriesBurned;
					local kcal_2 = (CaloriesBurned*100)%100;
					self:settextf(THEME:GetString("ScreenEvaluation","AverageCaloriesBurned").."　　".."%3i"..".".."%02d".."kcal",kcal_1_average,kcal_2_average);
					if GetCurLanguage == "ja" then
						if GAMESTATE:IsEventMode() then
							if PROFILEMAN:IsPersistentProfile(pn) then
								self:x(103);
							else
								self:x(100);
							end;
							self:y(16.5);
							self:horizalign(right);
						else
							if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
								if PROFILEMAN:IsPersistentProfile(pn) then
									self:x(103);
									self:y(16.5);
									self:horizalign(right);
									self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
								else
									self:visible(false);
								end;
							else
								if GAMESTATE:IsCourseMode() then
									if PROFILEMAN:IsPersistentProfile(pn) then
										self:x(103);
									else
										self:x(100);
									end;
									self:y(16.5);
									self:horizalign(right);
								else
									self:x(0);
									self:y(29);
									self:settextf(THEME:GetString("ScreenEvaluation","AverageCaloriesBurned").."%3i"..".".."%02d".."kcal",kcal_1_average,kcal_2_average);
								end;
							end;
						end;
					else
						if GAMESTATE:IsEventMode() then
							self:x(0);
							self:y(-2);
							self:vertspacing(5);
							self:settextf(THEME:GetString("ScreenEvaluation","AverageCaloriesBurned").."\n　　".."%3i"..".".."%02d".."kcal",kcal_1_average,kcal_2_average);
						else
							if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
								if PROFILEMAN:IsPersistentProfile(pn) then
									self:x(0);
									self:y(-2);
									self:vertspacing(5);
									self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."\n%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
								else
									self:visible(false);
								end;
							else
								if GAMESTATE:IsCourseMode() then
									self:x(0);
									self:y(-2);
									self:vertspacing(5);
									self:settextf(THEME:GetString("ScreenEvaluation","AverageCaloriesBurned").."\n　　".."%3i"..".".."%02d".."kcal",kcal_1_average,kcal_2_average);
								else
									self:x(0);
									self:y(23);
									self:vertspacing(5);
									self:settextf(THEME:GetString("ScreenEvaluation","AverageCaloriesBurned").."\n%3i"..".".."%02d".."kcal",kcal_1_average,kcal_2_average);
								end;
							end;
						end;
					end;
				end;
				BeginCommand=cmd(diffusealpha,0;sleep,0.25;diffusealpha,1);
			};
			-- Today Calorie (Summary2 total)
			LoadFont("_RussellSquare 24px") .. {
				InitCommand=cmd(zoom,0.5);
				OnCommand=function(self)
					local kcal_1;
					local kcal_2;
					local CaloriesToday;
					local pss = STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(pn);
					local CaloriesBurned = pss:GetCaloriesBurned();
					if GetCurLanguage == "ja" then
						if PROFILEMAN:IsPersistentProfile(pn) then
							CaloriesToday = PROFILEMAN:GetProfile(pn):GetCaloriesBurnedToday();
							kcal_1 = CaloriesToday;
							kcal_2 = (CaloriesToday*100)%100;
							self:settextf(THEME:GetString("ScreenEvaluation","TodayCaloriesBurned").."%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
						else
							kcal_1 = CaloriesBurned;
							kcal_2 = (CaloriesBurned*100)%100;
							if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
								self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
							else
								self:settextf(THEME:GetString("ScreenEvaluation","TotalCaloriesBurned").."%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
							end;
						end;
						if GAMESTATE:IsEventMode() then
							if PROFILEMAN:IsPersistentProfile(pn) then
								self:x(103);
							else
								self:x(100);
							end;
							self:horizalign(right);
							self:y(29);
						else
							if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
								if PROFILEMAN:IsPersistentProfile(pn) then
									self:x(103);
									self:horizalign(right);
								else
									self:x(0);
								end;
								self:y(29);
							else
								if GAMESTATE:IsCourseMode() then
									if PROFILEMAN:IsPersistentProfile(pn) then
										self:x(103);
									else
										self:x(100);
									end;
									self:horizalign(right);
									self:y(30);
								else
									self:visible(false);
								end;
							end;
						end;
					else
						if PROFILEMAN:IsPersistentProfile(pn) then
							CaloriesToday = PROFILEMAN:GetProfile(pn):GetCaloriesBurnedToday();
							kcal_1 = CaloriesToday;
							kcal_2 = (CaloriesToday*100)%100;
							self:settextf(THEME:GetString("ScreenEvaluation","TodayCaloriesBurned").."\n%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
						else
							kcal_1 = CaloriesBurned;
							kcal_2 = (CaloriesBurned*100)%100;
							if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
								self:settextf(THEME:GetString("ScreenEvaluation","CaloriesBurned").."\n%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
							else
								self:settextf(THEME:GetString("ScreenEvaluation","TotalCaloriesBurned").."\n%4i"..".".."%02d".."kcal",kcal_1,kcal_2);
							end;
						end;
						if GAMESTATE:IsEventMode() then
							self:y(23);
							self:vertspacing(5);
						else
							if (Var "LoadingScreen") == "ScreenEvaluationSummary2" or (Var "LoadingScreen") == "ScreenEvaluationSummary2Rave" then
								self:y(23);
								self:vertspacing(5);
							else
								if GAMESTATE:IsCourseMode() then
									self:y(30);
									self:vertspacing(5);
								else
									self:visible(false);
								end;
							end;
						end;
					end;
				end;
				BeginCommand=cmd(diffusealpha,0;sleep,0.25;diffusealpha,1);
			};
		};
	end;
end

if GAMESTATE:IsCourseMode() then
	for pn in ivalues(PlayerNumber) do
		-- Course Stage 
		t[#t+1] = Def.ActorFrame {
			InitCommand=cmd(player,pn;draworder,105);
			OnCommand=function(self)
				local yZoom;
				if pn == PLAYER_1 then
					self:x(SCREEN_CENTER_X-340);
				else
					self:x(SCREEN_CENTER_X+340);
				end;
				if CalorieDisplay(pn) == "on" then
					if GetCurLanguage == "ja" then
						self:y(SCREEN_CENTER_Y+43);
						yZoom = 1.33;
					else
						self:y(SCREEN_CENTER_Y+60);
						yZoom = 1.33;
					end;
				else
					self:y(SCREEN_CENTER_Y+68)
					yZoom = 1.33;
				end
				self:zoomy(0);
				self:zoomx(1.33);
				self:sleep(0.25);
				self:linear(0.5);
				self:zoomy(yZoom);
			end;
			OffCommand=cmd(diffusealpha,0);
			-- Back
			Def.Sprite {
				InitCommand=function(self)
					if pn == PLAYER_1 then
						self:Load(THEME:GetPathB("ScreenEvaluation","decorations/CourseStage_Back_P1"));
					else
						self:Load(THEME:GetPathB("ScreenEvaluation","decorations/CourseStage_Back_P2"));
					end;
				end;
			};
			-- Clear Stage Number
			LoadFont("_serpentinedbol 33px") .. {
				InitCommand=cmd(x,-41;y,-37;zoom,1;maxwidth,60);
				OnCommand=function(self)
					local cstage;
					if STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetFailed() then
						cstage = getenv("CourseStage"..ToEnumShortString(pn))-1;
					else
						cstage = getenv("CourseStage"..ToEnumShortString(pn));
					end;
					self:settextf("%2i",cstage);
				end;
			};
			-- Bar
			Def.Quad {
				InitCommand=cmd(y,6);
				OnCommand=function(self)
					if pn == PLAYER_1 then
						self:x(68);
						self:horizalign(right);
						self:diffuseleftedge(color("#00c7e6"));
						self:diffuserightedge(color("#0845f0"));
					else
						self:x(-68);
						self:horizalign(left);
						self:diffuseleftedge(color("#5704ce"));
						self:diffuserightedge(color("#ff03f4"));
					end;
					local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
					local cstage;
					if STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetFailed() then
						cstage = getenv("CourseStage"..ToEnumShortString(pn))-1;
					else
						cstage = getenv("CourseStage"..ToEnumShortString(pn));
					end;
					local stageper;
					-- Endress対策
					if cstage/coursestages > 1 then
						stageper = 1
					else
						stageper = cstage/coursestages
					end
					self:zoomto(0,16);
					self:sleep(0.75);
					self:linear(1);
					self:zoomto(136*stageper,16);
				end;
			};
			-- White MiniBar
			LoadActor("CourseStage_line")..{
				InitCommand=cmd(y,6);
				OnCommand=function(self)
					local coursestages = GAMESTATE:GetCurrentCourse():GetEstimatedNumStages();
					local cstage;
					if STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetFailed() then
						cstage = getenv("CourseStage"..ToEnumShortString(pn))-1;
					else
						cstage = getenv("CourseStage"..ToEnumShortString(pn));
					end;
					local stageper;
					-- Endress対策
					if cstage/coursestages > 1 then
						stageper = 1
					else
						stageper = cstage/coursestages
					end
					if pn == PLAYER_1 then
						self:x(68);
						self:sleep(0.75);
						self:linear(1);
						self:addx(-136*stageper);
					else
						self:x(-68);
						self:sleep(0.75);
						self:linear(1);
						self:addx(136*stageper);
					end;
				end;
			};
			-- Alive time
			LoadFont("_Bolster 21px") .. {
				InitCommand=cmd(y,23;zoomx,1;strokecolor,color("#000000");maxwidth,115);
				OnCommand=function(self)
					local aliveseconds = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetAliveSeconds();
					self:settext(SecondsToMSSMsMs(aliveseconds));
				end;
			};
		};
	end;
end;

--[[
	t[#t+1] = LoadFont("common normal") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+185;zoom,1);
		OnCommand=function(self)
			local UseLongMarathonStage = getenv("GetUseLongMarathonStage");
			self:settext(UseLongMarathonStage);
		end;
	};
--]]
------------- stage display position
if not GAMESTATE:IsCourseMode() and ((Var "LoadingScreen") == "ScreenEvaluationNormal" or (Var "LoadingScreen") == "ScreenEvaluationRave") then				
	t[#t+1] = LoadActor("StageDisplay") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-325;y,SCREEN_TOP+62);
		OnCommand = cmd(zoom,0;linear,0.25;zoom,0.9);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
end;


-- Load BestScore List
local function GetProfileHighScores(pn)
	local profile = PROFILEMAN:GetProfile(pn);
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = GAMESTATE:GetCurrentSong()
		local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
	assert(scorelist);
	return scorelist:GetHighScores();
end;

-- Load TopScore List
local function GetMachineHighScores(pn)
	local profile = PROFILEMAN:GetMachineProfile();
	if GAMESTATE:IsCourseMode() then
		local course = GAMESTATE:GetCurrentCourse();
		local Trail = GAMESTATE:GetCurrentTrail(pn);
		scorelist = profile:GetHighScoreList(course,Trail);
	else
		local song = GAMESTATE:GetCurrentSong()
		local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
		local steps = song:GetOneSteps( st, diff );
		scorelist = profile:GetHighScoreList(song,steps);
	end;
	assert(scorelist);
	return scorelist:GetHighScores();
end;



-- New Score Test         YELLOW BIG SCORE NORMAL PLAY
if not GAMESTATE:IsCourseMode() and (Var "LoadingScreen") == "ScreenEvaluationNormal" then
	for pn in ivalues(PlayerNumber) do
		if GAMESTATE:IsPlayerEnabled(pn) then
			t[#t+1] = Def.RollingNumbers {
				File=THEME:GetPathF("ScoreDisplayNormal","Text");
				InitCommand=function(self)
					(cmd(Load,"RollingNumbersEvaluationSleep";y,SCREEN_CENTER_Y+222;diffuse,color("#fff90a");zoom,1;draworder,100;visible,false))(self);
					if pn == PLAYER_1 then
						self:x(SCREEN_CENTER_X-350);
					else
						self:x(SCREEN_CENTER_X+350);
					end;
					self:targetnumber(0);
					self:queuecommand("Sleep");
				end;
				SleepCommand=function(self)
					self:sleep(0.3);
					self:queuecommand("Roll");
				end;
				RollCommand=function(self)
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					local radar = steps:GetRadarValues(pn);
					local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
					self:targetnumber(GetEvaScore(maxsteps,pss,pn));
					self:visible(true);
				end;
				OffCommand=cmd(diffusealpha,0);
			};
		end;
	end
end

-- New CourseScore Test  yellow score
if GAMESTATE:IsCourseMode() and (Var "LoadingScreen") == "ScreenEvaluationNormal" then
	for pn in ivalues(PlayerNumber) do
		if GAMESTATE:IsPlayerEnabled(pn) then
		
			local bEXScore = EXScore(pn);
		
			t[#t+1] = Def.RollingNumbers {
				File=THEME:GetPathF("ScoreDisplayNormal","Text");
				InitCommand=function(self)
					(cmd(Load,"RollingNumbersEvaluationSleep";y,SCREEN_CENTER_Y+220;diffuse,color("#fff90a");zoomx,1;draworder,100;visible,false))(self);
					if pn == PLAYER_1 then
						self:x(SCREEN_CENTER_X-350);
					else
						self:x(SCREEN_CENTER_X+350);
					end;
					self:targetnumber(0);
					self:queuecommand("Sleep");
				end;
				SleepCommand=function(self)
					self:sleep(0.3);
					self:queuecommand("Roll");
				end;
				RollCommand=function(self)
					local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
					local song = GAMESTATE:GetCurrentSong()
					local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
					local steps = song:GetOneSteps( st, diff );
					local radar = steps:GetRadarValues(pn);
					local maxsteps = math.max(radar:GetValue('RadarCategory_TapsAndHolds')+radar:GetValue('RadarCategory_Holds')+radar:GetValue('RadarCategory_Rolls'),1);
					local score;
					if bEXScore == "On" then
						score = GetEvaScore(maxsteps,pss,pn);
					else
						score = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetScore()
					end;
					self:targetnumber(score);
					self:visible(true);
				end;
				OffCommand=cmd(diffusealpha,0);
			};
		end;
	end
end

return t