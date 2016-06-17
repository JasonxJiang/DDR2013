return Def.ActorFrame {	
	-- page
	LoadActor( THEME:GetPathG("ScreenOptions","page") ) .. {
		InitCommand=function(self)
			self:Center();
		end;
	};
};