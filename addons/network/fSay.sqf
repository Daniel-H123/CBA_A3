#include "script_component.hpp"
GVAR(say) = _this;
publicVariable STR(GVAR(say));

if (SLX_XEH_MACHINE select 0 && !ACE_DEAD) then
{
	{ _x say (_this select 1) } forEach (_this select 0);
};