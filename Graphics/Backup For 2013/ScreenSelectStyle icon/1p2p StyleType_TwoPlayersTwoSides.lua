return Def.ActorFrame {

	
--難易度バック

LoadActor( "1p2p StyleType_OnePlayerOneSide PlayerNumber_p1" ) .. {
		InitCommand=cmd(x,-80);

		};
		
LoadActor( "1p2p StyleType_OnePlayerOneSide PlayerNumber_p2" ) .. {
		InitCommand=cmd(x,80);

		};

};