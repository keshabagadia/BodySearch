VAR day = 2

-> WakeUp

=== WakeUp
~ day += 1
A digital clock sits on a table. 

The time rolls to 7:00, the beep making the morning's truth inescapable. 
{day == 1:
    * Asuka decides to lie in the bed a little more.
    She twists and turns, trying to get more sleep but eventually decides to give up and face the day.
    ->Breakfast
    * Asuka accepts the reality and gets up to face the day.
    ->Breakfast
- else:
    + Asuka jolts awake, and massages her face.
    ->Breakfast
}

===Breakfast
She heads to bathroom to get ready for school.
    + Once she is ready, she heads downstairs.
<em>"...it's been 17 years since the incident, and most of the townsfolk have moved on, but Mr. Adrian Gujira, the librarian at Vadelia High School insists to keep the memory alive..."</em>
-
The news blares as a woman stirs a pot in the kitchen. 

Asuka, now dressed in her school uniform grabs a plate and walks up to her mom.

MOM: You're up early!

{day==1: 
    ASUKA: I am trying a new routine.
-else: 
    ASUKA: I had a horrible nightmare... but what's for lunch?
}

MOM: For lunch, I've made fried shrimp today!

{day==1: 
    ASUKA: Wow!
-else: 
    ASUKA: Wait, again?
}

MOM: ...and, some pumpkin croquettes! I made too many, so share them with your friends, okay?

{day==1: 
    ASUKA: Mhmm okay. See you later!
-else: 
    She stares at her mom in confusion, but decides against saying anything.
}
-> WalkToSchool

=== WalkToSchool
    + Asuka grabs her bag and steps out the door.
-
 Asuka walks to school, clutching the straps of her bag and looking down. 
{day==1:
    It's a busy road, but the sidewalk is crowded with students of the same school, walking in smaller groups, giggling and chatting. 
    Everyone's attention seems to be across the street. A guy, not dressed in uniform, is getting off a bike. The bike has a Pikachu plushie hanging. But what stands out is the school girl who gets off the bike with him.

    Across the street, Rumiko walks down alone. She seems to be lost in her own thoughts.

    Asuka is looking at them and walking when she hears two guys around the corner talking loudly.

    SCHOOL BOY 1: Hey, isn't that Rumiko from Class G? She's so hot.

    SCHOOL BOY 2: Isn't she dating that barista from the nearby cafe? 

        + Asuka decides to keep listening.
        SCHOOL BOY 1: He is like, what, 30? Maybe I have a chance after all...
    
        SCHOOL BOY 2: Yeah, keep dreaming.
        
        SCHOOL BOY 1: Maybe you can go for her.
        ** It takes Asuka a minute to realize that the topic of conversation has shifted to her. 
        
        SCHOOL BOY 2: Oh, she's pretty, who's that?
        
        SCHOOL BOY 1: Asuka from the same class. But I was joking... she's, like, a total loser, man. The girls all ignore her. 
        
        SCHOOL BOY 1: Why? What'd she do--
        ->TakeshiroEntry
    +Asuka decides to tune out the gossip and redirects her attention.
    
    On the side of the read, atop a fence sits a wild cat. She makes eye contact with Asuka and meows. 
    
    Asuka stops in her tracks and squats beckoning the cat to come over. To her delight, the cat seems to heed the call and jumps down and makes her way in Asuka's direction.
    
    Just as the cat gets close though, it walks past her, leaving Asuka with an outstretched arm and a crushed heart.
    
    She thinks she hears her name, the same school boys from earlier chatting, and decides to look up.
    ->TakeshiroEntry
- else:
    She is very distracted in her thoughts, something about this day felt uneasy. She was barely looking at the road she was walking.
->CarCrash
}
    

=== TakeshiroEntry
Suddenly, a man comes hurtling down the street at the corner and separates the two boys with his momentum. He almost runs into Asuka, and manages to stop in his tracks right on time.

"Sorry," he breathes with a smile and goes back to his friends who are yelling complaints at him.

