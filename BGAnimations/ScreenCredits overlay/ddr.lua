local t = Def.ActorFrame {

	--■最初の文字
	LoadActor("Text/text 01") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,0;linear,7.2;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■DDR1ｓｔ
	LoadActor("Text/text 19980900") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDR1st PS
	LoadActor("Screenshots/19990410") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDR1st internet AC
	LoadActor("Screenshots/19981118") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR1st AC
	LoadActor("Screenshots/19980900") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525;linear,0;diffusealpha,1;sleep,0.63;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■DDR2nd
	LoadActor("Text/text 19990129a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*2;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Text/text 19990129b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*3;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDR2nd CLUB DC
	LoadActor("Screenshots/20000427") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDR2nd CLUB 2 PS
	LoadActor("Screenshots/19991222") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,5.91;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR2nd CLUB 1 PS
	LoadActor("Screenshots/19991125") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,5.03;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR2nd DC
	LoadActor("Screenshots/20000217") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,4.15;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR2nd PS P2
	LoadActor("Screenshots/19990826b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,3.27;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR2nd PS P1
	LoadActor("Screenshots/19990826a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,2.39;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR2nd AC CLUB Version 2
	LoadActor("Screenshots/19990727a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR2nd AC 1
	LoadActor("Screenshots/19990129") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*4;linear,0;diffusealpha,1;sleep,0.63;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■■■アニメ挿入■■■
	LoadActor("snap_01") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,7.2+3.525*6;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("snap_02") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,29.23;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■DsT
	LoadActor("Text/text 19990727") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DsT　PS
	LoadActor("Screenshots/19991209") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DsT　AC
	LoadActor("Screenshots/19990727b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■Solo
	LoadActor("Text/text 19990819") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*2;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	-- 2000
	LoadActor("Screenshots/19991216") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*3;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	-- BASS
	LoadActor("Screenshots/19990819") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*3;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■DDR3rd AC
	LoadActor("Text/text 19991030") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*4;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDR3rd PS 3
	LoadActor("Screenshots/20000518c") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*5;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDR3rd PS 2
	LoadActor("Screenshots/20000518b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*5;linear,0;diffusealpha,1;sleep,2.39;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--DDR3rd PS 1
	LoadActor("Screenshots/20000518a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*5;linear,0;diffusealpha,1;sleep,1.95;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};
	--DDR3rd PLUS AC
	LoadActor("Screenshots/20000621") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*5;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};
	--DDR3rd AC
	LoadActor("Screenshots/19991030") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*5;linear,0;diffusealpha,1;sleep,0.63;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■Dancing Stage featuring. DREAMS COME TRUE
	LoadActor("Text/text 19991225") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*6;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dancing Stage featuring. DREAMS COME TRUE PS
	LoadActor("Screenshots/20000420") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*7;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dancing Stage featuring. DREAMS COME TRUE AC
	LoadActor("Screenshots/19991225") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*7;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■Dance Dance Revolution GB
	LoadActor("Text/text 20000803") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*8;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution GB 3
	LoadActor("Screenshots/20010315b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*9;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution GB 2
	LoadActor("Screenshots/20001116") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*9;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--Dance Dance Revolution GB
	LoadActor("Screenshots/20000803") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*9;linear,0;diffusealpha,1;sleep,0.63;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■Dance Dance Revolution 4thMIX
	LoadActor("Text/text 20000814") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*10;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution 4thMIX PS
	LoadActor("Screenshots/20010315a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*11;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution 4thMIX PLUS AC
	LoadActor("Screenshots/20001228") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*11;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};
	--Dance Dance Revolution 4thMIX AC
	LoadActor("Screenshots/20000814") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*11;linear,0;diffusealpha,1;sleep,0.63;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■アニメ挿入
	LoadActor("snap_03") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,30.11+3.525*12;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("snap_04") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,73.29;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■おはスタ Dance Dance Revolution
	LoadActor("Text/text 20000914") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--おはスタ Dance Dance Revolution GB
	LoadActor("Screenshots/20010208") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--おはスタ Dance Dance Revolution PS
	LoadActor("Screenshots/20000914") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■Dance Dance Revolution iアプリ版
	LoadActor("Text/text 20010200") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*2;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution iアプリDX版
	LoadActor("Screenshots/20040100") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*3;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution iアプリ版
	LoadActor("Screenshots/20010200") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*3;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

--[[
	--■Dance Dance Revolution Tokimeki MIX
	LoadActor("Text/text 20000928") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*6;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20000928") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*7;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
--]]
	
	--■Dancing Stage featuring. Disney's RAVE
	LoadActor("Text/text 20001130") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*4;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dancing Stage featuring. Disney's RAVE GB
	LoadActor("Screenshots/20010329") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*5;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dancing Stage featuring. Disney's RAVE GC
	LoadActor("Screenshots/20001130c") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*5;linear,0;diffusealpha,1;sleep,2.39;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--Dancing Stage featuring. Disney's RAVE PS
	LoadActor("Screenshots/20001130b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*5;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	--Dancing Stage featuring. Disney's RAVE AC
	LoadActor("Screenshots/20001130a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*5;linear,0;diffusealpha,1;sleep,0.63;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■Dance Dance Revolution Kids
	LoadActor("Text/text 20001200") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*6;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20001200") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,74.2+3.525*7;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution BEST HITS
	LoadActor("Text/text 20001221") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20001221") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution 5thMIX
	LoadActor("Text/text 20010327") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*2;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution 5thMIX PS
	LoadActor("Screenshots/20010920") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*3;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution 5thMIX AC
	LoadActor("Screenshots/20010327") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*3;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■Dance Dance Revolution EXTRAMIX
	LoadActor("Text/text 20010607") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*4;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution EXTRAMIX 2
	LoadActor("Screenshots/20010607b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*5;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution EXTRAMIX 1
	LoadActor("Screenshots/20010607a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*5;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■ダンスダンスレボリューション・ふぁみマット
	LoadActor("Text/text 20010800") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*6;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20010800") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*7;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■DDRMAX -Dance Dance Revolution 6thMIX-
	LoadActor("Text/text 20011000") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*8;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDRMAX -Dance Dance Revolution 6thMIX- PS
	LoadActor("Screenshots/20020516") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*9;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDRMAX -Dance Dance Revolution 6thMIX- AC
	LoadActor("Screenshots/20011000") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*9;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};
	
	--■DDRMAX2 -Dance Dance Revolution 7thMIX-
	LoadActor("Text/text 20020300") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*10;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDRMAX2 -Dance Dance Revolution 7thMIX- PS
	LoadActor("Screenshots/20030424") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*11;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--DDRMAX2 -Dance Dance Revolution 7thMIX- AC
	LoadActor("Screenshots/20020300") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*11;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■Dance Dance Revolution EXTREME
	LoadActor("Text/text 20021225") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*12;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution EXTREME PS
	LoadActor("Screenshots/20031009") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*13;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution EXTREME AC
	LoadActor("Screenshots/20021225") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,102.45+3.525*13;linear,0;diffusealpha,1;sleep,1.51;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	-- ScreenSelectMusic mirror
	LoadActor("ScreenSelectMusic_Mirror") .. {
		InitCommand=cmd(diffusealpha,0;zoom,0.5);
		OnCommand=cmd(diffusealpha,1;addy,-480;sleep,155.325;linear,0;addy,480;sleep,10;linear,0;addy,-480),
	};
	
	--■バック無地・フェードアウト用
	Def.Quad {
		InitCommand=cmd(diffuse,color("#00000000");zoomto,640,480);
		OnCommand=cmd(sleep,102.45+3.525*13;linear,3.525*2;diffuse,color("#000000ff");sleep,1;linear,3.525;diffuse,color("#00000000")),
	};

	--■次の曲

	--■中間アニメーション
	

	--ゲームプレイ
	LoadActor("StepMania") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,164;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--ドア左
	LoadActor("door_mini01") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(addx,-320;diffusealpha,0;sleep,161.55;linear,0.25;diffusealpha,1;addx,320;sleep,4.33;linear,0.5;addx,-320;sleep,3;linear,0;diffusealpha,0),
	};

	--ドア右
	LoadActor("door_mini02") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(addx,320;diffusealpha,0;sleep,161.55;linear,0.25;diffusealpha,1;addx,-320;sleep,4.33;linear,0.5;addx,320;sleep,3;linear,0;diffusealpha,0),
	};
	
	-- Banner
	LoadActor("ScreenSelectMusic_Mirror/Dance Dance Revolution") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(y,-67.5;diffusealpha,0;zoom,2.75;sleep,162.55;linear,0.20;diffusealpha,1;zoom,0.625;linear,0.05;zoom,0.666;glow,color("1,1,1,0.75");linear,0.20;glow,color("1,1,1,0");sleep,3.13;linear,0.1;zoomy,0);
	};

	-- 2nd STAGE
	LoadFont("_impact 60px") .. {
		InitCommand=cmd(diffusealpha,0;y,14;settext,"2nd STAGE");
		OnCommand=cmd(diffuse,color("#333333");zoomx,0.55;zoomy,0;sleep,163.55;diffusealpha,1;linear,0.1;diffuse,color("#ffffff");zoomy,0.575;addy,-14;sleep,2.48;diffusealpha,0);
	};

	-- Ready
	LoadActor(THEME:GetPathB("ScreenGameplay","ready/ready")) .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(zoom,0.5;sleep,166.5;diffusealpha,1;sleep,1.3;diffusealpha,0),
	};

	-- Here we go!
	LoadActor(THEME:GetPathB("ScreenGameplay","go/go")) .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(zoom,0.5;sleep,167.8;diffusealpha,1;sleep,1.3;diffusealpha,0),
	};

	--■バック無地・フェードアウト用
	Def.Quad {
		InitCommand=cmd(diffuse,color("#00000000");zoomto,640,480);
		OnCommand=cmd(sleep,166.4;linear,2.3;diffuse,color("#000000ff");sleep,10;linear,0;diffuse,color("#00000000")),
	};

	--■途中の文字 The legend of Dance Dance Revolution still continues.
	LoadActor("Text/text 02") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7;linear,6.4;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	
	--■Dance Dance Revolution Party Collection
	LoadActor("Text/text 20031211") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*2;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20031211") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*3;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■DDR FESTIVAL -Dance Dance Revolution-
	LoadActor("Text/text 20041118") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*4;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20041118") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*5;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution with MARIO
	LoadActor("Text/text 20050714") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*6;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20050714") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*7;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution STRIKE
	LoadActor("Text/text 20060216") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*8;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20060216") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*9;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution SuperNOVA
	LoadActor("Text/text 20060712") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*10;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20060712") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*11;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution SuperNOVA 2
	LoadActor("Text/text 20070822") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*12;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20070822") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*13;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution HOTTEST PARTY Wii 2007.10.25
	LoadActor("Text/text 20071025") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*14;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20071025") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*15;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■ダンスダンスレボリューション フルフル♪パーティー Wii 2008.12.18
	LoadActor("Text/text 20081218") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*16;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20081218") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*17;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution X JP 2008.12.24
	LoadActor("Text/text 20081224") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*18;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20081224a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*19;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■★Dance Dance Revolution S 2009.02.25
	LoadActor("Text/text 20090225") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*20;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution S Plus
	LoadActor("Screenshots/20091005") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*21;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	--Dance Dance Revolution S 
	LoadActor("Screenshots/20090225") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*21;linear,0;diffusealpha,1;sleep,1.35;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0;),
	};

	--■Dance Dance Revolution MUSIC FIT Wii 2010.01.28
	LoadActor("Text/text 20100128") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*22;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20100128") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*23;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution X2 JP 2010.07.07
	LoadActor("Text/text 20100707") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*24;linear,0;diffusealpha,1;sleep,3.3;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20100707") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*25;linear,0;diffusealpha,1;sleep,3.3;linear,0;diffusealpha,0;),
	};

	--■Dance Dance Revolution X3 VS 2ndMIX JP 2011.11.16
	LoadActor("Text/text 20111100") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*26;linear,0;diffusealpha,1;sleep,3.3;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20111116b") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*27;linear,0;diffusealpha,1;sleep,10;linear,0;diffusealpha,0),
	};
	LoadActor("Screenshots/20111116a") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*27;linear,0;diffusealpha,1;sleep,1.35;zoom,1;linear,0.25;zoom,1.25;diffusealpha,0),
	};

	--■Dance Dance Revolution 2013 JP 2013.03.14
	LoadActor("Text/text 20130314") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*28;linear,0;diffusealpha,1;sleep,3.3;linear,0;diffusealpha,0;),
	};
	LoadActor("Screenshots/20130314") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*29;linear,0;diffusealpha,1;sleep,3.3;linear,0;diffusealpha,0;),
	};

	--■バック無地
	LoadActor("bg") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*30;linear,0;diffusealpha,1;),
	};

	--■ラストの文字 Thank you for ALL_
	LoadActor("Text/text end") .. {
		InitCommand=cmd(diffusealpha,0);
		OnCommand=cmd(sleep,168.7+3.2*30;linear,0;diffusealpha,1;sleep,3.2;linear,0.8;diffusealpha,0;),
	};

	--■バック無地・フェードアウト用
	Def.Quad {
		InitCommand=cmd(diffuse,color("#00000000");zoomto,640,480);
	--	OnCommand=cmd(sleep,262.3;linear,0.8;diffusealpha,1;),
		OnCommand=cmd(sleep,168.7+3.2*29;linear,3.2*2;diffuse,color("#000000ff")),
	};

};

return t;