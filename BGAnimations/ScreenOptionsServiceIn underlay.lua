--　page
return LoadActor( THEME:GetPathG("ScreenOptions","page") ) .. {
	InitCommand=function(self)
		self:Center();
	end;
	OnCommand=function(self)
		self:zoomx(0);
		self:linear(0.25);
		self:zoomx(1);
	end;
};