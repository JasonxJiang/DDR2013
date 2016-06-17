return LoadActor( THEME:GetPathG("Common", "fallback background") ) .. {
	InitCommand=function(self)
		self:Center();
		self:scale_or_crop_background();
	end;
	OnCommand=function(self)
		self:diffusealpha(0);
		self:linear(0.25);
		self:diffusealpha(1);
	end;
};
