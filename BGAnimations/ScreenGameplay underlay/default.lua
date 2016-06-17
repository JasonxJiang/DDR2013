local t = Def.ActorFrame{};
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local style = GAMESTATE:GetCurrentStyle():GetStyleType()
local mpn = GAMESTATE:GetMasterPlayerNumber();
--[[
-- Cut In
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	if cutin(pn) then
	local p=((pn == PLAYER_1) and 1 or 2);
		-- CutIn Base
		t[#t+1] = Def.ActorFrame {
                LoadActor("Cut_in",pn) .. {
			    InitCommand=function(self)
					self:y(SCREEN_CENTER_Y)
					if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
						self:x(SCREEN_CENTER_X);
					elseif IsUsingCenter1Player then
						if st == "StepsType_Dance_Solo" then
							if pn == PLAYER_1 then
								self:x(WideScale(SCREEN_CENTER_X+228,SCREEN_CENTER_X-309));
							else
								self:x(WideScale(SCREEN_CENTER_X-228,SCREEN_CENTER_X+309));
							end;
						-- ダブル時に画面がノーマルの時は表示させない
						elseif st == "StepsType_Dance_Double" then
							if GetScreenAspectRatio() < 1.7 then
								self:visible(false);
							else
								if pn == PLAYER_1 then
									self:x(SCREEN_CENTER_X-340);
								else
									self:x(SCREEN_CENTER_X+340);
								end;
							end;
						else
							if pn == PLAYER_1 then
								self:x(WideScale(SCREEN_CENTER_X+228,SCREEN_CENTER_X-277));
							else
								self:x(WideScale(SCREEN_CENTER_X-228,SCREEN_CENTER_X+277));
							end; 
						end;
					else
						if st == "StepsType_Dance_Solo" then
							if pn == PLAYER_1 then
								self:x(WideScale(SCREEN_CENTER_X-228,SCREEN_CENTER_X-309));
							else
								self:x(WideScale(SCREEN_CENTER_X+228,SCREEN_CENTER_X+309));
							end;
						elseif st == "StepsType_Dance_Double" then
							if GetScreenAspectRatio() < 1.7 then
								self:visible(false);
							else
								if pn == PLAYER_1 then
									self:x(SCREEN_CENTER_X-340);
								else
									self:x(SCREEN_CENTER_X+340);
								end;
							end;
						else
							if pn == PLAYER_1 then
								self:x(SCREEN_CENTER_X+190);
							else
								self:x(SCREEN_CENTER_X-190);
							end; 
						end;
					end
				end;
			};
		};
	end;
end; ]]--
--test--
--[[
t[#t+1] = LoadActor("cutin") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
};]]--
------------------------------------------------------------------------------------------------------------------
-- Cut In
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	if Popup(pn) then
	local p=((pn == PLAYER_1) and 1 or 2);
		-- Popup Base
		t[#t+1] = Def.ActorFrame {
                LoadActor("Pop_up",pn) .. {
			    InitCommand=function(self)
					self:y(SCREEN_CENTER_Y)
					if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
						self:x(SCREEN_CENTER_X);
					elseif IsUsingCenter1Player then
						if st == "StepsType_Dance_Solo" then
							if pn == PLAYER_1 then
								self:x(WideScale(SCREEN_CENTER_X+228,SCREEN_CENTER_X-309));
							else
								self:x(WideScale(SCREEN_CENTER_X-228,SCREEN_CENTER_X+309));
							end;
						-- ダブル時に画面がノーマルの時は表示させない
						elseif st == "StepsType_Dance_Double" then
							if GetScreenAspectRatio() < 1.7 then
								self:visible(false);
							else
								if pn == PLAYER_1 then
									self:x(SCREEN_CENTER_X-340);
								else
									self:x(SCREEN_CENTER_X+340);
								end;
							end;
						else
							if pn == PLAYER_1 then
							    self:horizalign(left);
								self:x(SCREEN_LEFT);
							else
								self:x(WideScale(SCREEN_CENTER_X-228,SCREEN_CENTER_X+277));
							end; 
						end;
					else
						if st == "StepsType_Dance_Solo" then
							if pn == PLAYER_1 then
								self:x(WideScale(SCREEN_CENTER_X-228,SCREEN_CENTER_X-309));
							else
								self:x(WideScale(SCREEN_CENTER_X+228,SCREEN_CENTER_X+309));
							end;
						elseif st == "StepsType_Dance_Double" then
							if GetScreenAspectRatio() < 1.7 then
								self:visible(false);
							else
								if pn == PLAYER_1 then
								 --   self:horizalign(left);
--									self:x(SCREEN_CENTER_X-340);
									self:x(SCREEN_LEFT+125);
								else
								 --   self:horizalign(right);
--									self:x(SCREEN_CENTER_X+340);
									self:x(SCREEN_RIGHT-125);
								end;
							end;
						else
							if pn == PLAYER_1 then
								self:x(SCREEN_CENTER_X+285);
							else
								self:x(SCREEN_CENTER_X-285);
							end; 
						end;
					end
				end;
			};
		};
	end;
end;
--------------------------------------------------------------------------------------------------------------------------------
-- Screen Filter
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("ScreenFilter",pn);	
end;
--------------------------------------------------------------------------------------------------------------------------------
--[[
-- popup 
for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("NewCutin",pn);	
end; ]]--
return t;