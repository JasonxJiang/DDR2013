--最後の黒い暗幕フェード、これがないと最後に文字のin移動が見切れてしまう
local t = Def.Quad{
		InitCommand=cmd(scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM;);
		OnCommand=cmd(diffuse,color("0,0,0,0");sleep,15.95;linear,0.25;diffuse,color("0,0,0,1")),
	};
	
return t;

