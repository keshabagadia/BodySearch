VAR minutes = 420

//relationship trackers
VAR AsukaShota=0
VAR AsukaRumiko=0

//general flags
VAR knowBodySearch = false

//act1 puzzle flags
VAR lockedRoomDiscovered = false
VAR findTruthTheft = false
VAR keyFound = false

VAR croquetteCount = 4

===function time()===
~ temp hour_hand = minutes / 60
~ temp min_hand = minutes % 60
{hour_hand} hours {min_hand} minutes.


===function test_time(mins)===
{mins/60} hours {mins%60} minutes.

===ResetLoop===
~minutes = 420
->Bedroom


===function minuteCalculator(hour, min)===
{hour*60 + min%60}

===function again()===
{ResetLoop >= 1: again|}


