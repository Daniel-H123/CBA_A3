#include "script_component.hpp"
/* CBA_fHeadDir by rocko

	usage: 	[player,object] call CBA_fHeadDir;

			! "_object" is optional when u dont wanna check relations to other objects, e.g only want the direction the players head is looking ...
			! "_object" can also be a position		

	returns: 
			[<NUMBER>,<NUMBER>,<BOOL>,<BOOL>] 
			Direction of player head
			Difference angle (negative or positive), e.g how many degrees turning to center object horizontally
			True/False if given object is in field of view of player relative to his head
			True/False if player is using 3rd person view
			
	to do: 	vertical angle 

	note: 	positionCameraToWorld is only valid for player object, it is not handled for ai !!
			for ai you can only check if its turned towards an object, not looking at

	examples:  	[player] call CBA_fHeadDir returns direction of head (freelook)

 			[player,house1] call CBA_fHeadDir returns direction of head, difference angle, if house is in fov and if 3rd person is on or not

			[ai] call CBA_fHeadDir returns the direction of ai (not head)

			[ai,getpos player] returns direction of ai, difference towards players pos, if player is in fov of ai, and 3rd person off (default return)
*/

private["_unit", "_object", "_position", "_viewpos", "_vector", "_magnitude", "_azimuth", "_angle", "_dif", "_infov", "_threed"];

_unit = _this select 0;
_ai = false;
_threed = false;
if (_unit != player) then { _ai = true };
_object = _this select 1;
if (isNil ("_object")) then { _object = _unit;};
//player sidechat format ["unit:%1 is ai =%2 and object is %3", _unit,_ai,_object];

if !(typeName _object == "ARRAY") then
{
	_object = getpos _object;
};
if (_ai) then
{
	_azimuth = getdir _unit;
}
else
{
	_position = positionCameraToWorld [0, 0, 0];
	if ((_position distance _unit)>2) then { _threed = true;} else { _threed = false;};
	_viewPos = positionCameraToWorld [0, 0, 99999999];
	_vector = 	[
			(_viewPos select 0) - (_position select 0),
			(_viewPos select 1) - (_position select 1),
			(_viewPos select 2) - (_position select 2)
			];
	_magnitude = [0, 0, 0] distance _vector;
	_vector = 	[
			(_vector select 0) / _magnitude, 
			(_vector select 1) / _magnitude,
			(_vector select 2) / _magnitude
			];
	_azimuth = (_vector select 0) atan2 (_vector select 1);
	_azimuth = ((_azimuth + 360) mod 360);
};

_angle = ((_object select 0)-(getPos _unit select 0)) atan2 ((_object select 1)-(getPos _unit select 1));
//player sidechat format ["_pos: %1 _angle:%2", _pos,_angle];
	
_dif = (_angle - _azimuth);

if (_dif < 0) then { _dif = 360 + _dif;};
if (_dif > 180) then { _dif = _dif - 360;};
if (abs(_dif) < 43) then { _infov = true;} else { _infov = false;};

[_azimuth,_dif,_infov,_threed]

