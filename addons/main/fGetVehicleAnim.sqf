#include "script_component.hpp"
/* fGetVehicleAnim.sqf - (c) by rocko 2008, 2009
   
   Checks wether a unit is turned out in a vehicle or not.
   Functionname (compiled for ACE 2): CBA_fGetVehicleAnim
   Usage: [_unit] call functionname
   Returns: "true" for turned out or "false" for not turned out
   Example: if ( [_unit] call CBA_fGetVehicleAnim ) then { player sidechat " I R turned out" } else { _turned_out = false };

*/
private["_unit", "_anim", "_count", "_out", "_ret"];
_unit = _this select 0;
_anim = toArray(toLower(animationState _unit));
_count = (count _anim)-1;
_out = toString([_anim select (_count-2),_anim select (_count-1),_anim select _count]);
if (_out == "out") then { _ret = true; } else { _ret = false; };
_ret
