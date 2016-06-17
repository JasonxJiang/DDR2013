local gc = Var("GameCommand");

local t = Def.ActorFrame {
--[[	-- Text back blue
	LoadFont("_futura std medium 20px") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', gc:GetText() );
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X+52,SCREEN_CENTER_X+95);y,SCREEN_CENTER_Y-85+gc:GetIndex()*28;zoomy,1;horizalign,center);
		OnCommand=cmd(zoomx,0;bounceend,0.25;zoomx,1);
		OffCommand=cmd(diffusealpha,1;bouncebegin,0.25;diffusealpha,0;);
		GainFocusCommand=cmd(diffuse,color("#0070c1");strokecolor,color("#0070c1"));
		LoseFocusCommand=cmd(diffuse,color("#0050b0");strokecolor,color("#0050b0"));
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	}; ]]--
	-- Text
	LoadFont("_futura std medium 20px") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', gc:GetText() );
		InitCommand=cmd(x,WideScale(SCREEN_CENTER_X,SCREEN_CENTER_X);y,SCREEN_CENTER_Y+58+gc:GetIndex()*28;zoomy,1;horizalign,center);
		OnCommand=cmd(zoomx,0;bounceend,0.25;zoomx,1);
		OffCommand=cmd(diffusealpha,1;bouncebegin,0.25;diffusealpha,0;);
		GainFocusCommand=cmd(diffuse,color("#ffffff");strokecolor,color("#000000"));
		LoseFocusCommand=cmd(diffuse,color("#909090");strokecolor,color("#000000"));
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
--[[	-- Snapshot
	Def.Sprite {
		InitCommand=function(self)
			if GetScreenAspectRatio() > 1.7 then
				self:Load(THEME:GetPathG("ScreenTitleMenu","scroll/snap_wide " .. gc:GetText()));
			else
				self:Load(THEME:GetPathG("ScreenTitleMenu","scroll/snap_normal " .. gc:GetText()));
			end;
			self:x(SCREEN_CENTER_X-135);
			self:y(SCREEN_CENTER_Y-20);
		end;
		OnCommand=cmd(zoomy,0;bounceend,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.125;zoomy,1;bouncebegin,0.25;zoomy,0);
		GainFocusCommand=cmd(visible,true;zoomy,0.75;bounceend,0.05;zoomy,1;diffuse,color("#ffffff"));
		LoseFocusCommand=cmd(visible,false);
	}; ]]--
--[[	-- Explanations back
	LoadActor("ex") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+145);
		OnCommand=cmd(diffusealpha,0;zoomx,0;bounceend,0.25;zoomx,1;diffusealpha,1);
		OffCommand=cmd(diffusealpha,1;zoomx,1;bouncebegin,0.25;zoomx,0;diffusealpha,0);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	-- Explanation text
	LoadFont("_tt-jtc win r4p 20px") .. {
		Text=THEME:GetString(Var "LoadingScreen", gc:GetText() .. "Explanation");
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+145);
		OnCommand=cmd(zoomx,0;bounceend,0.25;zoom,0.7);
		OffCommand=cmd(bouncebegin,0.25;zoomx,0;diffusealpha,0);
		GainFocusCommand=cmd(diffusealpha,1);
		LoseFocusCommand=cmd(diffusealpha,0);
	}; ]]--
	-- TitleChoice from DDR5thMix by AJ 187
	Def.Actor{
		OffFocusedCommand=function(self)
			local idx = gc:GetIndex()+1
			setenv("TitleChoice",idx)
		end;
	};
};
return t;