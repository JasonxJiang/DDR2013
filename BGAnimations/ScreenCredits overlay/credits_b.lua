local none = {
}

--AC版スタッフ

local ddr_ac_DIRECTOR = {
	"Katsunori Okita",
	"Kazuya Takahashi",
}

local ddr_ac_PROGRAMMER = {
	"Shin Terao",
	"Yusuke Kitakaze",
	"Tadashi Kitagawa",
	"Tetsuya Nitta",
	"Hiroki Ishida",
	"Yoshihiko Narita",
	"Takahiro Ohashi",
}

local ddr_ac_DESIGNER = {
	"Nobuo Tomita",
	"Eiichi Yoshioka",
	"Yukiko Mizoo",
	"Yutaka Sakaue",
	"Mitsuo Nagamoto",
	"Tomohiro Ota",
	"Kazushi Hasegawa",
	"Takashi Inubushi",
	"Akira Iizumi",
	"Yoshiko Oiwa",
	"Kanako Yonezawa",
}

local ddr_ac_SOUND = {
	"Naoki Maeda",
	"Hideaki Shikama",
	"Masaomi Kawai",
}

local ddr_ac_MECHANICAL_DESIGNER = {
	"Toru Takeda",
	"Kouichi Nishio",
	"Satoshi Uchiyama",
	"Toyozou Maki",
	"Yoshiyuki Ishikawa",
	"Hirohumi Mamitsu",
	"Shinya Ishida",
	"Tomohisa Tanaka",
}

local ddr_ac_HARDWARE_DESIGNER = {
	"Toyofumi Kitano",
	"Kazutaka Kubota",
	"Masato Nagatomi",
	"Satoshi Ueda",
	"Masahiko Kami",
}

local ddr_ac_PRODUCT_DESIGNER = {
	"Takashi Nishimura",
	"Hiroyuki Sugimoto",
	"Hideaki Minoda",
}

local ddr_ac_INDUSTRIAL_DESIGNER = {
	"Hiroyuki Muraki",
	"Makiko Otomi",
}

local ddr_ac_PRODUCER = {
	"Yoshihiko Ota",
}

local ddr_ac_GRAND_PRODUCER = {
	"Fumiaki Tanaka",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
}

--PS版スタッフ

local ddr_ps_DIRECTOR = {
	"Yasumi Takase",
	"Hirotaka Ishikawa",
}

local ddr_ps_PROGRAMMER = {
	"Kenichiro Horio",
	"Naizo Nayami",
	"Akari Uchida",
	"Kazuo Ishikawa",
	"Akinori Tamura",
	"Nishibori Taquashi",
	"K.Nagaoka",
}

local ddr_ps_DESIGNER = {
	"Yoshiko Wada",
	"Satoshi Kushibuchi",
	"Koji Yamada",
	"K-suke Hattori",
	"Atushi Ono",
	"Yumi Yoshida",
	"tanaka.HIDEKI",
}

local ddr_ps_SOUND_DESIGNER_AND_COMPOSER = {
	"UI-ASAMi",
}

local ddr_ps_SOUND_PROGRAMMER = {
	"Tomokazu Koizumi",
}

local ddr_ps_MIXER = {
	"IMOHORE IMAI",
}

local ddr_ps_DIGITAL_TECHNICIAN = {
	"Ken Imaizumi",
}

local ddr_ps_PRODUCT_DESIGNER = {
	"Akie Karibe",
}

local ddr_ps_ORIGINAL_CONTROLLER = {
	"Toshimitsu Oishi",
	"Hideyuki Doumitsu",
	"Toru Okubo",
}

local ddr_ps_PROMOTION = {
	"Yoshiko Yagi",
	"Hiroaki Kamata",
	"Yoko Sekiguchi",
	"Yuriko Oinuma",
}

local ddr_ps_PRODUCER = {
	"Yoshinori Mishina",
}

local ddr_ps_GRAND_PRODUCER = {
	"Makoto Yano",
}

local ddr_SPECIAL_THANKS = {
	"",
	"",
	"",
	"",
	"Hiroyuki Kadoma",
	"Issey Nisawa",
	"Mariko Shimbori",
	"Atsushi Sekimoto",
	"Juri Sakuma",
	"Maria Hazama",
	"Shigeki Yutani",
	"",
	"Shuichiro Murata",
	"(MEGA GRAPHICS INC.)",
}

