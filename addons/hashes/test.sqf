// -----------------------------------------------------------------------------
// Automatically generated by 'functions_config.rb'
// DO NOT MANUALLY EDIT THIS FILE!
// -----------------------------------------------------------------------------
#define DEBUG_MODE_FULL
#include "script_component.hpp"

#define TESTS ["hashEachPair", "hashes", "parseJSON", "parseYaml", "hashFilter", "orderedDicts"]

SCRIPT(test-hashes);

// ----------------------------------------------------------------------------

LOG("=== Testing Hashes ===");

{
    private _test = execVM format ["\x\cba\addons\hashes\test_%1.sqf", _x];
    waitUntil { scriptDone _test };
} forEach TESTS;
