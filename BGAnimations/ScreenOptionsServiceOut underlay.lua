local t = Def.ActorFrame {

	--pageのオン設定
	LoadActor( THEME:GetPathG("ScreenOptions","page") ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
--		OnCommand=cmd();
		OffCommand=cmd(zoomx,1;linear,0.25;zoomx,0);
	};

}

return t