Asuka is still standing still, processing the moment, when she notices a pin that Takeshiro dropped on the ground. She picks it up, and looks at it closely.

 * [Meekly, she seems to be gathering the courage to walk up to him or call him out...]
   ->CarCrash
   
===CarCrash
When suddenly, a crash, coupled with a loud yowl.

A truck stands blocking the traffic on the road, and the cat from earlier lies motionless surrounded with a pool of blood.

{day==1:
    As she is staring at the accident, Rumiko is back in her field of vision, hugging the man from earlier as he wears his helmet. She watches him leave and starts walking by herself again.
        * Asuka follows suit.
            ->ShotaEntry
-else:
    This was too much of a coincidence. It made no sense... 
    
    Across the street she finds Rumiko staring at the truck as well, but no biker boyfriend this time.
    
    . They both look at each other, and before Asuka can respond, Rumiko looks away and starts walking.
    
    *She tries not to dwell on it and marches to school quickly.
    ->ShotaEntry
}

===ShotaEntry
{day==1:
 When Asuka enters the class, there is a lot of commotion. 
-else:
 When she enters the class, she finds two classmates hiding a ziploc under Shota's desk and giggling. 

She makes eye contact with Rumiko who is in her seat already and tries to say something, when the class president announces the lost festival funds.
}
"How could someone steal the school festival money?"

"It was right here, who left last?"

"Shota, right?" 

"There he is, SHOTA!"
{day==1:
    *Asuka's attention goes to the spectacled boy entering the classroom door. 

    "Huh?" He questions as he pushes his glasses up his neck and makes his way to his desk.

"Show us what you got in your desk."

"Uh..." They don't wait for his consent as they start rummaging the contents under his desk. 
They take out his books, pencil box, lunch, and finally a ziploc bag with green paper bills: the commitee fund for the festival.

"Shota stole the festival cash!"

"That is really messed up, Shota."

"No, no, no, no! You're wrong-- Ow!" The boy yanks his notebook out of his hand. "Is this where you plan your little heists? Let me have a look--"

"Hey, watch your step." 

**Asuka watches as Rumiko pushes the guy who almost walks into her away as she makes her way to her desk. 

"What's with that attitude?" He mumbles but decides against picking a fight when he sees his friend enter the class. "Oh Takeshiro's here!" 
***Asuka watches as Takeshiro comes in and students walk up to greet him.

"What's wrong? Takeshiro asks.

"Well, Shota was trying to steal our class's school festival money. But we found out."

"Well, all's well that ends well. Right?"

Asuka is so focused on what Takeshiro is saying that it takes her a minute before she realizes that she is still standing and blocking some students from coming in the back door.
    **** Asuka takes her seat and tries to focus on her work.
    ->AsukaLunch
    **** Asuka takes her and seat and plays with Takeshiro's pin.
    ->AsukaLunch
-else:
    Takeshiro bursts inside the class and before anyone can say anything to Shota, grabs him and takes him out of the room.
    
    Rumiko perks up, looks expectantly at Asuka, and follows Takeshiro.
    
    *Asuka follows them as well.
    ->BodySearchIntro
}

===AsukaLunch

The morning classes breeze by, and it's lunchtime before Asuka realizes. The class is filled with chitter chatter in usual fashion, students circling each other's desks complaining about the three hours of nonstop lectures and asking each other what they brought for lunch.

* Asuka grabs her lunch bag and steps outside, unnoticed by any of her classmates. 

She heads out the door at the back of the school and to her favourite spot for lunch, a quiet bench at the end of the open field as well as running trail that is both a part of their premises and not, as it's also open to public. She is surprised not many try to run off and bunk school through this way, but then again, most of like coming to school and hanging out with their friends.

** She completes her shrimp and gives her other box of pumpkin croquettes a long stare before putting them back in the bag. 

As she is walking away she notices a guy and girl huddled together on the way she came out the school. It is the same guy from earlier, the Pokemon plushie hanging from his bike unmistakable. But that's not Rumiko with him.
-
    * She decides to go back the other way to avoid interacting with the couple.
    ->PleaseFindMyBody
    * She decides to walk up to the couple, and do, something about it.
    ->UglyOldBoyfriend
    
