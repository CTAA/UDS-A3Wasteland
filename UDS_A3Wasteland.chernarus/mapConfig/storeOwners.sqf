// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	["GenStore1", -1, [], []], // Nizhnoye
	["GenStore2", -1, [], []], // Petrovka
	["GenStore3", -1, [], []], // Novy Sobor
	["GenStore4", -1, [], []], // Prigorodki
	["GenStore5", -1, [], []], // Krasnostav
	["GenStore6", -1, [], []], // Komarovo
	["GenStore7", -1, [], []], // Zelenogorsk
	["GenStore8", -1, [], []], // Northwest Airfield

	["GunStore1", -1, [], []], // Chernogorsk
	["GunStore2", -1, [], []], // Skalisty Island
	["GunStore3", -1, [], []], // Klen
	["GunStore4", -1, [], []], // Stary Sobor
	["GunStore5", -1, [], []], // Berezino
	["GunStore6", -1, [], []], // Northwest Airfield
	["GunStore7", -1, [], []], // Zelenogorsk

	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	["VehStore1", -1, [], ["Boats"]],  // Northwest Airfield
	["VehStore2", -1, [], ["Boats"]],  // Northeast Airfield
	["VehStore3", -1, [], ["Boats"]],  // Southwest Airfield
	["VehStore4", -1, [], ["Planes"]], // Chernogorsk
	["VehStore5", -1, [], ["Planes"]], // Southeast Khelm
	["VehStore6", -1, [], ["Planes"]], // Solnichniy
	["VehStore7", -1, [], ["Planes"]], // Elektrozavodsk
	["VehStore8", -1, [], ["Planes", "Boats"]], // Pass Sosnovy
	["VehStore9", -1, [], ["Planes", "Boats"]]  // Gorka
	// ["VehStore7", -1, [], ["Planes","Boats","Helicopters"]]
];
// Auf neue Skins warten
// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[
	["GenStore1", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore2", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore3", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore4", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore5", [["weapon", ""], ["uniform", "U_I_E_CBRN_Suit_01_EAF_F"]]],
	["GenStore6", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore7", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],
	["GenStore8", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_01_formal_F"]]],

	["GunStore1", [["weapon", ""], ["uniform", "U_I_E_CBRN_Suit_01_EAF_F"]]],
	["GunStore2", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore3", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore4", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_officer_F"]]],
	["GunStore5", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore6", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_F"]]],
	["GunStore7", [["weapon", ""], ["uniform", "U_I_E_Uniform_01_officer_F"]]],

	["VehStore1", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore2", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore3", [["weapon", ""], ["uniform", "U_C_CBRN_Suit_01_Blue_F"]]],
	["VehStore4", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore6", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore7", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore8", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]],
	["VehStore9", [["weapon", ""], ["uniform", "U_C_Uniform_Scientist_02_formal_F"]]]
];
