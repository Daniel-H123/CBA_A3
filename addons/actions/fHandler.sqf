#include "script_component.hpp"

private ["_code", "_action"];
#ifdef DEBUG
	private ["_ar"];
	_ar = [];
#endif

_action = "moveRight"; // TODO: FindOutActionKey!

{
	_code = _x select 0;
	if (true) then
	{
		#ifdef DEBUG
			PUSH(_ar,_code);
		#endif
		_this call _code;
	};
} forEach (GVAR(actions) getVariable _action);
#ifdef DEBUG
	if (count _ar > 0) then
	{
		[format["ActionPressed: %1, Executing: %2", _this, _ar], STR(ADDON)] call CBA_fDebug;
	} else {
		[format["ActionPressed: %1, No Execution", _this], STR(ADDON)] call CBA_fDebug;
	};
#endif