===UglyOldBoyfriend
Asuka takes a deep breath and goes back the way she came. As she approaches the couple, they both stop their conversation to stare at her. 

She maintains eye contact for a couple seconds before she decides to turn around go back the other way.

->PleaseFindMyBody

===PleaseFindMyBody
The other way back is just a circled reroute through the school's nursery.

She doesn't like coming back here very often, so she chooses the main road to get to the field. 

*She is walking back when she hears the sound of someone digging earth. 

It's their librarian, a young man usually wearing rimmed glasses, he's dug a hole and is about to put a black plastic bag inside it. They both make eye contact, but he doesn't stop what he's doing, leaving only when the bag is buried. Asuka wonders if it's the cat from earlier, the place reeks of death. He soon leaves but Asuka finds herself unable to move.
As she is standing at staring at the fresh grave, she suddenly hears whispers. She first dismisses it as the wind, but she can make out the words now.

"Please...."

She turns back to find a little girl standing. She is holding on to a single-eyed stuff toy. 
"Please... find my...."

She looks like a normal girl but her presence in this scenario is jarring. And for some reason, she can't seem to look into her eyes.  
-
    *Asuka tries to look up, but she only sees a read face with a toothy smile.
    "Please... find my <em>BODY</>."

->UnknownSender

===UnknownSender
    *Asuka turns back and runs out of there.
Asuka is back home in her room, the rest of the school day goes without event, or none that Asuka has the mind to pay heed. 

"Asuka, why did you bring the croquettes back? Did your friends not like them?" Her mom can be heard yelling from downstairs.

"We were busy playing during lunch! Sorry!" She yells back making her way to the calendar. She traces her finger on the square that says Friday, it is marked with hearts and has "Takeshiro's basketball match" written on it. She is staring at it and smiling when her phone goes off.

    **MESSAGE FROM ?????
    DO YOU KNOW WHY THE RED PERSON IS RED?
    BECAUSE THEY'RE SOAKED IN BLOOD.
    BLOODBATH IF YOU'RE CAPTURED.
    
    "Is this a joke?"
    
    SO, WHAT'LL YOU DO? TURN RED?
    DON'T IGNORE ME.
    ANSWER ME.
-
    *READ.
        READ
        READ
        READ
        READ
        READ
        READ
        
        **She puts the phone down because of how fast it's vibrating. 
        
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        
        ***She flips the phone upside down on the same table as the digital clock and gets under cover. 
        
        ****But the phone keeps buzzing.
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ
        READ

->AttemptToSleep
===AttemptToSleep
*The clock suddenly reads 12.

Perhaps Asuka drifted away, the buzzing is gone. But as she wakes up, she is suddenly in the school chapel.

She is not the only one here either. Shota is lying on the floor, and Takeshiro is gently jostling him awake.
"Shota, get up, you're not in your bed?"

"HUH???"

"What the hell is going on!" Rumiko barges in. "Why am I here and why am I here with you all?"

"Were you guys also just in your bed before you were suddenly here?" Asuka ventures. Everyone nods.

"I knew it was the body search, I knew I shouldn't have looked back..." Shota mumbles.

"What are you talking about?" Rumiko demands.

"Body search?" Takeshiro looks at Asuka with question.
-
*Asuka's eyes shine with realization, and she looks at Takeshiro who seems to have had the same realization.

"Did you all see the little girl too?" He asks without wasting a breath.

"What is this bullshit? That was some kid fucking around, I am going to go home."

"I tried already, the main door is locked..." Takeshiro informs.

"Whatever! I am going to find a way."

She steps into the darkness and Shota starts his nervous pacing again. 

"We really are stuck in the Body Search."

"Shota, tell us, what are you talking about?" Takeshiro tries to maintain composure.
-
*Asuka tries looking up "Body Search" on her phone and realizes it's out of service.

