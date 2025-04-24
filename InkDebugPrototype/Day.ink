INCLUDE Functions.ink
INCLUDE Night.ink
INCLUDE SpecialKnots.ink

->GoToNode(->Bedroom)

===Bedroom===
//{minuteCalculator(7,30)}
    {show_panel("Bedroom")}
    {
    -totalMinutes>=420&&totalMinutes<435: 
        ->GoToNode(->in_bed)//7:00 to 7:15
    -totalMinutes>=435&&totalMinutes<450: ->GoToNode(->wake_up)//7:15 to 7:30
    -totalMinutes>=1080:
        ->back_from_school
    }
    =in_bed
    The bedroom has a soft glow from the morning sun.
       {totalMinutes==420: Alarm rings.}
            + (sleepin) [Stay in bed.]
            ->GoToNode(->sleep_in)
            
            + (wakeup) [Face the day.]
            ->GoToNode(->wake_up)
            
    =sleep_in
        Asuka decides to sleep in. 
        {ResetLoop==0:
        She appreciates the extra rest but now she has less time for breakfast, at least if she wants to make it in time for the meeting.
        - else:
        It's not like time is real, she might as well get some well-deserved rest.
        }
        {add_time(10)}
      {totalMinutes<=435:
            ->GoToNode(previousNode)
        -else:
            She cannot delay the day any longer.
            ->GoToNode(->wake_up)
        }
    =wake_up
        She doesn't want to be up at this early, but she has to do it.
        Asuka drags herself out of the bed.
        ->GoToNode(->get_ready)    
    =get_ready
        {ResetLoop==0:
        ASUKA: Why do I have to be up this early again? Right... the goddamned committee meeting.
        -else:
            {ResetLoop==1:
            ASUKA: I forgot to cancel the alarm I guess.
            
            -else:
            ASUKA: Couldn't the Body Search have started on any of my late mornings?
            }
        }
        
            +[Get ready.]
            {add_time(20)}
            Asuka gets ready and heads for breakfast.
            ->GoToNode(->Kitchen)
            
    =back_from_school
        Asuka is back home in her room.
        {croquetteCount:
        -4:
            MOM: Why did you bring all the croquettes back?
            ASUKA: We were playing during lunch.
        -2: 
            MOM: Why did you bring two back?
        -0:
            MOM: Did your friends like the croquettes?
        }
        
        Asuka decided to get ready for bed.
        ~totalMinutes= 0
        ->Chapel_Night
    
===Kitchen===
{show_panel("Kitchen")}
    {totalMinutes==450:
        ->Kitchen.SevenThirtyAM
    - else:
        ->Kitchen.SevenFortyFiveAM
    }
    =SevenThirtyAM
        TV: Toma Ishida of Asahi High school talks about the unfortunate incident that took a few years ago.
        
        //not "ResetLoop" but "SevenThirtyAM" because logic depends on visiting this node.
        {SevenThirtyAM==1:
        ASUKA: Wait... isn't that my school?
        }
        
        {SevenThirtyAM==2:
        ASUKA: Wait... isn't this the same news as yesterday?
        }
        ->GoToNode(->SevenFortyFiveAM)
    =SevenFortyFiveAM
    
        MOM: Good morning Asuka!
        
        {ResetLoop==1:
        ASUKA: I had a horrible nightmare...
        - else:
        ASUKA: Morning. I have a committee meeting before class today.
        }
        
        MOM: Would you like breakfast?
        
        +[Have breakfast.]
        ->GoToNode(->have_breakfast)
        
        +[Rush to school.]
        ->GoToNode(->leave_for_school)
        
    =have_breakfast
        {totalMinutes>=460: ->GoToNode(->leave_for_school)}
        ASUKA: Yes please!
        Asuka takes the plate.
        
        MOM: I am packing some pumpkin croquettes. Share them with your friends.  
        {ResetLoop==1: 
         ASUKA: Wait, again?
        }
        {add_time(15)}
        ->GoToNode(->leave_for_school)
    =leave_for_school
        ASUKA: Actually, I have to rush now.
        
        - MOM: Before you leave, here's your lunch bag!
        
        + [Take the lunch and leave.] Asuka grabs her bag and heads outside.
        {add_time(25)}
        ->GoToNode(->Road)

