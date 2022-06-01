class CfgPatches
{
	class a3_infiSTAR_vision
	{
		requiredVersion = 0.1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgFunctions
{
	class a3_infiSTAR_vision
	{
		class functions
		{
			file = "a3_infiSTAR_vision\functions";
			class PlayerConnected {};
			class PlayerDisconnected {};
			class Extension {};
			class zeus_check {};
			class tos {};
		};
		class fsm
		{
			file = "a3_infiSTAR_vision\fsm";
			class feed
			{
				ext = ".fsm";
			};
		};
		class start
		{
			file = "a3_infiSTAR_vision\init";
			class preInit
			{
				preInit = 1;
			};
			class postInit
			{
				postInit = 1;
			};
		};
	};
};
/*
14:09:52 "<<< VISION VARS >>>"
14:09:52 "a3_infistar_vision_fnc_playerdisconnected"
14:09:52 "a3_infistar_vision_fnc_preinit"
14:09:52 "a3_infistar_vision_fnc_feed"
14:09:52 "a3_infistar_vision_fnc_zeus_execute"
14:09:52 "a3_infistar_vision_fnc_tos"
14:09:52 "a3_infistar_vision_fnc_feed_fsm"
14:09:52 "a3_infistar_vision_fnc_extension"
14:09:52 "a3_infistar_vision_fnc_postinit"
14:09:52 "a3_infistar_vision_fnc_playerconnected"
14:09:52 "a3_infistar_vision_fnc_zeus_check"
14:09:52 "<<< VISION VARS >>>"
*/
