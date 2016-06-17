
local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
    LoadActor("P1GameOver")..{
		-- xxx: assumes course is 4lives
		InitCommand=cmd(player,PLAYER_1;diffusealpha,0;rotationz,-15;zoom,0.5;bounce;;effectperiod,0.5);
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				if param.LivesLeft <= 0 then
				    self:diffusealpha(1)
				else
					self:diffusealpha(0)
				end
			end
		end;
	};
};	

return t;


