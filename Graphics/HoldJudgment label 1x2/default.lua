local t = Def.ActorFrame {};

for pn in ivalues(PlayerNumber) do
	if GAMESTATE:IsPlayerEnabled(pn) then
		-- ComboGraphic reading
		local bComboGraphic = ComboGraphic(pn);
	--	t[#t+1] = Def.Sprite {
	--	t = Def.Sprite {
		return Def.Sprite {
			InitCommand=function(self)
				if GAMESTATE:IsDemonstration() or (not GAMESTATE:IsSideJoined(pn) and GAMESTATE:GetPlayMode() == 'PlayMode_Rave') 
				or (bComboGraphic=='default') then
					self:Load(THEME:GetPathG("HoldJudgment","label 1x2/_label_2013"));
				else
					self:Load(THEME:GetPathG("HoldJudgment","label 1x2/_label_"..bComboGraphic));
				end;
			end;
			--[[
			JudgmentMessageCommand = function(self, params)
			--	if params.Player ~= pn then return end;
				local player = params.Player;
				if player == PLAYER_1 then
					self:Load(THEME:GetPathG("HoldJudgment","label 1x2/_label_default"));
				elseif player == PLAYER_2 then
					self:Load(THEME:GetPathG("HoldJudgment","label 1x2/_label_x3"));
				end
			end;
			--]]
		};
	end;
end;

-- return t;