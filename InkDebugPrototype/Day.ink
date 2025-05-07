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
    //should only print once per loop
        {in_bed<=ResetLoop+1: It's a bright new day.}
        The bedroom has a soft glow from the morning sun.
        
        {totalMinutes==420: The alarm rings.}
            +[Stay in bed (10 minutes).]
            ->GoToNode(->sleep_in)
            
            +[Face the day.]
            ->GoToNode(->wake_up)
            
    =sleep_in
        Asuka decides to sleep in a little more. 
        {sleep_in<=ResetLoop+1:
            {ResetLoop<=1:
            Surely there was a reason she set her alarm this early. Whatever it was, it doesn’t feel important now.
            - else:
            It's not like time is real, she might as well get some well-deserved rest.
            }
        }
        {add_time_passive(10)}
        ->GoToNode(->Bedroom)

    =wake_up
        She doesn't want to be up this early, but she has to do it.
        Asuka drags herself out of the bed.
        ->GoToNode(->get_ready)    
    =get_ready
        {ResetLoop==0:
        ASUKA: Why the hell am I up this early...? Oh. The 8:30 committee meeting.

        -else:
            {ResetLoop==1:
            ASUKA: I forgot to cancel the alarm I guess.
            
            -else:
            ASUKA: Couldn't the Body Search have started on any of my late mornings?
            }
        }
        
            +[Get ready (15 minutes).]
            Asuka changes into her uniform and gets ready for the day.
            {add_time_active(15)}
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
    {
    -totalMinutes<=455:
        ->GoToNode(->news)
    - else:
        ->GoToNode(->chat_with_mom)
    }
    
    =news
        Asuka hears the news blaring from the TV as she walks downstairs.
        {
        -totalMinutes<440:
            ->GoToNode(->news_1)
        - else:
            ->GoToNode(->news_2)
        }
    =news_1
    {TomaStatement==0:
            A MAN: <>->GoToNode(->TomaStatement)
        -else:
            PROF TOMA: <><>->GoToNode(->TomaStatement)
        }
    
    =TomaStatement
        The Body Search has been going on for a decade now. It restarts every time it ends with a new body.
        {TomaStatement==1:
            Asuka's ears perk up with recognition. The voice sounds familiar.
        }
    ->GoToNode(->news_2)
    
    =news_2
        REPORTER: It’s been two weeks since Mio Takeda disappeared — the third schoolgirl to go missing. A professor at Asahi High School claims the cases are linked by something he calls the “Body Search.”
        
        {news_2==1:
            ASUKA: That's my school...
        }
        ->GoToNode(->same_news)
        =same_news
            {news_2==2&&ResetLoop==1:
                ASUKA: Wait... isn't this the same news as yesterday?
            }
    
        ->GoToNode(->chat_with_mom)
    =chat_with_mom
    
    MOM: Asuka! You're up early! Doesn't class start at 9?
        
        {ResetLoop==1:
        ASUKA: I just had a horrible nightmare... I don't want to talk about it. What's for breakfast?
        - else:
        ASUKA: I have a committee meeting before class today so I have to get there early.
        }
        
        MOM: Ah... I made omelette for breakfast. Would you like some?
        
        +[Have breakfast (15 minutes).]
        ->GoToNode(->have_breakfast)
        
        +[Rush to school.]
        ->GoToNode(->leave_for_school)
        
    =have_breakfast
        ASUKA: Yes, please!
        
        Asuka walks over to the counter and helps herself.
        
        ASUKA: Oh is that my lunch you were packing? Why are there two boxes?
        
        MOM: Those are the pumpkin croquettes from yesterday... I made too many, so share them with your friends, okay?
        
        {ResetLoop==1: 
         ASUKA: Wait, again?
         
         MOM: What have I told you about using ungrateful language for food?
        }
        Asuka just nods noncommittally at that and focuses on her breakfast. 
        {add_time_passive(15)}
        ->GoToNode(->leave_for_school)
        
    =leave_for_school
        Her phone buzzes, letting her know that it's time to leave if she wants to catch the next bus.
        
        ASUKA: Actually, I have to rush now if I want to get to school on time.
        
        MOM: Before you leave, here's your lunch bag!
        
        + [Take the lunch and leave.] Asuka grabs her bag and jogs to the bus stop down the block.
        {add_time_passive(5)}
        ->GoToNode(->BusStop)
        
===BusStop===
    {show_panel("Bus Stop")}
    
    Asuka doesn't have to wait a lot before a bus appears.
        {
        -totalMinutes<=450:->early_bus
        -else:
        ->normal_bus
        }
    =early_bus
        ~totalMinutes = 450
            It’s the 7:30 bus, nearly empty, like always. Just two students sit near the front, whispering.
            
            She walks past them and takes a seat in the back.
            
            {ResetLoop<=1: 
                She would have been able to make it to committee meeting even with the next bus, but as she was up she might as well finish her homework. She hated studying at home.
            }
            {needKey==true: 
                She needs to find Yuki and ask her for the classroom keys.
            } 
                
            The motion of the bus and the quiet hum of the road pull her into a light nap.
                ->GoToNode(->get_off_bus)
            
    =normal_bus
        ~totalMinutes=480
        It’s the 8 a.m. bus, mostly full. Students are talking, laughing, half-turned in their seats.
    
        Asuka steps on, head down. She squeezes past a crowded row and finds an empty one near the middle.
    
        She slides into the window seat and puts on her headphones to appear occupied. 
        //takeshiro + rumiko
        ->GoToNode(->get_off_bus)

    // Up ahead, two boys are talking, their voices cutting through the rest.

    // SCHOOL BOY 1: Hey, isn’t that Rumiko from Class G?

    // Asuka glances out the window. Across the street, Rumiko is being dropped off by an older guy.

    // +[Listen in.]
    //     ->GoToNode(->placeholder_knot)
    // +[Look out the window and tune it out.]
    //     ->GoToNode(->placeholder_knot)

    =late_bus
        ->GoToNode(->placeholder_knot)
    =get_off_bus
     {add_time_passive(25)}
    Before Asuka realized, the bus was pulling into the gravel-laden school parking lot.
    She gets off with other students and heads to her class.
    {add_time_no_update(5)}
        ->GoToNode(->Class)
===Road===
{show_panel("Campus Bridge")}
    {
    -totalMinutes<485:
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
            {add_time_passive(10)}
        +[Continue listening in.]
            ->yuki_gossip_2
        +[Ignore gossip and walk to school.] 
            ->GoToNode(->walk_to_school)
        
    =yuki_gossip_2
        SCHOOL BOY 1: Isn't she a bit of a snitch too? Like, when the members were messing with Shota the other day, she wouldn't indulge.
        SCHOOL BOY 2: Nah, I mean yeah she will not involve herself in messy stuff but she doesn't tell on others either. She's very... she minds her own business.
        {add_time_passive(10)}
        +[Continue listening in.]
            Asuka tries to listen in further, but the boys stop walking by the road and it would be too obvious if she did too.
        +[Ignore gossip and walk to school.] 
        
        -
            ->GoToNode(->walk_to_school)
        
        
    =walk_to_school
        Asuka pays no further heed to the conversation and marches to school.
    {add_time_passive(20)}
    ->Class
    
===Class===
{show_panel("Class")}
    {
    -totalMinutes<495: ->early
    //8:00 to 8:15
    -totalMinutes>=495&&totalMinutes<510: ->suspicious
    //8:15 to 8:30
    -totalMinutes>=510&&totalMinutes<525: ->missing_funds
    -totalMinutes>=525&&totalMinutes<540:
        ->shota_blame
    }
    =early
        
        Asuka enters the classroom while it's still mostly empty. 
        
        YUKI: Oh hi Asuka. Are you early for the meeting? It doesn't start until 8:30.
        
        ASUKA: Ah I know, I just wanted to get some homework done early.
        
        YUKI: Okay, see you soon then. I am going to work in the library.
        
        Yuki takes her side bag and heads to the library.
        
                +[Follow Yuki.] 
                Asuka decides to go after Yuki.
                {add_time_no_update(5)}
                ->Library
                +[Take seat.]
                Asuka takes her seat.
                
                ->GoToNode(->suspicious)
                ->DONE
        
    =suspicious
        Asuka can see something suspicious happening.
        +[Stay in classroom.]
        ->GoToNode(->framing_shota)
        +[Go to the library.]
        Asuka decides to ignore that and go to the library. She needs to find a book.
        ->GoToNode(->Library)
    =framing_shota
        ~knowAboutFramedTheft = true
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
ASUKA: That’s not your desk.

No reaction. The boy keeps rummaging through his bag. The girl is bent over the drawer, slipping something inside. Neither looks at her.

ASUKA: Hey.

Still nothing. Like she isn’t even in the room.

+ [Let it go.]
    ->GoToNode(->yuki_looks_for_funds)

+ [Say it louder.]
    ASUKA (sharper): That’s Shota’s desk. What are you doing?

    The girl straightens, slowly. Her expression is flat — vaguely annoyed.

    GIRL: Do you *mind*?

    BOY: Who even is this?

    GIRL (mocking): Aw, is this your big moment?

    ++[Be assertive: “Take the money back.”]
        ASUKA: You need to take the money back. Right now.

        BOY: Or what?

        He takes a step toward her. Not touching. Just enough to make the air feel thinner.

        GIRL: You really don’t want to get involved.

        Before either can say more, the door creaks open.

        TAKESHIRO: What’s going on?

        He’s calm, but there’s an edge in his voice. The boy steps back. The girl snatches something from the drawer.

        BOY: Nothing.

        GIRL: We were just leaving.

        They brush past Asuka without looking at her.
        
        Asuka goes back to her work, but is too wired to focus. She spaces out.
        
        {add_time_passive(30)}

        ->GoToNode(->Class)

    ++ [Stay quiet.]
        Asuka lowers her eyes. The girl scoffs.

        GIRL: Thought so.

        They keep working like she was never there.

        ->GoToNode(->yuki_looks_for_funds)

    
=yuki_looks_for_funds
        Yuki comes back to classroom and seems to be looking for something.
        ->GoToNode(->missing_funds)
    =missing_funds

    
        {savedShota!=true:
            When Asuka is back in class, there seems to be a lot of commotion. The meeting must have started. She can see Yuki, the committee head on the teacher's stage addressing everyone, but she looks a little stressed.
    
    CLASSMATE 3: Someone stole the festival money?
    
    YUKI: The envelope was right here this morning... I am not sure where it could have gone.
    
    CLASSMATE 4: Who else came in early? Did anyone see anything?
        
        ->GoToNode(->shota_blame)
         -else:
            The classroom buzzes with casual chatter as Yuki steps to the front, clipboard in hand.

YUKI: Before we begin, just a quick note—moving forward, the festival funds will be kept in the office safe. Only staff will have access.

            Shota looks at Asuka in recognition.
        }
        ->GoToNode(->free_class)
        
    =shota_blame
    CLASSMATE 1: Isn't Shota here every morning at like 7 am? Where is he?
    
    CLASSMATE 2: There he is, SHOTA!
    
    {ResetLoop:
    -0: ->GoToNode(->shota_gets_blamed)
    -1:
        ->GoToNode(->body_search_first_talk)
    }
            Everyone looks up as the spectacled boy enters through the classroom door.

SHOTA: Let me guess, you want to see what’s in my desk?

The students pause, startled.

SHOTA: Go ahead. I’ll save you the trouble.

He walks to the desk and starts pulling things out: book, pencil box, lunch, and finally, the envelope.

CLASSMATE 3: Did he just admit to theft?
->GoToNode(->free_class)

       
        
    =free_class
        Professor Ishida enters class and everyone disperses.
        PROF ISHIDA: Your math class has been cancelled. You can work on your other homework or study for your midterms.
        +[Read book.]
        ->GoToNode(->read_book)
    =read_book
        Asuka doesn't want to study or do her homework anymore. She decides to read her book to pass the time. 
        
       <em> “There’s nothing like deep breaths after laughing that hard. Nothing in the world like a sore stomach for the right reasons.”
       <em>Charlie reflects on moments of pure joy with his friends, Sam and Patrick.
       +[Keep reading.]
       <em> Their shared experiences—driving through tunnels, listening to music, and engaging in heartfelt conversations—highlight the profound impact of friendship during formative years. 
       +[Space out.]
       Asuka's eyes glaze over the words and she stares out the window. She can see a group of students laughing and playing football on the field.
-
        ->GoToNode(->lunch)
        
    =lunch
    ~totalMinutes=720
        Suddenly, the bell rings. It's lunch time.
        
        {ResetLoop==1:
            TAKESHIRO: Mhm... do y'all want to have lunch together?
        }
        +{ResetLoop==1}[Have lunch with others.]
               ASUKA: Sure—
        
        RUMIKO: Nope. I'm out. Bye.
        
        She turns and leaves without a second thought.
        
        TAKESHIRO: Well... at least the three of us—
        
        SCHOOL BOY: TAKESHIRO! Yo, come with us! Let's play football!
        
        Takeshiro barely turns before they swarm him.
        
        TAKESHIRO: Wait, what—? Hey!
        
        They pull him off down the hall, mid-protest.
        
        SHOTA:  
        ...And then there were two.
        ->GoToNode(->shota_asuka_lunch)
        
        +{ResetLoop>1}[Have lunch with Shota.]
        ->GoToNode(->shota_asuka_lunch)
        
        +(lone_lunch)[Have lunch alone.]
        Asuka watches as chatter fills the classroom. {lone_lunch==1: The uniform classroom seating is disrupted as students walk over to each other's desks to chat.}
        Asuka decides that it's a nice day to eat outside in peace and quiet. She heads out to the field to have her lunch.
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
->lunch_alone
    =lunch_alone
        Asuka smiles at the sun she takes a seat on the bench surrounding the football field. 
        ->GoToNode(->football_boys)
    =football_boys    
        She takes out her lunch box cherishes a couple moments of peace before slaps of sneakers and hollers of the school boys from earlier fill the air. 
        Asuka almost gets up to leave, when she hears a familiar voice.
        TAKESHIRO: We're doing two versus two again?
        
        She sighs decides to just have her meal, watching the game unfold.
        //takeshiro
        ~add_time_passive(30)

        ->GoToNode(->unfinished_croquettes)

    =unfinished_croquettes
            The boys seem to be nearly done with their game, as Asuka packs up her lunchbox. She stares at her unopened container of pumpkin croquettes. She sighs and puts them back inside the bag as well. 
    
    She starts heading back to class.
    
    +[Cut across the field.]
    Asuka starts cutting across the field to go back to the school building, when she makes eye contact with Takeshiro and halts.
    
    Asuka gives him a quick clipped smile and decides to walk through the nursery after all.
    
    +[Walk through the nursery.]
    
    Asuka looks at the boys still standing on the field and decides to walk through the nursery to get back to the school building.
    -
    ->Nursery

===Nursery===
{show_panel("Nursery")}
->TwelveThirtyPM
    =TwelveThirtyPM
    
    The nursery is cooler than outside, shaded by overgrown leaves and moss-covered stone. It’s usually cold, but something in the air feels stiller, more pressed-in.
    
    As Asuka walks, a whisper drifts past her ear. She pauses, thinks it’s the wind—
    until the sound sharpens into words.
    
    “Please…”
    
    Her steps still, her body freezes. It sounds like a little girl, but it echoes and scrapes in a way that a human voice does not.
        +[Turn around.]
            ->GoToNode(->please_find_my_body)
    +[Stay still.]
    
        “Please… find my…”
    
    The hollow words echo, filling the air. The atmosphere tightens around her. She can’t move.
            
    ++[Stay still.]
    Her feet won’t move. She squeezes her eyes shut, but that only sharpens her hearing.
A faint rustle. A step.
Then something brushes her shoulders, cold, light, not quite there.
    +++[Turn around.]
                ->GoToNode(->please_find_my_body)
    
    =please_find_my_body
    Slowly, stiffly, she turns.
    
    A girl stands there, holding a one-eyed stuffed toy. Still. Silent.
    
    She looks like a child. But Asuka’s eyes won’t meet hers.
    Something resists. Something inside says don’t.
    
    She forces herself to look.
    
    Asuka tries to meet her eyes, but there’s nothing to meet.
Just a red smear, stretched wide into a grin full of teeth.
    
    “Please… find my body.”

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
{
    -totalMinutes<510: ->asuka_yuki_interaction
}    
    =asuka_yuki_interaction
        Asuka finds Yuki alone in the library.
        
                
        YUKI: Oh hi Asuka! Do you like working at the the library too?
        
        ASUKA: Yeah, I find the quiet helps me focus.
        
        YUKI: Especially this early when there's nobody here! You can sit with me, if you'd like.
        
        Asuka takes a seat beside and Yuki and they work in silence
        
        {needKey == true &&keyFound!=true:
            ->GoToNode(->ask_yuki_keys)
        }
        
        {knowAboutFramedTheft == true &&savedShota!=true:
            ->GoToNode(->tell_yuki_theft)
        }
        
        {add_time_passive(20)}

        ->GoToNode(->stay_or_class)

    =stay_or_class  
    //~add_time_passive(20)
        YUKI: Oh... it's nearly time for the meeting. I will leave early to prepare. Hope I will see you there soon!
        
        +[Go to class.]
            Asuka decides to follow Yuki back to class after a bit.
            {add_time_no_update(5)}
            ->GoToNode(->Class)
        +[Stay in library.]
            Asuka doesn't feel like going to class.
            ->GoToNode(->stay_in_library)
            
    =stay_in_library
        {ResetLoop==1:
        Asuka decides to stay in the library as she knows the class is ran by a sub.
        - else:
        Asuka decides to stay in the library
        //probably a better branch later
        }
        
        +[Read book.]
        //maybe 15 minute loops with options to do more stuff
            Asuka reads book.
            
            Soon it is time for lunch. 
            
            ->GoToNode(->Class.lunch)
        +[Talk to librarian.]
            Asuka walks up to the librarian
            ++{body_search_first_talk>=1}[Mention Body Search.]
            ASUKA: Do you know about body search?
            PROF TOMA: ...no....
            ->GoToNode(->Class.lunch)
            ++[Ask about the book she wanted.]
            {body_search_first_talk>=1 : 
                Asuka decided to not mention the body search.
            }
            She asks him he has difficulty finding the book.
            He gets up to get the book.
            Asuka notices a peculiar book on his table.
            +++[Look closer.]
                ->GoToNode(->body_search_journal)
            +++[Wait in silence]
                Asuka doesn't pay the book more attention and waits for Prof. Toma to bring the book back.
            -
                ->GoToNode(->go_have_lunch)
                
    =tell_yuki_theft
        +ASUKA: BTW, two of the students framed Shota
            ~savedShota = true
        +ASUKA: Uh... uh..
        -
        ->GoToNode(->Library)
        
    =ask_yuki_keys    
        Yuki has all the keys in the school.
            +ASUKA: I need keys.
                YUKI: Why do you need them?
                
                ++ASUKA: I am on class cleaning duty this week and I lost my copy.
                    YUKI: Okay, here you go.
                    ~keyFound = true
                ++ASUKA: I think I deserve them more than you.
                    YUKI: Mhm... no.
                -
                ->GoToNode(->stay_or_class)
    
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
