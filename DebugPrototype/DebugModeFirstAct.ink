INCLUDE Functions.ink

->Bedroom
===Bedroom===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Bedroom.
    Time: {time()}
    {minutes:
    -420: ->SevenAM
    -1080: ->SixPM
    }
    ->SevenAM
    =SevenAM
        Alarm rings.
            *[Sleep in and be late] Asuka sleeps in and is 15 minutes late.
            ~minutes+=15
            
            +[Wake up.] Asuka wakes up on time.
        
        - Asuka gets out of bed.
        
        {SevenAM==1:
        ASUKA: Why do I have to be up this early again? Right... the goddamned committee meeting.
        -else:
            {SevenAM==2:
            ASUKA: I forgot to cancel the alarm I guess.
            
            -else:
            ASUKA: Couldn't the Body Search have started on any of my late mornings?
            // {lockedRoomDiscovered && !talkedToYuki} Today I should talk to Yuki.
            }
        }
        
            +[Go downstairs to the kitchen.]Asuka gets ready in 30 minutes and heads down.
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
        
        +[Go to bed.] Asuka decided to get ready for bed.
        ~minutes= 0
        ->Church

===Kitchen===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
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
        
        ++[Go back to your breakfast, no response.] Asuka gives a nod and gets back to her food.
        
        +[Go to school, skip breakfast.]
        ASUKA: Nah, I'll grab a snack at school, I have to rush now.
        
        - MOM: Before you leave, here's your lunch bag!
        
        + [Go to school.] Asuka grabs her bag and heads outside.
        ~minutes+=15
        ->Road

===Road===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Main Road
    Time: {time()}

    Asuka walks to school alone surrounded by people walking in groups.
 
    SCHOOL GIRL: Hey, isn't that Rumiko from Class G? She's so hot.
 
    Across the street, Rumiko is being dropped off by her older boyfriend.
 
    *[Go slower, keep listening.] 
    ~minutes+=15
    Asuka decides to keep listening.
        SCHOOL BOY 1: He is like, what, 30? Maybe I have a chance after all...
    +[Go faster, ignore gossip.] Asuka decides to pick up her pace.
    - She pays no further heed to the conversation and marches to school.
    ~minutes+=30
        
    ->Class
    
//SCHOOL PREMISES----------------------------------------------

===Class===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Class
    Time: {time()}
    //  {minuteCalculator(12,45)}
    // Asuka steps into her classroom and walks to her desk.

    {minutes:
    -510: ->EightThirtyAM
    -525: ->EightFortyFiveAM
    -540: ->NineAM
    -720: ->TwelvePM
    -735: ->TwelveFifteenPM
    -780: ->OneTenPM_TimeSkip
    -885: ->TwoFortyFivePM
    -45: ->TwelveFortyFiveAM
    -30: ->TwelveFifteenAM
    -60: ->OneAM
    -75: ->OneFifteenAM
    }
    =EightThirtyAM
        She made it before time.
        
        Only the committee head Yuki and a few other club members are present in the class.
        
        Yuki steps outside the class. 
        
        +{lockedRoomDiscovered}[Follow Yuki.] 
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
        Isn't that Shota's desk? Were they framing him for theft?
        ~findTruthTheft = true
        }
        ->NineAM
    =NineAM
        There is commotion in the class and the committee head is speaking to everyone.
        
        YUKI: The committee funds are missing... Has anyone seen anything?
        
        {ResetLoop==1:
            Before anyone can say anything, Takeshiro barges in.
            TAKESHIRO: Where is Shota?
            
            Shota enters at the very moment. Takeshiro drags him outside. Rumiko and Asuka follow.
            
            Shota tells them about body search.
            
            They don't what to do with this information yet, they just wait for the night.
            ~knowBodySearch = true
            ~minutes = 780
            ->Class
        }
        
        Shota gets blamed for theft.
        
        ->TwelvePM
        
    =TwelvePM
    ~minutes=720
        It's lunch time.
        ~minutes+=15
        + [Go to the field.] Asuka heads out to the field to have food alone.
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
        
        
//NIGHT-------------------------------------------------------
    
    =TwelveFifteenAM
        Asuka comes across the locked cabinet
        {lockedRoomDiscovered: 
                    <> again
            -else: 
                ~lockedRoomDiscovered = true        
            }<>.
        +[Open it.]
        {keyFound:
            Asuka opens it with the key she got from Yuki.
            Inside lies a severed, shrivelled foot.
            ->END
        -else:
            Asuka needs a key for this. Maybe Yuki, the class president will have one. She comes in early to school. She should try talking to her.
        }
        ->ResetLoop
    =TwelveFortyFiveAM
      They end up in their classroom.
      
      When they're trying to find a place to hide better, they come across a locked cabinet.
      ~lockedRoomDiscovered = true
      Takeshiro gets Asuka to hide under a desk.
      
      Asuka can't see where he chose to hide but she remains quiet.
      ~minutes+=15
      ->Class
      
      =OneAM
       Wet footsteps.
       
       Takeshiro is killed by the Red Person.
       ~minutes+=15
       ->Class
       
       =OneFifteenAM
       
       Asuka is killed.
       ->ResetLoop
    
        
        
