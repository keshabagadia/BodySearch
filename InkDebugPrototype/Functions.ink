//day variables
CONST morningTime = 420
CONST bodySearchTime = 0
VAR totalMinutes = morningTime
VAR currentHour = 7
VAR currentMinutes = 0


//night variables
CONST allowedMoves = 3
VAR movesTaken=0
VAR bonusMoves=0
VAR totalAllowedMoves= allowedMoves

//act 1 variables
VAR keyFound = false
VAR savedShota = false

VAR AsukaShota=0
VAR AsukaRumiko=0

VAR croquetteCount = 4

VAR currentNode = ->Bedroom
VAR previousNode = ->Bedroom

//nodes

===ResetLoop===
~totalMinutes = morningTime
~movesTaken = 0
->Bedroom

===GoToNode(->toNode)===
~previousNode = currentNode
~currentNode = toNode
->currentNode

===GoToNode_Night(->toNode)===
~temp newMoveCount = movesTaken+1
~totalAllowedMoves = allowedMoves + bonusMoves
{newMoveCount<=totalAllowedMoves:
    {newMoveCount}
    ~movesTaken = newMoveCount
    ~previousNode = currentNode
    ~currentNode = toNode
    ->currentNode
-else:
    ->Deaths
}

===placeholder_knot===
    
    You have reached an unwritten deadend.
    
    Something happens. Definitely. But we don't know what yet.
    
    ->DONE

//time functions 
===function time()===
~ temp hour_24 = totalMinutes / 60
~currentMinutes = totalMinutes % 60
~ currentHour = hour_24 % 12
~ temp am_pm = ""
~ temp display_minute = ""

{hour_24 >= 12:
    ~ am_pm = "PM"
- else:
    ~ am_pm = "AM"
}

{currentHour == 0:
    ~ currentHour = 12
}

{currentMinutes < 10:
    ~ display_minute = "0" + currentMinutes
- else:
    ~ display_minute = currentMinutes
}

{currentHour}:{display_minute} {am_pm}.

===function add_time(min) ===
~totalMinutes+=min
~ temp hour_24 = totalMinutes / 60
~currentMinutes = totalMinutes % 60
~ currentHour = hour_24 % 12
{min < 60:
    {min} minutes pass.
- else:
    ~ temp hrs = min / 60
    ~ temp mins = min % 60
    {hrs} hour{hrs > 1:"s"} {mins} minute{mins != 1:"s"} pass.
}
=== function is_time_in_range(startHour, startMin, endHour, endMin) ===
~ temp currentTime = totalMinutes
~ temp startTime = startHour * 60 + startMin
~ temp endTime = endHour * 60 + endMin

{startTime <= endTime:
{startTime} {endTime}
    {currentTime >= startTime and currentTime < endTime:
        1
    - else:
        0
    }
- else:
    0
}


//language reusability functions

===function again()===
{ResetLoop >= 1: again|}


//ui functions
=== function show_panel(location) ===
\--------------------------------------------------
     🗺️  Location: {location}                 
     🕒  Time: {time()}             
     {totalMinutes}
\--------------------------------------------------



