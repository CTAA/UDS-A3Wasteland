/*
	Author: Exonical
	Description: Intro
	Version: 0.3
	Updated: 02.11.2019
*/

sleep 90;

private _messages = [
	["Welcome to our", "UDS - A3Wasteland Chernarus"],
	["Feedback", "Post Ideas/Bugs at our Discord!"],
	["Discord", "www.discord.gg/S25QBgb47y"],
	["Useful Keys", "END-Earplugs, H-Holster"],
	["Supported Mods", "JSRS, Enhanced Movement"]
];

private _timeout = 10;
{
	uiSleep 2;
	private _title = _x select 0;
	private _content = _x select 1;
	private _titleText = format[("<t size='0.50' color='#ea3238' align='left' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' size='0.60' color='#FFFFFF' align='left'>%2</t>"), _title, _content];
	[_titleText,[safezoneX + safezoneW - 0.4,0.50],[safezoneY + safezoneH - 0.8,0.7],_timeout,0.5] spawn BIS_fnc_dynamicText;
	uiSleep (_timeout * 1.1);
} forEach _messages;