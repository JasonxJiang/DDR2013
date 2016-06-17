return Def.Quad {
	InitCommand=function(self)
		self:diffuse(color("#000000"));
		self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT);
	end;
};