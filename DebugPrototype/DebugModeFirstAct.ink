INCLUDE Functions.ink

->Bedroom
===Bedroom===
    ______________________________________________
    Location: Bedroom.
    Time: {time()}
    {minutes:
    -420: ->SevenAM
    -1080: ->SixPM
    }
    ->SevenAM
    =SevenAM
        Alarm rings.
            * Asuka sleeps in and is 15 minutes late.
            ~minutes+=15
            
            *Asuka wakes up on time.
        
        - Asuka gets out of bed.
        {SevenAM==1:
        ASUKA: Why do I have to be up this early again? Right... the goddamned committee meeting.
        -else:
            {SevenAM==2:
            ASUKA: I forgot to cancel the alarm I guess.
            
            -else:
            ASUKA: Couldn't the Body Search have started on any of my late mornings?
            }
        }
        
            +Asuka gets ready in 30 minutes and heads down.
            ~minutes+=30
            ->Kitchen
    =SixPM
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
        ~minutes= 0
        ->Church
        
        


===Kitchen===
    ______________________________________________
    Location: Kitchen.
    Time: {time()}
    {minutes==450:
        ->Kitchen.SevenThirtyAM
    - else:
        ->Kitchen.SevenFortyFiveAM
    }
    =SevenThirtyAM
        ~minutes+=15
        TV: Toma Ishida of Asahi High school talks about the unfortunate incident that took a few years ago.
        
        //not "ResetLoop" but "SevenThirtyAM" because logic depends on visiting this node.
        {SevenThirtyAM==1:
        ASUKA: Wait... isn't that my school?
        }
        
        {SevenThirtyAM==2:
        ASUKA: Wait... isn't this the same news as yesterday?
        }
        ->SevenFortyFiveAM
    =SevenFortyFiveAM
    
        MOM: Asuka! You're up early.
        
        {ResetLoop==1:
        ASUKA: I had a horrible nightmare.
        - else:
        ASUKA: I have a committee meeting before class.
        }
        
        MOM: Would you like breakfast?
        
        +[Have breakfast.]
        ~minutes+=15
        Asuka takes the plate.
        
        MOM: I am packing some pumpkin croquettes. Share them with your friends.
        
        {ResetLoop==1: 
        ASUKA: Wait, again?
        }
        
        ++[Nod noncommitally.] Asuka gives a nod and gets back to her food.
        
        +[Rush to school.]
        ASUKA: Nah, I'll grab a snack at school, I have to rush now.
        
        - MOM: Before you leave, here's your lunch bag!
        
        + [Take the lunch and leave.] Asuka grabs her bag and heads outside.
        ~minutes+=15
        ->Road

===Road===
    ______________________________________________
    Location: Main Road
    Time: {time()}

    Asuka walks to school alone surrounded by people walking in groups.
 
    SCHOOL GIRL: Hey, isn't that Rumiko from Class G? She's so hot.
 
    Across the street, Rumiko is being dropped off by her older boyfriend.
 
    +[Ignore gossip and walk to school.] 
    *[Listen in.]
    ~minutes+=15
    Asuka decides to keep listening.
        SCHOOL BOY 1: He is like, what, 30? Maybe I have a chance after all...
    
    - Asuka pays no further heed to the conversation and marches to school.
    ~minutes+=30
    ->Class

