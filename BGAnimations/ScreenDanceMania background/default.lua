local t = Def.ActorFrame {

	-- 黒背景
	Def.Quad{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffuse,color("#000000");scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
	};

	-- 東芝ロゴ	
	LoadActor("Toshiba") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0),
		OnCommand=cmd(linear,0.5;diffusealpha,1;sleep,2.5;linear,0.5;diffusealpha,0),
	};
	
	-- ■01左上
	LoadActor("01") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y-27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-156);
	};	
	
	-- 01左下
	LoadActor("01") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 01右上
	LoadActor("01") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 01右下
	LoadActor("01") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- ■02左上
	LoadActor("02") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*1;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y-156);
	};	
	
	-- 02左下
	LoadActor("02") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*1;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 02右上
	LoadActor("02") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*1;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 02右下
	LoadActor("02") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*1;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- ■03左上
	LoadActor("03") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*2;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y-156);
	};	
	
	-- 03左下
	LoadActor("03") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*2;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 03右上
	LoadActor("03") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*2;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 03右下
	LoadActor("03") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*2;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	

	-- ■04左上
	LoadActor("04") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*3;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y-27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y-156);
	};	
	
	-- 04左下
	LoadActor("04") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*3;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 04右上
	LoadActor("04") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*3;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 04右下
	LoadActor("04") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*3;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
-----------------------------------------------------------------------------------------

	-- ■05左上
	LoadActor("05") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*4;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y+27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y-52);
	};	
	
	-- 05左下
	LoadActor("05") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*4;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 05右上
	LoadActor("05") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*4;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 05右下
	LoadActor("05") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*4;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	
	-- ■06左上
	LoadActor("06") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*5;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y-52);
	};	
	
	-- 06左下
	LoadActor("06") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*5;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 06右上
	LoadActor("06") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*5;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 06右下
	LoadActor("06") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*5;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	

	
	-- ■07左上
	LoadActor("07") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*6;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y-52);
	};	
	
	-- 07左下
	LoadActor("07") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*6;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 07右上
	LoadActor("07") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*6;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 07右下
	LoadActor("07") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*6;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	
	-- ■08左上
	LoadActor("08") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*7;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y+27;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y-52);
	};	
	
	-- 08左下
	LoadActor("08") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*7;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 08右上
	LoadActor("08") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*7;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 08右下
	LoadActor("08") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*7;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
-----------------------------------------------------------------------------------------	

	-- ■09左上
	LoadActor("09") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*8;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y+81;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y+52);
	};	
	
	-- 09左下
	LoadActor("09") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*8;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 09右上
	LoadActor("09") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*8;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 09右下
	LoadActor("09") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*8;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	

	
	-- ■10左上
	LoadActor("10") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*9;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+81;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y+52);
	};	
	
	-- 10左下
	LoadActor("10") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*9;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 10右上
	LoadActor("10") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*9;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 10右下
	LoadActor("10") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*9;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	


	-- ■11左上
	LoadActor("11") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*10;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+81;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y+52);
	};	
	
	-- 11左下
	LoadActor("11") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*10;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 11右上
	LoadActor("11") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*10;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 11右下
	LoadActor("11") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*10;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	

	
	-- ■12左上
	LoadActor("12") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*11;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y+81;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y+52);
	};	
	
	-- 12左下
	LoadActor("12") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*11;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 12右上
	LoadActor("12") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*11;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 12右下
	LoadActor("12") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*11;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
-----------------------------------------------------------------------------------------
	
	-- ■13左上
	LoadActor("13") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*12;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y+104;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y+156);
	};	
	
	-- 13左下
	LoadActor("13") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*12;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 13右上
	LoadActor("13") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*12;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 13右下
	LoadActor("13") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*12;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- ■14左上
	LoadActor("14") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*13;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+104;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X-52;y,SCREEN_CENTER_Y+156);
	};	
	
	-- 14左下
	LoadActor("14") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*13;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 14右上
	LoadActor("14") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*13;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 14右下
	LoadActor("14") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*13;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- ■15左上
	LoadActor("15") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*14;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+104;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y+156);
	};	
	
	-- 15左下
	LoadActor("15") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*14;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 15右上
	LoadActor("15") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*14;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 15右下
	LoadActor("15") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*14;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- ■16左上
	LoadActor("16") .. {
		InitCommand=cmd(cropright,0.5;cropbottom,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*15;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,0;cropbottom,0;sleep,0.05;linear,0;x,SCREEN_CENTER_X+52;y,SCREEN_CENTER_Y+104;zoomto,312,312;linear,0.18;zoomto,104,104;x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y+156);
	};	
	
	-- 16左下
	LoadActor("16") .. {
		InitCommand=cmd(cropright,0.5;croptop,0.5;x,SCREEN_CENTER_X-SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*15;linear,0.1;addx,SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};	
	
	-- 16右上
	LoadActor("16") .. {
		InitCommand=cmd(cropleft,0.5;cropbottom,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y-SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*15;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};
	
	-- 16右下
	LoadActor("16") .. {
		InitCommand=cmd(cropleft,0.5;croptop,0.5;x,SCREEN_CENTER_X+SCREEN_WIDTH*0.5;y,SCREEN_CENTER_Y+SCREEN_HEIGHT*0.5;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(sleep,4.0+0.3125*15;linear,0.1;addx,-SCREEN_WIDTH*0.5;addy,-SCREEN_HEIGHT*0.5;linear,0;cropright,1;cropbottom,1);
	};

-----------------------------------------------------------------------------------------

	LoadActor("Dancemania") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0),
		OnCommand=cmd(sleep,10.5;diffusealpha,1;sleep,7.75;diffusealpha,0;),
	};
	
	Def.Quad{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffuse,color("#ffffff");scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffusealpha,0;sleep,10;linear,0.5;diffusealpha,1;sleep,0.25;linear,0.5;diffusealpha,0;sleep,4.5;linear,1;diffusealpha,1),
	};
	
}

return t
