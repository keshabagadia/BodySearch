===Chapel_Night===
{show_panel_night("SCHOOL CHAPEL")}
{movesTaken==0:
    ->body_search_start
    }
Asuka is back in the chapel.
->GoToNode(->choices)
=body_search_start
The room is tall and narrow, dust motes drifting in streams of moonlight. 

She’s certain she wasn't here moments ago, and just as certain she’s here in this moment.

Asuka’s brain folds in on itself, trying to reconcile the dissonance. But her heart is inexplicably still, somehow at ease with a reality that refuses to make sense.

It's too dark for her to see, but she can hear voices.
            {ResetLoop:
                -0: ->first_time
                -else:
                    Everyone except Rumiko.
                    ->prep
                
            }
    =first_time
    {set_companion("Rumiko")}
    {set_companion("Shota")}
    {set_companion("Takeshiro")}
    +[Try to see.]
    Asuka blinks, her eyes adjusting to the dark.
    +[Try to go back to sleep.]
    Asuka tries to press her eyes close, willing this strange nightmare away. But she can't.
    -
        She can see two figures.
        
        TAKESHIRO: Shota... Can you please stand still?
        
        Shota pays him no heed as he continues to circle around the room, mumbling to himself.
        
        SHOTA: No... no... no... this isn't happening. This has to be a dream...
        
        ASUKA: Takeshiro?
        
        TAKESHIRO: Asuka... you too?
        
        Rumiko bursts in from the side aisle, frantic and wide-eyed.
                
        RUMIKO: What the fuck is going on??? Why am I here? Why are <em>you</em> guys here?
        
        +[Mention the red person.]
        ASUKA: Um...did you all see the red person too?
        +[Stand in silence.]
        TAKESHIRO: I was walking back home and suddenly... I was here.
      -  
        Shota abruptly stops his chanting to audibly gasp.
        SHOTA: The red person...
        
        RUMIKO: Absolutely not. This is some freak prank... I am heading out.
        
        ASUKA: Rumiko wait let's---
        Rumiko pivots and storms towards the side exit as the darkness swallows her.
        
        TAKESHIRO: What now...
        
        ->GoToNode(->choices)
        
        Suddenly, a crash. Rumiko's body has been thrashed through the window.
        
        SHOTA: We're not alone, we have to run!
        
        Shota runs towards the lobby connecting the school with the chapel.

    =prep
        ASUKA: We should try and search for the body I guess....
        +[Ask Takeshiro to join.]
            Asuka is too shy to ask Takeshiro to join her.
        +[Ask Shota to join.]
        {AsukaShota>=1:
        ->GoToNode(->shota_helps)
        }
            Asuka asks Shota to come with her, but he says it's better to split and work.
            Asuka senses it's because he doesn't trust her.
            
        - What should Asuka do next?
        ->GoToNode(->choices)
    
    =shota_helps
        SHOTA: I can't help you but I can buy you time. 
        //do audience need to know how many bonus moves they get? is it a good intrigue? maybe higher the relationship ->more bonus moves? does obfuscation help?
        ~bonusMoves+=2
        ->GoToNode(->choices)
        
    =choices
    Asuka thinks about what to do next.
        +{look_around<Chapel_Night} [Look around.]
            ->GoToNode_Night(->look_around)
        // +{look_around>=Chapel_Night} [Space out{wait_for_something>=Chapel_Night:<> again}.]
        //     ->GoToNode_Night(->wait_for_something)
        +[Go to the lobby.]
        Asuka considers going to the lobby.
                ->GoToNode_Night(->Lobby_Night)
        +[Go to the field.]
                Asuka considers going to the field.        
            ->GoToNode_Night(->Field_Night)
    
=look_around
Asuka decides to take in her surroundings once again. 

 Dust motes float, menacingly still. Wooden pews are lined on either side of the room. 
 
 A modest stage with a coffin sits at the back.  

Near the front, the main entrance leads outside to the school field.

To the right is the side exit, connecting back to the main school lobby.

+[Look closer at the coffin.]
    {ResetLoop==0: ->GoToNode_Night(->coffin_talk)}
    ->GoToNode_Night(->coffin)
+{ResetLoop>=1}[Do something else.]
    ->GoToNode(->choices)
=coffin_talk
    TAKESHIRO: What is a coffin doing in a school chapel?
    ->coffin
