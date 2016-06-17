local t = Def.ActorFrame{

	LoadFont("Common normal")..{
		InitCommand=cmd(settext,"AUTOGEN";zoom,0.35;strokecolor,color("#000000"));
--		OnCommand=cmd(diffuseblink;effectcolor1,color("0.73,0,0,1");effectcolor2,color("1,1,0,1"););
};
};


return t;