return Def.Sprite {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	OnCommand=function(self)
		if GAMESTATE:IsExtraStage() then
			self:Load(THEME:GetPathB("ScreenSelectMusic","background/bg_extra"));
			self:texcoordvelocity(0.1,0);
		elseif GAMESTATE:IsExtraStage2() then
			self:Load(THEME:GetPathB("ScreenSelectMusic","background/bg_encore"));
			self:texcoordvelocity(0.1,0);
		else
			self:Load(THEME:GetPathB("ScreenSelectMusic","background/bg_normal"));
			self:texcoordvelocity(0.05,0);
		end;
		self:customtexturerect(0,0,1,1);
		self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT);
	end;
};