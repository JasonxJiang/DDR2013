return Def.ActorFrame{
	-- header
	LoadActor( THEME:GetPathG("ScreenOptions","header/ScreenOptions header") ) .. {
		InitCommand=function(self)
			self:vertalign(top);
			self:x(WideScale(SCREEN_CENTER_X+83,SCREEN_CENTER_X));
			self:y(SCREEN_TOP);
		end;
		OnCommand=function(self)
			self:linear(0.25);
			self:addy(-56);
		end;
		OffCommand=function(self)
			self:linear(0.25);
			self:addy(56);
		end;
	};
	-- page
	LoadActor( THEME:GetPathG("ScreenOptions","page") ) .. {
		InitCommand=function(self)
			self:Center();
		end;
		OnCommand=function(self)
			self:zoomx(1);
			self:linear(0.25);
			self:zoomx(0);
		end;
		OffCommand=function(self)
			self:sleep(0.25);
			self:zoomx(0);
			self:linear(0.25);
			self:zoomx(1);
		end;
	};
};