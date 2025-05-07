
===first_knot===
It's a bright new day.
    ->GoToNode(->Bedroom)
===body_search_first_talk===
     Takeshiro bursts inside the class and before anyone can say anything to Shota, grabs him and takes him out of the room.

    Rumiko perks up, looks expectantly at Asuka, and follows Takeshiro.
    
    TAKESHIRO: What the fuck is Body Search? Tell us everything...
    
    SHOTA: The ones that are chosen, have to find the victim's secret, severed body parts.

    ASUKA: Secret?

    SHOTA: Uh...
    
    Shota looks at his phone and types something. 
    
    SHOTA: Hidden might be a better word... I'm still, uh, sorta translating all the details…

    RUMIKO: Wait. Is that Russian?
    
    She is peeking at his phone.

    SHOTA: The Body Search starts exactly at midnight. Run away from the Red Person.

    ASUKA: That's the thing we saw last night...

    RUMIKO: Okay, so why is today a repeat of yesterday?

    SHOTA: Until the Body Search is complete, this is our only day.
        ->GoToNode(->Class.lunch)

===shota_gets_blamed===
    Everyone looks at the spectacled boy entering through the classroom door. 
    
    SHOTA: Huh?
    
    He pushes his glasses up his nose and makes his way to the desk.
    
    CLASSMATE 1: Show us what you got in your desk.
    
    SHOTA: I don't understand...
    
    They don't wait for his consent as they start rummaging the contents under his desk. 
They take out his book, pencil box, lunch, and finally an envelope: the commitee fund for the festival.

    CLASSMATE 2: Shota stole the festival cash!
    
    CLASSMATE 3: That's really messed up, Shota.
    
    SHOTA: No, no, no, no! I don't know who put it there! Give me my stuff back.
    
    CLASSMATE 1: You're very protective of that book... what is in it? Is this where you plan your little heists? Let's see... What the--
    
    SHOTA: I said give me my stuff back!!!
    
    Shota snatches his book, his lunch and his other stuff and starts putting it back.
    
    CLASSMATE 1: What the hell is Body Search? You freak--
    
    PROF ISHIDA: Ahem. Language.
    //no GoToNode flag
    ->Class.free_class
    
===rumiko_death===
 Suddenly, there is a loud and echoing crash.
    Asuka turns pale and her legs lock as she sees Rumiko's body hanging limp off the chapel window. Glass shards drip with fresh blood from where they pierce her torso.
    
    TAKESHIRO: WHAT THE FUCK... WHAT THE FUCK WHAT THE FUCK---
    
    Shota looks like he is about to cry.
    
    SHOTA: We got to go. The Red Person is here.
    
    TAKESHIRO: WHO THE FU---
    
    Asuka starts running instinctively, and Shota follows after.
    
    SHOTA: No time, RUN.
    ->GoToNode(previousNode)
    
    
===shota_death===
In a blink, the Red Person appears behind Shota and drives its claws into his spine.
It twists his head off in one motion, blood spraying as his body drops like a cut string.
->asuka_death_reaction
===takeshiro_death===
Suddenly, the Red Person lunges from the wall and clamps onto Takeshiro’s neck and gut.
It rips him open from stomach to sternum, organs spilling as he crumples forward.
->asuka_death_reaction

=== asuka_death_reaction ===
~temp r =  RANDOM(0,4)

{r:
-0: Asuka bites down the scream rising in her throat.
-1: Asuka locks her jaw, refusing to freeze.
-2: Asuka blinks back tears and forces her legs to move.
-3: Asuka clamps her hands into fists and bolts forward.
-4: Asuka swallows the panic clawing up her chest.
}

If she stops now, she dies too. 
-> GoToNode(previousNode)

=== done ===
-> asuka_death_reaction
