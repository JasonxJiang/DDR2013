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
	LoadActor( "p1_shadow" ) .. {
	};
};
	