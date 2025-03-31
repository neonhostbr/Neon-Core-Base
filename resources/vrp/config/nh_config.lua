Config = Config or {}

Config.Webhook_nh = "https://discord.com/api/webhooks/1294792938869620848/K4x30ogw7s_saOFRl1KfJu4P08Zxw41ZpQLasUQdYJTCgE30fXkPz6ZxY7XDbDjOrQBz" --- # Aqui você inseri o seu webhook geral que será enviado todas as ScreenShot ta base

Groups = {
	["Admin"] = {
		["Permission"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { "Administrador","Moderador","Suporte" },
		["Service"] = {},
		["Client"] = true
	},
	["Premium"] = {
		["Permission"] = {
			["Premium"] = true
		},
		["Hierarchy"] = { "Ouro","Prata","Bronze" },
		["Salary"] = { 3750,2500,1250 },
		["Service"] = {},
		["Client"] = true,
		["Block"] = true
	},
	["LSPD"] = {
		["Permission"] = {
			["LSPD"] = true
		},
		["Hierarchy"] = { "Chefe","Capitão","Tenente","Sargento","Oficial","Cadete" },
		["Salary"] = { 3750,3625,3500,3375,3250,3125 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Markers"] = true,
		["Chat"] = true
	},
	["BCSO"] = {
		["Permission"] = {
			["BCSO"] = true
		},
		["Hierarchy"] = { "Chefe","Capitão","Tenente","Sargento","Oficial","Cadete" },
		["Salary"] = { 3750,3625,3500,3375,3250,3125 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Markers"] = true,
		["Chat"] = true
	},
	["BCPR"] = {
		["Permission"] = {
			["BCPR"] = true
		},
		["Hierarchy"] = { "Chefe","Capitão","Tenente","Sargento","Oficial","Cadete" },
		["Salary"] = { 3750,3625,3500,3375,3250,3125 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Markers"] = true,
		["Chat"] = true
	},
	["Paramedico"] = {
		["Permission"] = {
			["Paramedico"] = true
		},
		["Hierarchy"] = { "Chefe","Médico","Enfermeiro","Residente" },
		["Salary"] = { 3750,3625,3500,3375 },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true,
		["Markers"] = true,
		["Chat"] = true
	},




	-- Facs.lua
	["Armas1"] = {
		["Permission"] = {
			["Armas1"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Armas2"] = {
		["Permission"] = {
			["Armas2"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Municao1"] = {
		["Permission"] = {
			["Municao1"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Municao2"] = {
		["Permission"] = {
			["Municao1"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Desmanche1"] = {
		["Permission"] = {
			["Desmanche1"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Desmanche2"] = {
		["Permission"] = {
			["Desmanche2"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Drogas1"] = {
		["Permission"] = {
			["Drogas1"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Drogas2"] = {
		["Permission"] = {
			["Drogas2"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Contrabando"] = {
		["Permission"] = {
			["Contrabando"] = true
		},
		["Hierarchy"] = { "Líder","Sub-Líder","Membro","Recruta" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},

	["Restaurante"] = {
		["Permission"] = {
			["Restaurante"] = true
		},
		["Hierarchy"] = { "Chefe","Supervisor","Funcionário" },
		["Service"] = {},
		["Type"] = "Work",
		["Client"] = true
	},
	["Camera"] = {
		["Permission"] = {
			["Camera"] = true
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	},
	["Policia"] = {
		["Permission"] = {
			["LSPD"] = true,
			["BCSO"] = true,
			["BCPR"] = true
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	},
	["Emergencia"] = {
		["Permission"] = {
			["LSPD"] = true,
			["BCSO"] = true,
			["BCPR"] = true,
			["Paramedico"] = true
		},
		["Hierarchy"] = { "Membro" },
		["Service"] = {}
	},
	["Booster"] = {
		["Permission"] = {
			["Booster"] = true
		},
		["Hierarchy"] = { "Membro" },
		["Salary"] = { 2500 },
		["Service"] = {}
	}
}