----------------------------

local function Fooled()
	local phrases = {
		"hornswaggled",
		"bamboozled",
		"hoodwinked",
		"swindled",
		"duped",
		"hoaxed",
		"fleeced",
		"shafted",
		"caboodled",
		"beguiled",
		"finagled",
		"two-timed",
		"suckered",
		"flimflammed"
	}
	return phrases[math.random(#phrases)]
end

local ssc = {
	"AJ Kelly as freem",
	"Jonathan Payne (Midiman)",
	"Colby Klein (shakesoda)",
}

local sm_ssc = {
	"Jason Felds (wolfman2000)", -- Timing Segments, Split Timing, optimization
	"Thai Pangsakulyanont (theDtTvB)", -- BMS, Split Timing, optimization
	"Alberto Ramos (Daisuke Master)",
	"Jack Walstrom (FSX)",
}

local stepmania = {
	"Chris Danford",
	"Glenn Maynard",
	"Steve Checkoway",
	-- and various other contributors
}

local oitg = {
	"infamouspat",
	"Mark Cannon (vyhd)",
}

local contrib = {
	"Aldo Fregoso (Aldo_MX)", -- delays and much more. StepMania AMX creator
	"A.C/@waiei", -- custom scoring fixes + Hybrid scoring
	"cerbo", -- lua bindings and other fun stuff
	"cesarmades", -- pump/cmd* noteskins
	"Chris Eldridge (kurisu)", -- dance-threepanel stepstype support
	"Christophe Goulet-LeBlanc (Kommisar)", -- songs
	"corec", -- various fixes
	"galopin", -- piu PlayStation2 usb mat support
	"gholms", -- automake 1.11 support
	"juanelote", -- SongManager:GetSongGroupByIndex, JumpToNext/PrevGroup logic mods
	"Kaox", -- pump/default noteskin
	"NitroX72", -- pump/frame noteskin
	"Petriform", -- default theme music
	"Sakurana-Kobato (@sakuraponila)", -- custom scoring fixes
	"Samuel Kim (1a2a3a2a1a)", -- various beat mode fixes
	"hanubeki (@803832)", -- beginner helper fix, among various other things
	"v1toko", -- x-mode from StepNXA
}

local translators = {
	"John Reactor (Polish)",
	"DHalens (Spanish)",
	"@Niler_jp (Japanese)",
	"Deamon007 (Dutch)"
	}
	
local thanks = {
	"A Pseudonymous Coder", -- support
	"Bill Shillito (DM Ashura)", -- Music (not yet though)
	"cpubasic13", -- testing (a lot)
	"Dreamwoods",
	"Jason Bolt (LightningXCE)",
	"Jousway", -- Noteskins
	"Luizsan", -- creator of Delta theme
	"Matt1360", -- Automake magic + oitg bro
	"Renard",
	"Ryan McKanna (Plaguefox)",
	"Sta Kousin", --help with Japanese bug reports
	"",
	"",
	"",
	"",
	"",
	"",
}

--[[
local shoutout = {
	"The Lua team", -- lua project lead or some shit. super nerdy but oh hell.
	"Mojang AB", -- minecraft forever -freem
	"Wolfire Games", -- piles of inspiration
	"NAKET Coder",
	"Ciera Boyd", -- you bet your ass I'm putting my girlfriend in the credits
	--Image(), -- we should have some logos probably to look super pro
	"#KBO",
	"Celestia Radio", -- LOVE AND TOLERANCE
	"You showed us... your ultimate dance",
}


local copyright = {
	"StepMania is released under the terms of the MIT license.",
	"If you paid for the program you've been " .. Fooled() .. ".",
	"All content is the sole property of their respectful owners."
}
--]]


------------------------------


local sections = {

	{ "StepMania STAFF", none },
	
	{ "the spinal shark collective (project lead)", ssc },
	{ "sm-ssc Team", sm_ssc },
	{ "StepMania Team", stepmania },
	{ "OpenITG Team", oitg },
	{ "Translators", translators },
	{ "Other Contributors", contrib },
	{ "Special Thanks", thanks },
--	{ "Shoutouts", shoutout },
--	{ "Copyright", copyright },

	{ "Dance Dance Revolution\nARCADE ORIGINAL STAFF", none },
	
	{ "DIRECTOR", ddr_ac_DIRECTOR },
	{ "PROGRAMMER", ddr_ac_PROGRAMMER },
	{ "DESIGNER", ddr_ac_DESIGNER },
	{ "SOUND", ddr_ac_SOUND },
	{ "MECHANICAL DESIGNER", ddr_ac_MECHANICAL_DESIGNER },
	{ "HARDWARE DESIGNER", ddr_ac_HARDWARE_DESIGNER },
	{ "PRODUCT DESIGNER", ddr_ac_PRODUCT_DESIGNER },
	{ "INDUSTRIAL DESIGNER", ddr_ac_INDUSTRIAL_DESIGNER },
	{ "PRODUCER", ddr_ac_PRODUCER },
	{ "GRAND PRODUCER", ddr_ac_GRAND_PRODUCER },
	
	{ "Dance Dance Revolution\nPlayStation STAFF", none },
	
	{ "DIRECTOR", ddr_ps_DIRECTOR },
	{ "PROGRAMMER", ddr_ps_PROGRAMMER },
	{ "DESIGNER", ddr_ps_DESIGNER },
	{ "SOUND DESIGNER\nAND COMPOSER", ddr_ps_SOUND_DESIGNER_AND_COMPOSER },
	{ "SOUND PROGRAMMER", ddr_ps_SOUND_PROGRAMMER },
	{ "MIXER", ddr_ps_MIXER },
	{ "DIGITAL TECHNICIAN", ddr_ps_DIGITAL_TECHNICIAN },
	{ "PRODUCT DESIGNER", ddr_ps_PRODUCT_DESIGNER },
	{ "ORIGINAL CONTROLLER", ddr_ps_ORIGINAL_CONTROLLER },
	{ "PROMOTION", ddr_ps_PROMOTION },
	{ "PRODUCER", ddr_ps_PRODUCER },
	{ "GRAND PRODUCER", ddr_ps_GRAND_PRODUCER },

	{ "SPECIAL THANKS", ddr_SPECIAL_THANKS },
	{ "Developed by KCET", none },
}

-- To add people or sections modify the above.

local fontPath = THEME:GetPathF( "", "_data seventy let Bold 40px" )

--普通の文字
local lineOn = cmd(zoomx,0.5;zoomy,0.45;horizalign,left;diffuse,color("#ffffff");strokecolor,color("#2f2f2f");)

--見出し文字
local sectionOn = cmd(zoomx,0.5;zoomy,0.45;horizalign,left;y,-15;diffuse,color("#ff9900");strokecolor,color("#3a1e01");)

--最後のサイトのアドレス文字とか
local otherOn = cmd(zoomx,0.5;zoomy,0.45;horizalign,left;diffuse,50,.5,150,1)

--文字が最初に現れる位置（早さ）
local item_padding_start = 9;

local t = Def.ActorScroller {

--スクロールする速さ、少ないほど早い	
	SecondsPerItem = 0.90	;
--	SecondsPerItem = 0.93	;
	
--上下の現れる幅の設定
	NumItemsToDraw = 17;
	
	TransformFunction = function( self, offset, itemIndex, numItems)
	
--文字の上下間隔の設定
		self:y(30*offset)
	end;
	OnCommand = cmd(scrollwithpadding,item_padding_start,-0.5);
}

local function AddLine( text, command )
--	if text then text=string.upper(text) end
	local text = Def.BitmapText {
		_Level = 2;
		File = fontPath;
		Text = text or "";
		OnCommand = command or lineOn;
	}
	-- XXX: Hack. Wrap in an ActorFrame so OnCommand works
	table.insert( t, Def.ActorFrame { text } )
end

-- Add sections with padding.
--文字群と文字群の間設定
for section in ivalues(sections) do
	AddLine( section[1], sectionOn )
	for name in ivalues(section[2]) do
		AddLine( name )
	end
	AddLine()
	AddLine()
	AddLine()
end

-- Add more padding and then the join the team.
--最後に出てくる文字とスタッフロールの間隔設定
for i=10,13 do AddLine() end

AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )
AddLine( "" )

t.BeginCommand=function(self)
	SCREENMAN:GetTopScreen():PostScreenMessage( "SM_BeginFadingOut", (t.SecondsPerItem * (#t + item_padding_start) + 5) );
end;


return t;
