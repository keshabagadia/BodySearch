===Chapel_Night===
~totalMinutes = 0
{show_panel("Chapel")}
{movesTaken==0:
    ->body_search_start
    }
Asuka is back in the chapel.
->GoToNode(->choices)
=body_search_start
    Minutes ago Asuka was somewhere else and now she is in the school chapel. It is dark.
            There are others there.
            {ResetLoop:
                -0: ->first_time
                -else:
                    Everyone except Rumiko.
                    ->prep
                
            }
    =first_time
        SHOTA: Did you guys see her too?
                
        TAKESHIRO: What the fuck is going on?
        
        RUMIKO: I am heading out.
        
        Rumiko leaves from the nursery exit.
        
        ASUKA: What should we do?

        SHOTA: I didn't know it was real....
        
        TAKESHIRO: Can you tell us what the hell is happening if you know something?
        
        Suddenly, a crash. Rumiko's body has been thrashed through the window.
        
        SHOTA: We're not alone, we have to run!
        
        Shota runs towards the lobby connecting the school with the chapel.
        ->GoToNode(->choices)
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
        +[Look around.]
        ->GoToNode_Night(->look_around)
        +[Go to the lobby.]
        ->GoToNode_Night(->Lobby_Night)
        +[Go to the field.]
        ->GoToNode_Night(->Field_Night)
    
    =look_around
        {bodyPartsFound==0:
            Asuka finds an old and empty coffin.
        -else:
            Asuka finds a coffin. When she looks inside, she finds {foundFoot==true: <>->foot_in_coffin}
        }
        
    =foot_in_coffin
    an old and severed foot.
        ->GoToNode(->choices)
    
===Field_Night
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
    Asuka finds herself in the school lobby.
    ->choices
    
    =choices
        +[Look around.]
        ->placeholder_knot
        +[Go to the chapel]
        ->GoToNode_Night(->Chapel_Night)
        +[Go to the corridor.]
        ->GoToNode_Night(->Corridor_Night)
===Deaths===
    The Red Person is right behind her. She is standing one second, and facing the hard ground the next. Pain floods in, her vision darkens.
    ->ResetLoop
