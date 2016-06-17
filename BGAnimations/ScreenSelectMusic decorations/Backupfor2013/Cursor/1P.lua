return Def.ActorFrame {
	InitCommand=cmd(player,PLAYER_1);
	PlayerJoinedMessageCommand=function(self, params)
		if params.Player == PLAYER_1 then
			self:visible(true);
		end;
	end;
	PlayerUnjoinedMessageCommand=function(self, params)
		if params.Player == PLAYER_1 then
			self:visible(false);
		end;
	end;
	LoadActor( "1c" ) .. {
		InitCommand=cmd(horizalign,right;zoomx,-1);
	};
	LoadActor( "1c" ) .. {
		InitCommand=cmd(horizalign,right);
	};
	Def.Sprite {
		Texture=THEME:GetPathB("ScreenGameplay","overlay/_1P 1x2");
		Frame0000=0;
		Delay0000=0.7;
		Frame0001=1;
		Delay0001=0.3;
		InitCommand=cmd(x,-84;effectclock,"beat");
	};
};
	