=coffin
    Asuka walks up to the coffin.  The lid is half-ajar, its hinges rusted. She pushes it open, a resounding creak in the room.
{bodyPartsFound==0:
 It is empty, but it has an eerie indent of a body in there. 
    ->GoToNode(->choices)
-else:
    Inside she finds,  
    {foundFoot==true:  
        ->foot_in_coffin
    }
}

        
    =foot_in_coffin
    an old and severed foot, fitting the mould a little too perfectly.
        ->GoToNode(->choices)
        
    =follow_shota
    ASUKA: Do we want to try and get out of here too?
    
    TAKESHIRO: Um... I don't know.. I think we should stay put and stick together for now. What do you say, Shota?
    
    SHOTA: This isn't real... this is isn't real.....
    
    Takeshiro sighs in resignation.
    ->GoToNode(->choices)
    
    =wait_for_something
    Asuka's brain slows and numbs down. She tries to space out.
      A thick silence takes over the space, but it doesn't last too long. 
      ->GoToNode(->choices)
    
    
    
===Field_Night
{show_panel_night("FOOTBALL FIELD")}
            {ResetLoop==0&&movesTaken<=3: ->GoToNode(->Chapel_Night.follow_shota)}
Without a lo
        The grass is wet, the sprinklers weirdly go off at night.
        ->GoToNode(->choices)
    =choices
        +[Look around.]
            ->GoToNode_Night(->look_around)
        +[Go to school.]
            ->GoToNode_Night(->Gym_Night)
        +[Go to chapel.]
            ->GoToNode_Night(->Chapel_Night)
    =look_around
        Asuka looks around. There is nothing.
        ->GoToNode(->Field_Night.choices)
        
===Gym_Night===
    Asuka enters the school through the gym that connects it to the field.
    ->GoToNode(->choices)
    =choices
        +[Look around.]
            ->GoToNode_Night(->look_around)
        +[Go to class corridor.]
        ->Corridor_Night
        +[Go to chapel.]
            ->GoToNode_Night(->Chapel_Night)
    =look_around
        Asuka looks around and finds nothing of importance.
        ->Gym_Night

===Corridor_Night===
    Asuka is in the corridor.
    ->choices
    
    =choices
        +[Look around.]
        ->GoToNode_Night(->look_around)
        +[Go back to the gym.]
        ->GoToNode_Night(->Gym_Night)
        +[Go to class.]
        ->GoToNode_Night(->Class_Night)
        
    =look_around
        Asuka looks around in the school corridor.
        ->GoToNode(->Corridor_Night)
===Class_Night===
{show_panel_night("CLASS CORRIDOR")}
        {keyFound==false: 
            ->locked_door
        -else:
            Asuka opens the door with the key.
            ->GoToNode(->choices)
        }
    =choices
        +[Look around.]
        ->GoToNode(->look_around)
        +[Go back to the corridor.]
        ->GoToNode_Night(->Corridor_Night)
        
    =look_around
        +[Look at front.]
        ->GoToNode_Night(->look_front)
        +[Look at the left.]
        ->GoToNode_Night(->look_left)
    
    =look_front
        Asuka finds Yuki's binder with attendance sheet.
        She sees Rumiko has been absent for the last 3 meetings.
        ->GoToNode(->choices)
    
    =look_left
        {look_left==0: 
            Asuka finds a severed foot in an aquarium tank.
            ~foundFoot = true
        -else:
            Asuka finds nothing.
        }
        ->GoToNode(->choices)
        
    =locked_door
        ~needKey = true
        Asuka tries to go in but doesn't have the key.
    ->GoToNode(->Corridor_Night)

===Lobby_Night===
{show_panel_night("SCHOOL LOBBY")}
    {ResetLoop==0&&movesTaken<=3: ->GoToNode(->Chapel_Night.follow_shota)}
    Asuka finds herself in the school lobby.
    ->choices
    
    =choices
        +{look_around<Chapel_Night}[Look around.]
        ->GoToNode_Night(->look_around)
        +[Go to the chapel]
        ->GoToNode_Night(->Chapel_Night)
        +[Go to the corridor.]
        ->GoToNode_Night(->Corridor_Night)
    =look_around
     Asuka looks around in the school lobby. There is nothing to see.
     ->GoToNode(->choices)
===Deaths===
~ temp r = RANDOM(0,4)

{r:
- 0: Suddenly, the Red Person drops from above and grabs her head mid-step. Drives her skull into the floor—jaw splits, teeth scatter, spine snaps like dry twigs.
- 1: Suddenly, the Red Person slams into her from the side, claws plunging through her ribs. Bones explode outward, organs splash the wall.
- 2: She turns around the corner, but the Red Person is already there. It grabs her face and pulls. Mouth tears past her ears before the neck gives way.
- 3: In a moment, red arms are yanking her down. Pelvis snaps against tile as she vanishes screaming.
- 4: She doesn't have a second to process when her body abruptly folds inward. Bones crack, blood leaks from eyes and she collapses.
}

    ->ResetLoop