===Field===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
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
        ~minutes=780
        ->Class
    
    ->Nursery

===Nursery===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Nursery
    Time: {time()}
    {minutes:
    -750:->TwelveThirtyPM
    -15: ->TwelveFifteenAM
    -30: ->TwelveThirtyAM
    }
    //add a statement with a function that tracks which node you come from and at what time.
    =TwelveThirtyPM
    Asuka walks through the nursery.
    
    The someone with the guy is not Rumiko. Is he cheating on her?
    
    She heads to the church.
    ~minutes+=15
    ->Church
    

//NIGHT-------------------------------------------------------
    =TwelveFifteenAM
    Asuka steps out into the dark.
    
    Footsteps are heard.
    
    The last thing Asuka sees before her head is thrashed is a little faceless girl covered in red blood with a plushtoy.
    ~minutes = 420
    ->ResetLoop
    
    =TwelveThirtyAM
    Suddenly, Shota is being repeatedly thrashed against a locker.
    Takeshiro drags her out of the room.
    ->Class
    
    

===Church===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Church
    Time: {time()}
    {minutes:
    -0:->TwelveAm
    -765: ->TwelveFortyFivePM
    }
    =TwelveFortyFivePM
        The church is empty. A coffin lies on stage. 
        
        Asuka finds the door to the locker room that leads back to the school
        ->LockerRoom
        
//NIGHT-------------------------------------------------------
    =TwelveAm
        Minutes ago Asuka was in her bed and now she is in the school chapel.
        
        Everyone is there.
        
        {ResetLoop:
        -0:
        
        SHOTA: I knew it was the body search.
        
        TAKESHIRO: What are you talking about?
        
        RUMIKO: I am heading out.
        
        Rumiko leaves from the nursery exit.
        -1:
        // RUMIKO: Nope, not doing it again.
        
        // ASUKA: If you're going to leave at least don't go through that door... the Red Person is right there.
        
        // RUMIKO: Whatever.
        
        // Rumiko leaves from the other door.
        
        ASUKA: Let's split and try find the body parts.
        
        }
        ~minutes+=15
        
        ->TwelveFifteenAM
        
    =TwelveFifteenAM
    {ResetLoop:
        -0:
        A crash. Rumiko's body has been thrashed through the window.
        
        SHOTA: We're not alone, we have to run!
        
        Shota starts running towards the door leading back to the school.
        -1:
        TAKESHIRO: Where would you like to go?
        }
        
        +[Go to the door towards the nursery.]
            {ResetLoop:
            - 0:Somehow, Asuka decides to go the way Rumiko went. She wanted to find out what happened.
            -else: ASUKA: I am going to go to the nursery.
            }
            ->Nursery
         +[Go to the door towards school.]  
        {ResetLoop:
            - 0:Asuka and Takeshiro follow Shota.
            -else: ASUKA: I am going to go towards the locker room.
            }
        ->LockerRoom

===LockerRoom===
    ______________________________________________
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Locker Room
    Time: {time()}
    {minutes:
    -15: ->TwelveFifteenAM
    -30:->TwelveThirtyAM
    -765: ->TwelveFortyFivePM
    }
    =TwelveFortyFivePM
        Asuka finds Takeshiro with a couple girls in the locker room. She nods at him before heading back to class.
        ~minutes=780
        ->Class
        
//NIGHT-------------------------------------------------------
    
    =TwelveFifteenAM
    {ResetLoop:
            - 0:
            They enter the locker room and get separated between different rows of lockers.
            
            Takeshiro finds Asuka and beckons her over.
            
            //add choice that clarifies how movement works at night once you know how movement works at night.
            ~minutes+=15
            ->LockerRoom
            -else: 
            Asuka enters the locker room.
            +[Go to the classroom.]
            ~minutes+=15
            ->Class
    }
    
    =TwelveThirtyAM
        Suddenly, Shota is being repeatedly thrashed against a locker.
        Takeshiro drags her out of the room.
        ~minutes+=15
        ->Class

        //find a way to go back to the node it called from.
        
===Library===
    {knowBodySearch: Loop: {ResetLoop+1}}
    Location: Library
    Time: {time()}
    {minutes:
    -510: ->EightThirtyAM    
    }
    =EightThirtyAM
        Yuki enters the library. Asuka follows her in.
        
        ASUKA: Yuki can you give me the keys to class cabinet?
        
        YUKI: How can I trust you?
        
        +[Try convince her] ASUKA: You can trust me.
        YUKI: No.
        +{findTruthTheft}[Expose Shota being framed for theft].
        ASUKA: Shota's being framed for theft.
        Yuki: Oh wow... Okay I trust you I guess. Here are the keys.
        ~keyFound = true
        
    -Asuka heads back to class.
        
        ~minutes+=15
        ->Class
        

->END