===Road===
{show_panel("Road")}
    {
    -totalMinutes>=480&&totalMinutes<485:
    ->cat
    -else:
    ->gossip
    }
    =cat
        Asuka sees a cat. Asuka pets it.
        ->GoToNode(->gossip)
    =gossip
        Asuka walks to school alone surrounded by people walking in groups.
     
        SCHOOL BOY 1: Hey, isn't that Rumiko from Class G? She's so hot.
     
        Across the street, Rumiko is being dropped off by her older boyfriend.
        
        +[Listen in.]
            ->GoToNode(->yuki_gossip_1)
        +[Ignore gossip and walk to school.] 
            ->GoToNode(->walk_to_school)
    =yuki_gossip_1
        Asuka decides to keep listening. She hears bits and pieces.
        SCHOOL BOY 2: You know who else is hot? Yuki.
        SCHOOL BOY 1: The Committee head? Isn't she too bossy? I feel she has too much power... 
        SCHOOL BOY 2: Yeah, someone told me she has access to every room in the building. Even more than Professor Toma himself.
            {add_time(10)}
        +[Continue listening in.]
            ->yuki_gossip_2
        +[Ignore gossip and walk to school.] 
            ->GoToNode(->walk_to_school)
        
    =yuki_gossip_2
        SCHOOL BOY 1: Isn't she a bit of a snitch too? Like, when the members were messing with Shota the other day, she wouldn't indulge.
        SCHOOL BOY 2: Nah, I mean yeah she will not involve herself in messy stuff but she doesn't tell on others either. She's very... she minds her own business.
        {add_time(10)}
        +[Continue listening in.]
            Asuka tries to listen in further, but the boys stop walking by the road and it would be too obvious if she did too.
        +[Ignore gossip and walk to school.] 
        
        -
            ->GoToNode(->walk_to_school)
        
        
    =walk_to_school
        Asuka pays no further heed to the conversation and marches to school.
    {add_time(20)}
    ->Class

