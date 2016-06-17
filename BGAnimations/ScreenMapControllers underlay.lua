return Def.ActorFrame {
	-- Black back
	Def.Quad{
		InitCommand=function(self)
			self:Center();
			self:diffuse(color("#000000"));
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT);
		end;
		OnCommand=function(self)
			self:diffusealpha(0);
			self:linear(0.5);
			self:diffusealpha(0.4);
		end;
		OffCommand=function(self)
			self:linear(0.5);
			self:diffusealpha(0);
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
}