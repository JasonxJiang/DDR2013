return LoadActor("m_waku Endless") .. {
	InitCommand=function(self)
		if GAMESTATE:GetCurrentStyle():GetName() == "single" then
			self:diffusealpha(0);
		else
			self:diffusealpha(0);
		end;
	end;
	GainFocusCommand=cmd(visible,false);
	LoseFocusCommand=cmd(visible,false);
	PlayerJoinedMessageCommand=cmd(diffusealpha,0);
};