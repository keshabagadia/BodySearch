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
VAR needKey = false
VAR knowAboutFramedTheft = false
VAR foundFoot = false


VAR AsukaShota=0
VAR AsukaRumiko=0

//companions 
VAR companion1 = ""
VAR companion2 = ""
VAR companion3 = ""

VAR croquetteCount = 4
VAR bodyPartsFound = 0

VAR currentNode = ->Bedroom
VAR previousNode = ->Bedroom

//nodes

===ResetLoop===
~totalMinutes = morningTime
~movesTaken = 0
->Bedroom

===GoToNode(->toNode)===
//{movesTaken}
~previousNode = currentNode
~currentNode = toNode
->currentNode

===GoToNode_Night(->toNode)===
~movesTaken+=1
~totalAllowedMoves = allowedMoves + bonusMoves
~previousNode = currentNode
{movesTaken<=totalAllowedMoves:
    ~currentNode = toNode
    ->currentNode
-else:
~previousNode= toNode
    {companion1!="":
        ~temp comp1 = companion1
        ~companion1=""
        ->CompanionDeath(comp1)
    - else:
        {companion2!="":
        ~temp comp2 = companion2
        ~companion2=""
           ->CompanionDeath(comp2)
        -else:
           {companion3!="":
            ~temp comp3 = companion3
            ~companion3=""
               ->CompanionDeath(comp3)
               -else:
               ->Deaths
           }
        }
    }
       
}

===CompanionDeath(companion)===
{companion:
     - "Shota": 
        ->shota_death
     -"Takeshiro":
        ->takeshiro_death
    -"Rumiko":
        ->rumiko_death
    -else:
        ->Deaths
}



===placeholder_knot===

\--------------------------------------------------    
    You have reached an unwritten deadend.
    
    Something happens. Definitely. But we don't know what yet.
    
    ->DONE


===function set_companion(companion)===
{companion1=="": 
    ~companion1 = companion
- else:
    {companion2=="":
        ~companion2 = companion
    -else:
        ~companion3 = companion
    }
}
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

===function add_time_passive(min) ===
~totalMinutes+=min
~ temp hour_24 = totalMinutes / 60
~currentMinutes = totalMinutes % 60
~ currentHour = hour_24 % 12
{min < 60:
    <i>{min} minutes pass.</i>
- else:
    ~ temp hrs = min / 60
    ~ temp mins = min % 60
    <i>{hrs} hour{hrs > 1:"s"} {mins} minute{mins != 1:"s"} pass.</i>
}

===function add_time_active(min) ===
~totalMinutes+=min
~ temp hour_24 = totalMinutes / 60
~currentMinutes = totalMinutes % 60
~ currentHour = hour_24 % 12
{min < 60:
    <i>It takes {min} minutes.</i>
- else:
    ~ temp hrs = min / 60
    ~ temp mins = min % 60
    <i>It takes {hrs} hour{hrs > 1:"s"} {mins} minute{mins != 1:"s"} .</i>
}

===function add_time_no_update(min) ===
~totalMinutes+=min

=== function is_time_in_range(startHour, startMin, endHour, endMin) ===
~ temp currentTime = totalMinutes
~ temp startTime = startHour * 60 + startMin
~ temp endTime = endHour * 60 + endMin

{startTime <= endTime:
{startTime} {endTime}
    {currentTime >= startTime and currentTime < endTime:
        true
    - else:
        false
    }
- else:
    0
}


//language reusability functions

===function again()===
{ResetLoop >= 1: again|}

// ===function foundBodyPart(bodypart)===
// {bodyPartsFound=="": 
//     ~bodyPartsFound = bodyPart
// -else:
//     ~bodyPartsFound = bodyPartsFound+ ", "+ bodyPart 
// }

//ui functions
=== function show_panel(location) ===
<b>\--------------------------------------------------
     🗺️  Location: {location}                 
     🕒  Time: {time()}             
    // {totalMinutes}
<b>\--------------------------------------------------

=== function show_panel_night(location) ===
<b>\--------------------------------------------------
                <b>{location}
<b>\--------------------------------------------------


