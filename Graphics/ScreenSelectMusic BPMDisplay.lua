return Def.BPMDisplay {
	File=THEME:GetPathF("", "_russellsquare Bold 24px");
	SetCommand=function(self) self:SetFromGameState() end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};