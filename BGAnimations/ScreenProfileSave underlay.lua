local t = Def.ActorFrame {
	OnCommand=function(self)
		if GAMESTATE:HasEarnedExtraStage() then
			if GAMESTATE:IsExtraStage() then
				self:diffuse(color("#ffffff"));
			elseif GAMESTATE:IsExtraStage2() then
				self:diffuse(color("#ff5aec"));
			end;
		else
			if GAMESTATE:IsExtraStage() then
				self:diffuse(color("#ff5aec"));
			elseif GAMESTATE:IsExtraStage2() then
				self:diffuse(color("#ff5a63"));
			end;
		end;
	end;
};
return t;	