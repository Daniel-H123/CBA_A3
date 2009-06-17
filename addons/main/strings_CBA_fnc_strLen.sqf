/* ----------------------------------------------------------------------------
@description Counts the number of characters in a string.

Parameters:
  0: _string - String to measure [String]

Returns:
  Number of characters in string [Number]

---------------------------------------------------------------------------- */

#include "script_component.hpp"

SCRIPT(strLen);

// ----------------------------------------------------------------------------


count (toArray (_this select 0)); // Return.
