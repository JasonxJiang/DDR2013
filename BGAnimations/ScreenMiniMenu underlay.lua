return Def.Quad{
	InitCommand=function(self)
		self:diffuse(color("0,0,0,0.75"));
		self:scaletocover(-SCREEN_WIDTH*2,SCREEN_TOP,SCREEN_WIDTH*2,SCREEN_BOTTOM);
	end;
};