->RumikoDeath
===RumikoDeath
In a split second, there is a loud crash and a pool of blood on the floor. Someone thrashed Rumiko with enough force to shatter the glass window.

"Rumiko?"

"What's happening???"

Loud and wet footsteps reverberate in the empty chapel.

"We're not alone, we have to run!" Shota breaks through Takeshiro and Asuka's stupour and they start running away.

* Asuka and Takeshiro follow Shota.
->ShotaDeath


===ShotaDeath
They enter the locker room and get separated between different rows of lockers.

The footsteps are audible once again and everyone stops in their movement. The room is dark except for the light coming in through the door. But as the steps get louder, a large approaching shadow blocks the light.

Asuka tries hard to not breathe too loudly, when someone swoops in beside her.

*Asuka almost yelps...

But is swiftly quietened by Takeshiro's hand. He seems to have been making his way to the back as the shadow got closer from the other side.

He gestures her to follow him.
-
*Asuka takes a look around to confirm the shadow is approaching from the other end.

She begins to move, but not even a moment passes when she hears a loud metallic thug. 

A pair of glasses fly from over the locker and land near Asuka and Takeshiro's feet. Shota is being repeatedly thrashed against a locker.

Asuka watches in horror as her classmate breaks like a twig and goes limp before her.

She doesn't have much time to mull over what just happened before she is dragged out of the room.

**Asuka holds on tight to Takeshiro's hand and tries not to hear the footsteps following them.
->TakeshiroDeath
===TakeshiroDeath
They end up in the nurse's room.

Takeshiro gets Asuka to crawl under the bed and gestures her to be quiet as the footsteps get louder again.

He slides the curtain of the bed area close and can be heard scuttling around to find another hiding place.

She cannot see through the white curtain cloth but she hears Takeshiro latch the door.

*Asuka tries to pacify her beating heart. 

She manages to breathe a few decibels softer, when suddenly a loud banging takes over the room.

She starts crying but is incapable of moving. She hears a lot of thrashing and cannot make her mind process what was happening just a thin layer of fabric away.

** And then just as suddenly, silence.
Then, rustling of the curtain door sliding open.

Feet appear in front of her, human-like, but blistered and wet red skin. They walk down the bed's length and Asuka holds her mouth with her hand to not betray a sound.

She is holding her breath to not make a sound, when the bed above starts creaking. 

She can see the shadow of a figure, a girl with a stuffed toy, jumping up and down the bed. 

Tears start streaming down her face as the creaking gets more aggressive. 

She crawls sideways, as quietly as she can, even though she doesn't know if there is a point, as the bed gets dangerously close to smashing her.
-
*That's when she sees a figure.

School shoes, school pants, and an iron pole through his chest. Takeshiro hands off a metal structure this monster seems to have shoved him through.

**And despite her best efforts, a gasp escapes her.
->EndOfDay

===EndOfDay
The creaking instantaneously stops.

She doesn't have a moment of preparation before she is dragged out from under the bed.

She tries to hold on to the floor, but finds no purchase. She's promptly flipped over and comes face to face with the monster.

A silhouette of red, wide grin, and a bloadsoaked handsewn doll.

That's her last picture before a hand is thrusted into her mouth. An unimaginable pain as she feels her jaw break.

*And then, nothing.
->WakeUp

===BodySearchIntro
"What the fuck is Body Search? Tell us everything..." Takeshiro exclaims as the other two look at Shota nervously.

Shota takes a deep breath.
"The ones that are chosen, have to find the victim's secret, severed body parts."

"Secret?" Takeshiro asks.

"Uh..." Shota looks at his phone and types something. "Hidden might be a better word... I'm still, uh, sorta translating all the details…"

"Wait. Is that Russian?" Rumiko peeks at his phone.

"The Body Search starts exactly at midnight." Shota goes on. "Run away from the Red Person."

*"That's the thing we saw last night," Asuka says solemnly.

"Okay, so why is today a repeat of yesterday?" Rumiko asks impatiently.

"Until the Body Search is complete, this is our only day." 



-> END
