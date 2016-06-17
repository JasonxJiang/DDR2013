local t = Def.ActorFrame{};

-- Alive time
t[#t+1] = LoadFont("_russellsquare Bold 24px") .. {
	Name="AliveTime";
	InitCommand=cmd(zoomx,0.83;zoomy,0.65);
};

local SecondsTo;
if GAMESTATE:GetPlayMode() == 'PlayMode_Endless' then
	SecondsTo = SecondsToHHMMSS;
else
	SecondsTo = SecondsToMMSSMsMs;
end;

if GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2) then
	local function Update(self)
		local AliveTime = self:GetChild("AliveTime");
		local aliveseconds;
		local alivesecondsP1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetAliveSeconds();
		local alivesecondsP2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetAliveSeconds();
		if alivesecondsP2 == 0 or STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetFailed() then
			aliveseconds = alivesecondsP1;
		else
			aliveseconds = alivesecondsP2;
		end;
		AliveTime:settext(SecondsTo(aliveseconds));
	end;
	t.InitCommand=cmd(SetUpdateFunction,Update);
elseif GAMESTATE:IsHumanPlayer(PLAYER_1) then
	local function UpdateP1(self)
		local AliveTime = self:GetChild("AliveTime");
		local alivesecondsP1 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetAliveSeconds();
		AliveTime:settext(SecondsTo(alivesecondsP1));
	end;
	t.InitCommand=cmd(SetUpdateFunction,UpdateP1);
elseif GAMESTATE:IsHumanPlayer(PLAYER_2) then
	local function UpdateP2(self)
		local AliveTime = self:GetChild("AliveTime");
		local alivesecondsP2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetAliveSeconds();
		AliveTime:settext(SecondsTo(alivesecondsP2));
	end;
	t.InitCommand=cmd(SetUpdateFunction,UpdateP2);
end;

return t;