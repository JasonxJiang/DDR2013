local t = LoadActor( "stages Nonstop" ) .. {
		Condition=GAMESTATE:IsEventMode(); 
	};	

return t;