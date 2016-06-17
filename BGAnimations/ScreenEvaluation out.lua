return Def.ActorFrame {
	LoadActor(THEME:GetPathS("", "_swoosh")) .. {
		StartTransitioningCommand=function(self)
			self:play();
		end;
	};
	Def.Actor {
		OnCommand=function(self)
			self:sleep(0.5);
		end;
	};
};