===Class===
{show_panel("Class")}
    {
    -totalMinutes>=480&&totalMinutes<495: ->early
    //8:00 to 8:15
    -totalMinutes>=495&&totalMinutes<510: ->suspicious
    //8:15 to 8:30
    -totalMinutes>=510&&totalMinutes<525: ->missing_funds
    -totalMinutes>=525&&totalMinutes<540:
        ->shota_blame
    }
    =early
        // She made it before time.
        
        // Only the committee head Yuki and a few other club members are present in the class.
        
        // Yuki steps outside the class. 
        
        // +{EightFortyFiveAM}[Follow Yuki.] 
        // Asuka follows Yuki out of the classroom.
        // ->Library
        // +[Take seat.]
        // Asuka takes her seat.
        
        // ->EightFortyFiveAM
        ->DONE
        
    =suspicious
        Asuka can see something suspicious happening.
        +[Enter classroom.]
        ->GoToNode(->framing_shota)
        +[Go to the library.]
        ->GoToNode(->Library)
    =framing_shota
    
        Asuka can see 2 students hide money at a desk.
        
        {framing_shota==0:
        Asuka is confused about their actions.
        }
        
        {ResetLoop==1:
        Isn't that Shota's desk?
        }
        +[Ask them what they're doing.]
        ->confront_framers
        +[Decide to not confront.]
        ->GoToNode(->yuki_looks_for_funds)
        
    =confront_framers
        ASUKA: What are you doing?
        ->placeholder_knot
    
    =yuki_looks_for_funds
        Yuki comes back to classroom and seems to be looking for something.
        ->GoToNode(->missing_funds)
    =missing_funds
        There is commotion in the class and the committee head is speaking to everyone.
        
        YUKI: The committee funds are missing... Has anyone seen anything?
        ->GoToNode(->shota_blame)
        
    =shota_blame
        Some school boys say they saw Shota messing with the binder.
        {ResetLoop==1:
            ->GoToNode(->body_search_first_talk)
        }
        
    
        Shota gets blamed for theft.
        
        ->GoToNode(->free_class)
        
    =free_class
        Professor Ishida enters class and everyone disperses.
        
        He is their homeroom teacher as well as their librarian. He also is a little weird, Asuka is scared of him.
        PROF: Your math class has been cancelled. You can work on your other homework or study for your midterms.
        +[Read book.]
        ->GoToNode(->read_book)
    =read_book
        Asuka reads book.
        ->GoToNode(->lunch)
    =lunch
    ~totalMinutes=720
        Suddenly, the bell rings. It's lunch time.
        {ResetLoop==1:
            TAKESHIRO: Mhm... do y'all want to have lunch together?
        }
        +{ResetLoop==1}[Have lunch with others.]
        ASUKA: Sure--
        RUMIKO: Nah I'm out. Bye.
        She leaves.
        TAKESHIRO: Well, at least the three of us--
        SCHOOL BOYS: TAKESHIROOOOOO COME WITH US.
        They drag Takeshiro away.
        SHOTA:Well. It's the two of us.
        ->GoToNode(->shota_asuka_lunch)
        
        +[Have lunch with Shota.]
        ->GoToNode(->shota_asuka_lunch)
        
        +{ResetLoop>1}[Have lunch alone.]
        Asuka heads out to the field to have food alone.
        ->Field
        
    =shota_asuka_lunch
        Asuka and Shota have lunch together. 
        {savedShota:
        ->shota_thanks
        }
        ->offer_shota_croquette
        
    =shota_thanks
    SHOTA: Thanks for saving me.
    ~AsukaShota+=1
    ->GoToNode(->offer_shota_croquette)
    =offer_shota_croquette
    +[Offer croquette.]
        {AsukaShota>=1:
            Shota accepts.
            ~croquetteCount-=1
        -else:
            Shota denies.
        }
        +[Just have your own lunch in peace.]
        
        -School goes on like usual.
        ->TwoFortyFivePM
    
    =TwoFortyFivePM
        Soon, the school day is over. Asuka does her homework in the library and heads home.
        ~totalMinutes = 1080
        ->Bedroom
        
    =OneTenPM_TimeSkip
        Classes go on as usual.
        ->TwoFortyFivePM
        
===Field===
{show_panel("Field")}
->TwelveFifteenPM
    =TwelveFifteenPM
        Asuka finishes her lunch and she is full so puts her croquettes back untouched.
    
    ->Nursery

===Nursery===
{show_panel("Nursery")}
->TwelveThirtyPM
    =TwelveThirtyPM
        Asuka walks back to class through the nursery.
    
        As she is walking, she suddenly hears whispers. She first dismisses it as the wind, but she can make out the words now.
    
        "Please...."
        
        She turns back to find a little girl standing. She is holding on to a single-eyed stuff toy. 
        "Please... find my...."
        
        She looks like a normal girl but her presence in this scenario is jarring. And for some reason, she can't seem to look into her eyes.  
        -
            *Asuka tries to look up, but she only sees a red face with a toothy smile.
            "Please... find my <em>BODY</>."
        ->GoToNode(->Chapel_Night)

===Lobby===
{show_panel("Lobby")}
    {totalMinutes:
    -else: ->TwelveFortyFivePM
    }
    =TwelveFortyFivePM
        Asuka finds Takeshiro with a couple girls in the lobby. She nods at him before heading back to class.
        ~totalMinutes=885
        ->Class


===Library===
{show_panel("Library")}
Asuka finds Yuki alone in the library.

Yuki has all the keys in the school.

    *ASUKA: I need keys.
    YUKI: Yeah, here you go.
    ~keyFound = true
        **ASUKA: BTW, two of the students framed Shota
            ~savedShota = true
        **ASUKA: Uh... uh..
    *ASUKA: Uh.... uh...
    
-YUKI: ...alright.

{ResetLoop==1:
Asuka decides to stay in the library as she knows the class is ran by a sub.
- else:
Asuka decides to stay in the library
//probably a better branch later
}

+[Read book.]
Asuka reads book.

Soon it is time for lunch. 

->GoToNode(->Class.lunch)
+[Talk to librarian.]
    Asuka walks up to the librarian
    ++[Mention Body Search.]
    ASUKA: Do you know about body search?
    PROF TOMA: ...no....
    ->GoToNode(->Class.lunch)
    ++[Ask about a random book.]
    Asuka decided to not mention the body search.
    She asks him he has difficulty finding a random book.
    He gets up to get the book.
    Asuka notices a peculiar book on his table.
    +++[Look closer.]
        ->body_search_journal
    +++[Wait in silence]
        Asuka doesn't pay the book more attention and waits for Prof. Toma to bring the book back.
    -
        ->GoToNode(->go_have_lunch)
    =body_search_journal
        Asuka decides to pick up the book. It seems to be handwritten notes. The title says "Body Search".
        +[Look closer.]
            Asuka reads the book. 
            "You can take three moves before the Red Person finds you.
        +[Put the book back.]
            Asuka decices to not read further.
        -
        ->GoToNode(->go_have_lunch)
    
    =go_have_lunch
        -Prof Toma brings the book she requested. Asuka takes it and sees its almost time for lunch.
        ->GoToNode(->Class.lunch)
        
    
    
->placeholder_knot
