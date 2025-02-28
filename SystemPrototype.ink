//game trackers
VAR day=0
VAR bodypartsFound = ""

VAR isRedPersonAlert=false
VAR keyPossessed = false
VAR classroomDiscovered = false

->WalkToSchool
===WalkToSchool===
~ day += 1
____________________________________________
Body parts found: {bodyParts()}.

Asuka walks to school{again()}.
    *{day==2}She finds Shota, Takeshiro and Rumiko in the corridor huddled. 
    SHOTA: We are stuck in the body search.
    ->TwelveAm
    *{classroomDiscovered} Asuka knows that the committee head has the key to the classroom.
        **Asuka distracts committee head.
          ***Asuka taes this chance to take money out of Shota's desk and saves him.
            ****Asuka uses the found money as evidence to blackmail committee and gets the keys.
            Asuka heads home with keys in her pocket.
            ~keyPossessed = true
            ->TwelveAm
          ***Asuka takes this chance to steal the keys from committee head's desk.
          ~keyPossessed = true
            ->TwelveAm
    + She goes through the day as she always does.
    ->TwelveAm
===TwelveAm===
When she goes to sleep at 12, she wakes up in the school chapel with Shota, Takeshiro and Rumiko {again()}.
    ->BackInTheChapel

// Asuka watches Rumiko get off the bike with her boyfriend {again()}.
// Asuka hears{the()} 2 guys gossiping about Rumiko.
//     *Asuka decides to keep listening.
//     ~keepListening = true
//     *{keepListening} Asuka decides to shout out to Rumiko, interrupting the conversation.
//     *Asuka decides to ignore the conversation and look at the cat.
//     ~lookCat = true
//     *{lookCat} Asuka decides to pick up the cat.
// - Asuka reaches school.

===BackInTheChapel===
~isRedPersonAlert = false
They can hear someone's wet footsteps approaching them.
    +Go to library.
    ->Library
    +Go to the field.
    ->Field.
    
===Field===
Asuka runs across the field and enter the building through the other end. She finds herself in the corridor with your classroom.
->Classroom


===Library===
The lights start flickering, Asuka can see the corridor goes dark.
~isRedPersonAlert = true
    +{!keyPossessed}Hide between the shelves.
    {day==1:
    Something touches Asuka's shoulder.
    }
    **{day>1}Is it a body part?
        Asuka looks behind to find a leg lodged between two books.
        ~bodypartsFound = bodypartsFound + " leg "
    **Asuka decides to ignore that.
    -- Asuka can hear wet footsteps.
    Everyone dies.
    ->WalkToSchool
    +Go out to the corridor.
    ->Classroom

===Classroom
{isRedPersonAlert==true:
~classroomDiscovered = true
In the darkness, Asuka can hear wet footsteps. Asuka realizes she's in her class corridor and tries entering the room, but finds it locked.

    Everyone dies.
->WalkToSchool
- else:
    ~classroomDiscovered = true
    {keyPossessed==true:
    You find the hand.
    ~bodypartsFound = bodypartsFound + " hand"
    ->WalkToSchool
    -else:
    You find the door locked. Red Person finds you. Everyone dies.
    ->WalkToSchool
    }
}
    

===function again()===
{day > 1: again|}

===function the()===
{day>1: the|}

===function bodyParts()===
{bodypartsFound=="": 0|{bodypartsFound}}