===Class===
    ______________________________________________
    Location: Class
    Time: {time()}
    {minuteCalculator(13,00)}
    Asuka steps into her classroom and walks to her desk.

    {minutes:
    -510: ->EightThirtyAM
    -525: ->EightFortyFiveAM
    -540: ->NineAM
    -720: ->TwelvePM
    -735: ->TwelveFifteenPM
    -780: ->OneTenPM_TimeSkip
    -885: ->TwoFortyFivePM
    }
    =EightThirtyAM
        She made it before time.
        
        Only the committee head Yuki and a few other club members are present in the class.
        
        Yuki steps outside the class. 
        
        +{EightFortyFiveAM}[Follow Yuki.] 
        Asuka follows Yuki out of the classroom.
        ->Library
        +[Take seat.]
        Asuka takes her seat.
        
        ->EightFortyFiveAM
        
    =EightFortyFiveAM
        Time passes.
        
        After a bit, Asuka can see 2 students hide money at a desk.
        
        {ResetLoop==0:
        Asuka is confused about their actions.
        }
        
        {ResetLoop==1:
        Isn't that Shota's desk?
        }
        ->NineAM
    =NineAM
        There is commotion in the class and the committee head is speaking to everyone.
        
        YUKI: The committee funds are missing... Has anyone seen anything?
        
        Shota gets blamed for theft.
        
        ->TwelvePM
        
    =TwelvePM
    ~minutes=720
        It's lunch time.
        ~minutes+=15
        + Asuka heads out to the field to have food alone.
        ->Field.
        +{AsukaShota>0} Asuka asks Shota if he'd like to have lunch with her.
        ->TwelveFifteenPM
        
    =TwelveFifteenPM
        Asuka and Shota have lunch together. Shota takes one of her croquettes. She also has one with him.
        ~croquetteCount-=2
        
        School goes on like usual.
        ->TwoFortyFivePM
    
    =TwoFortyFivePM
        Soon, the school day is over. Asuka does her homework in the library and heads home.
        ~minutes = 1080
        ->Bedroom
        
    =OneTenPM_TimeSkip
        Classes go on as usual.
        ->TwoFortyFivePM
        
===Field===
    ______________________________________________
    Location: Field
    Time: {time()}
    {minutes:
    -735:->TwelveFifteenPM
    }
    =TwelveFifteenPM
        Asuka finishes her lunch and puts her croquettes back untouched.
        
        She sees Rumiko's boyfriend at the nursery with someone when she is heading back.
        ~minutes+=15
        
        +[Go the longer route, through the nursery.] She decides to go back the longer route, through the nursery.
        ->Nursery
        +[Go back the shorter route.] She decides to go straight back to the building.
        ~minutes=885
        ->Class
    
    ->Nursery

===Nursery===
    ______________________________________________
    Location: Nursery
    Time: {time()}.
    {minutes:
    -750:->TwelveThirtyPM
    }
    =TwelveThirtyPM
    Asuka walks through the nursery.
    
    The someone with the guy is not Rumiko. Is he cheating on her?
    
    She heads to the church.
    ->Church

===Church===

    ______________________________________________
    Location: Church
    Time: {time()}.
    {minutes:
    -0:->TwelveAm
    -else: ->TwelveFortyFivePM
    }
    =TwelveFortyFivePM
        The church is empty. A coffin lies on stage. 
        
        Asuka finds the door to the locker room that leads back to the school
        ->LockerRoom
    =TwelveAm
        Minutes ago Asuka was in her bed and now she is in the school chapel.
        
        Everyone is there.
        
        SHOTA: I knew it was the body search.
        
        TAKESHIRO: What are you talking about?
        
        RUMIKO: I am heading out.
        
        Rumiko leaves from the nursery exit.
        ~minutes+=15
        
        ->TwelveFifteenAM
        
    =TwelveFifteenAM
        A crash. Rumiko's body has been thrashed through the window.
        
        SHOTA: We're not alone, we have to run!
        
        Asuka and Takeshiro follow Shota.
        ~minutes+=15
        ->LockerRoom

===LockerRoom===
    ______________________________________________
    Location: Locker Room
    Time: {time()}.
    {minutes:
    -30:->TwelveThirtyAM
    -else: ->TwelveFortyFivePM
    }
    =TwelveFortyFivePM
        Asuka finds Takeshiro with a couple girls in the locker room. She nods at him before heading back to class.
        ~minutes=885
        ->Class
    
    =TwelveThirtyAM
        
        


->ResetLoop
===Library===
=EightThirtyAM
Yuki enters the library. Asuka follows her in.

->END
