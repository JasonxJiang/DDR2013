local gc = Var "GameCommand";
local Name = gc:GetName();
local Index = gc:GetIndex();

local previewWidth = 320;
local previewHeight = 240;

local t = Def.ActorFrame{
	Name="PreviewFrame";
--	InitCommand=cmd(x,SCREEN_CENTER_X*1.5;y,SCREEN_CENTER_Y*0.85);
	OffCommand=cmd(linear,0.25;diffusealpha,0);
};

local previews = {
	WhereToFind = Def.ActorFrame{
		LoadActor("Cap01_find")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+145;y,SCREEN_CENTER_Y-57;zoomto,previewWidth,previewHeight);
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
	};
	HowToInstall = Def.ActorFrame{
		LoadActor("_howto install")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+145;y,SCREEN_CENTER_Y-57;zoomto,previewWidth,previewHeight);
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
	};
	AdditionalFolders = Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X+145;y,SCREEN_CENTER_Y-57);
	
		Def.Quad{
			InitCommand=cmd(zoomto,previewWidth,previewHeight);
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
		Def.Quad{
			InitCommand=cmd(y,-previewHeight*0.45;diffuse,color("#E0F0F0");zoomto,previewWidth,previewHeight*0.1;);
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
		-- Preferences.ini
		LoadFont("Common normal")..{
			InitCommand=cmd(x,-128;y,-114;zoom,0.625;halign,0;valign,0;diffuse,color("#000000"));
			BeginCommand=function(self)
				local text = "Preferences.ini";
				self:settext(text);
			end;
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
		LoadFont("Common normal")..{
			Text="[Options]\nAdditionalCourseFolders=\nAdditionalFolders=\nAdditionalSongFolders=";
			InitCommand=cmd(x,-128;y,-84;zoom,0.75;halign,0;valign,0;diffuse,color("#000000"));
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
	};
	ReloadSongs = Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X+145;y,SCREEN_CENTER_Y-57);
		LoadFont("Common normal")..{
			InitCommand=cmd(zoom,0.4;maxwidth,(previewWidth*1.6)-8);
			BeginCommand=function(self)
				local song = SONGMAN:GetRandomSong();
				self:settext("Loading songs...\n"..song:GetGroupName().."\n"..song:GetDisplayFullTitle());
			end;
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
	};
	Exit = Def.ActorFrame{
		LoadActor("Cap05_Exit")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+145;y,SCREEN_CENTER_Y-57;zoomto,previewWidth,previewHeight);
			GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
		};
	};
};

t[#t+1] = previews[Name];

t[#t+1] = LoadFont("Common normal")..{
	Name="Explanation";
	--Text="The quick brown fox jumps over the lazy dog ".. Index .." times.";
	Text=Screen.String("Explanation-"..Name);
	-- was x,-(SCREEN_CENTER_X*0.4);y,SCREEN_CENTER_Y*0.525;
	InitCommand=cmd(x,SCREEN_CENTER_X-285;y,SCREEN_CENTER_Y+88;zoom,0.6;wrapwidthpixels,950;horizalign,left;vertalign,top);
	GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
};

return t;