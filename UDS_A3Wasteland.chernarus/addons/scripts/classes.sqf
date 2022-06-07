// Kit Loadouts Start here 
switch (playerSide) do {
	// BLUFOR Loadouts
	case BLUFOR : {
		switch (true) do
		{	
		// Diver
		case (["_diver_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_FieldPack_blk";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addWeapon "arifle_SDAR_F";
			_player addMagazine "9Rnd_45ACP_Mag";
			_player addMagazine "9Rnd_45ACP_Mag";
			_player addWeapon "hgun_ACPC2_F";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			};
		// Medic
		case (["_medic_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_FieldPack_blk";
			_player forceAddUniform "U_BG_leader";
			_player addVest "V_TacVestIR_blk";
			_player addMagazine "100Rnd_65x39_caseless_mag";
			_player addWeapon "arifle_MX_SW_F";
			_player addPrimaryWeaponItem "optic_Hamr";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addItem "SmokeShell";
			_player addItem "SmokeShell";
			_player addWeapon "hgun_P07_F";
			_player addMagazine "16Rnd_9x21_Mag";
			_player addMagazine "16Rnd_9x21_Mag";
			_player addItem "Medikit";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Beret_Colonel";
			_player addGoggles "G_Spectacles_Tinted";
			};
		// Engineer
		case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_Carryall_oli";
			_player forceAddUniform "U_BG_Guerilla2_1";
			_player addMagazine "30Rnd_556x45_Stanag";
			_player addMagazine "30Rnd_556x45_Stanag";
			_player addWeapon "arifle_Mk20_F";
			_player addPrimaryWeaponItem "optic_aco_smg";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addWeapon "launch_RPG32_F";
			_player addMagazine "RPG32_F";
			_player addMagazine "RPG32_F";
			_player addMagazine "6Rnd_45ACP_Cylinder";
			_player addMagazine "6Rnd_45ACP_Cylinder";
			_player addWeapon "hgun_Pistol_heavy_02_F";
			_player addItem "Toolkit";
			_player addItem "MineDetector";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Watchcap_blk";
			_player addGoggles "G_Balaclava_blk";
			};
			
			default
			{};
		};
	};
	// OPFOR Loadouts
	case OPFOR : {
		switch (true) do
		{
		// Diver
		case (["_diver_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_FieldPack_blk";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addWeapon "arifle_SDAR_F";
			_player addMagazine "9Rnd_45ACP_Mag";
			_player addMagazine "9Rnd_45ACP_Mag";
			_player addWeapon "hgun_ACPC2_F";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			};
		// Medic	
		case (["_medic_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_FieldPack_blk";
			_player forceAddUniform "U_BG_leader";
			_player addVest "V_TacVestIR_blk";
			_player addMagazine "100Rnd_65x39_caseless_mag";
			_player addWeapon "arifle_MX_SW_F";
			_player addPrimaryWeaponItem "optic_Hamr";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addItem "SmokeShell";
			_player addItem "SmokeShell";
			_player addWeapon "hgun_P07_F";
			_player addMagazine "16Rnd_9x21_Mag";
			_player addMagazine "16Rnd_9x21_Mag";
			_player addItem "Medikit";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Beret_Colonel";
			_player addGoggles "G_Spectacles_Tinted";
			};
		// Engineer
		case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_Carryall_oli";
			_player forceAddUniform "U_BG_Guerilla2_1";
			_player addMagazine "30Rnd_556x45_Stanag";
			_player addMagazine "30Rnd_556x45_Stanag";
			_player addWeapon "arifle_Mk20_F";
			_player addPrimaryWeaponItem "optic_aco_smg";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addWeapon "launch_RPG32_F";
			_player addMagazine "RPG32_F";
			_player addMagazine "RPG32_F";
			_player addMagazine "6Rnd_45ACP_Cylinder";
			_player addMagazine "6Rnd_45ACP_Cylinder";
			_player addWeapon "hgun_Pistol_heavy_02_F";
			_player addItem "Toolkit";
			_player addItem "MineDetector";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Watchcap_blk";
			_player addGoggles "G_Balaclava_blk";
			};
			default
			{};
		};
	};
	case INDEPENDENT : {
		// INDEPENDENT Loadouts
		switch (true) do
		{
		// Diver
		case (["_diver_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_FieldPack_blk";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addMagazine "20Rnd_556x45_UW_mag";
			_player addWeapon "arifle_SDAR_F";
			_player addMagazine "9Rnd_45ACP_Mag";
			_player addMagazine "9Rnd_45ACP_Mag";
			_player addWeapon "hgun_ACPC2_F";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			};
		// Medic
		case (["_medic_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_FieldPack_blk";
			_player forceAddUniform "U_BG_leader";
			_player addVest "V_TacVestIR_blk";
			_player addMagazine "100Rnd_65x39_caseless_mag";
			_player addWeapon "arifle_MX_SW_F";
			_player addPrimaryWeaponItem "optic_Hamr";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addItem "SmokeShell";
			_player addItem "SmokeShell";
			_player addWeapon "hgun_P07_F";
			_player addMagazine "16Rnd_9x21_Mag";
			_player addMagazine "16Rnd_9x21_Mag";
			_player addItem "Medikit";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Beret_Colonel";
			_player addGoggles "G_Spectacles_Tinted";
			};
		// Engineer
		case (["_engineer_", typeOf _player] call fn_findString != -1):
			{
			removeBackpack _player;
			removeAllWeapons _player;
			_player addBackpack "B_Carryall_oli";
			_player forceAddUniform "U_BG_Guerilla2_1";
			_player addMagazine "30Rnd_556x45_Stanag";
			_player addMagazine "30Rnd_556x45_Stanag";
			_player addWeapon "arifle_Mk20_F";
			_player addPrimaryWeaponItem "optic_aco_smg";
			_player addItem "HandGrenade";
			_player addItem "HandGrenade";
			_player addWeapon "launch_RPG32_F";
			_player addMagazine "RPG32_F";
			_player addMagazine "RPG32_F";
			_player addMagazine "6Rnd_45ACP_Cylinder";
			_player addMagazine "6Rnd_45ACP_Cylinder";
			_player addWeapon "hgun_Pistol_heavy_02_F";
			_player addItem "Toolkit";
			_player addItem "MineDetector";
			_player addWeapon "Binocular";
			_player addItem "FirstAidKit";
			_player addItem "FirstAidKit";
			_player addHeadgear "H_Watchcap_blk";
			_player addGoggles "G_Balaclava_blk";
			};
			default
			{};
		};
	};
};

		
