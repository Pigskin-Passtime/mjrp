Contingency Core 1A6F
by Draconas
for Stellaris ModJam 2024

Contributers: Draconas


Licenses:
PDX Stellaris Modding Terms and Conditions - https://forum.paradoxplaza.com/forum/threads/updated-14-06-18-rules-for-user-made-mods-and-edits-of-pds-games.708039/
Stellaris Modjam 2024 Rules


This mod requires Synthetic Dawn to operate, all features are gated behind the DLC

Release: 0.2-beta
Release Date 2004-01-05T1520000.000Z
Lines of code: 8085
Lines of yml: 581
Toll on sanity: immense

You are reading this?  A player?  Nah, you're probably MrFreake or another PDX employee tasked with the thankless job of making sure we all comply with the MODJAM Rules.
Hopefully this can give you some pointers as to what and where to check.
If you are a player this readme contains spoilers.


Abbreviation: condan.  con from Contingency, dan from SHODAN, my favourite homicidal AI.
1A6F has no meaning, it's random hex digits.

Acknowledgements
While all the work is mine, I must acknowledge those that have gone before that inspired bits of it either concepts, or code.
Gigastructural Engineering by Elowiny and the team, which is my go to source for "that is bats**t crazy, I wonder if it's possible?" at which point some searching though the code usually finds that 1. Gigas does it, and 2. they are doing it in a surprisingly elegant way that I had no idea was possible.
Machine and Robot Expansion by XVCV, which first did Synth -> Machine Intelligence many years ago, which meant I knew that the core concept for this mod was at least theoretically possible, without knowing that it had been done I probably wouldn't have tried given the time constraints as its such a massive shift.


Code style:
All files are prefixed with condan_ (required by PDX, but also good practice)
All things added by the mod are prefixed with condan_ except things that have a defined vanilla prefix (e.g. deposits being d_) in which case condan_ will be the first thing after the prefix.
Scripted triggers are all condan_[questioning word]
Scripted effects should be condan_[verb]
Sometimes I broke the above prefix guide and went [verb]_condan_ especally on things being done to condan itself, because it read better.  Everything has condan in it somewhere thought to prevent clashes.


the MODJAM Core required sections are:
    at the top of condan_triggers
    at the top of condan_effects
    at the top of condan_l_english.yml
    The only initaliser in solar_system_initializers/condan_init.txt

condan_allowed_hard_requirements = yes is a scripted trigger that checks DLC requirements.
condan_events.000 at the top of the events file runs on_game_start and sets set_global_flag = condan_allowed if condan_allowed_hard_requirements = yes


Assets Used
The 2 Contingency portaits - hum_robot_red & ai_crisis_1 these are both base game.
The contingency ships, also base game.
Many years ago when I first played 1.x vanilla Stellaris, my wormhole hopping Commonwealth of Man had was embroiled in a massive war with the 2nd strongest AI empire, when suddenly Contingency Stops Play. :)  Won that game by the skin of my teeth, and went and bought all the avilable DLC immiedately after.


Lines added to the Error Log: 3.
--------------------------
They are vanilla bugs where planet designations and districts for machine worlds do not check exists=owner before scoping to owner, so go bang for an unowned planet.  It has been logged as a bug (link at the bottom)


General path through:
--------------------
find condan system, the planet has numerous blockers and negative modifiers.
tier 3 anomerly over the planet created a short archeolgy dig.
Complete the dig gives you the option to turn it on or destroy it.  This is the only time you can safely get rid of it without consequences.  Hive minds or No-AI empires can only destroy it.
Turn it on and have a chat, it explains what it is, and asks to help you in exchange for repairs.  It's a bit bust right now.
Refuse and it invades the planet.  It will attack the planet, and if it wins, purge all your pops, at which point it takes over the planet and the starbase and just sits there.  It's too broken to do anything more.

Tell it you will help and you get a positive colony modifer to represent it helping you.  I was not able to make a "planet locked" governor, so modifier it was.  It will also tell you to go synthetic evolution.
You have a decision to repair the planet, but the decision requires living metal, so generlaly will be gated until the mid game.

Condan appears as a country in the diplo screen and has some limited chating.  It can give you 5 pops for the planet, and will encourage you to take synth ascension, but it very limited.  The only thing it can do is give you a special project to unlock the next tech progress.  (Same as the agenda but spending engineering research instead of an agenda slot and a bit worse as it gives less progress)

When you repair the planet you get the leader hire dialog!   Yay!  Actual full leader.  Condan by default is an immortal level 10 governor, optimised for producing alloys on the planet.  If you refuse it triggers rebellion.
From this point a background event starts building condans power base.

Via diplomacy you can ask it to switch between a govenor, an admiral and if regular empire a councillor or a strategist.  All are level 10 leaders with locked traits.  All have 1 destiny, 1 paragon, 1 normal and 1 negative trait.  All traits are custom.

Condan will continue to encourage you to take synthetic evolution.  Except now it can help you more.  It still has the tech situation, but it can also produce a situation that lets you spend energy and influence for a large chunk of unity.  It can do this a max of twice, once if you haven't yet taken the ascension perk, and once if you have the ascension perk but not the special project tradition.
If you have taken another ascension perk it just sulks, and is now flagged as unhappy in the background.
The other way to make it unhappy is to take the become the crisis AP.  If you do it will warn you about it, and remain ok unless you hit crisis level 4, in which case it flips to unhappy mode.

It has some generic diplo conversations, including asking it to be less evil (based on class, its negative trait), which it refuses. Broadly a lot of stuff to fill up the screen and make later dialogs harder to spot.




MAIN STORY: TURN INTO DETERMINED EXTERMINATOR
If you take synth ascension, and it is happy with you, you get the other main flavour event: the oppotunity to convert your species into determined exterminator.  This is a situation, at the end of which you get a country conversion.  Condan becomes your ruler and you are now a DE, this is the end of the event chain unless you are extremely naughty.
A second situation spawns and you get an OC message from me about the fact that your economy is about to tank unless you have a dyson sphere/matter decompressor.  I tell you the things you need to investigate manually and the situation gives you some basic resources for 3 years while you adjust things.

If you have turned into a DE and you get the contingency crsisis you get a dialog where Condan concludes that the rest of the contingency is defective and stays with you.
If you get the contingency and have the oppotunity to turn into a DE but have not done so, you get a special event telling you to hurry the F up and do that.  6 years later if you haven't condan flips as below.
If you get the contingency and condan is unhappy, or you can't turn into a DE or don't, condan will trigger its rebellion anyway.



MAIN STORY: MACHINE INTELLIGENCE
As above, but without needing synths, and the situation to become a DE is much shorter and cheaper.


MAIN STORY: DETERMINED EXERMINATOR
None really, just lots of encouragement to go out and purge the galaxy, you still get the minor events.  You have the option of making condan your ruler.


MAIN STORY: DO NOT TURN - AI REBELLION
If you make Condan unhappy, it will eventually create an AI rebellion.
It becomes unhappy if you take a non-synth AP, or if you take crisis 4
From the midgame onwards it will start emblezzing funds.  This exists primarily as a way to let you know that something bad is happening.
It does this is 2 ways:
Condan's negative modifiers upgrade a level such that they now have an ongoing upkeep cost.
Condan starts putting deposits on planets that reduce production.

You have the oppotunity to talk to condan about its negative modifiers, or clear the deposists.  In both cases there is a chance that you won't figure it out, and there is an (increasing) chance that you trace it back to condan, this triggers the rebellion immiedately.
Otherwise, if condan is unhappy, there is a chance every 5 years from the endgame that it will kick of a rebellion anyway.

This functions like the vanilla AI rebellion but with a key difference: rather than being random systems in your country, this rebellion is done radiating from a central point - condans home planet (or random non capital world if you have lost the machine world).  The size of the rebellion is based on the power that condan acquired.
Because its radiating from a point, this is why i tried to make condan planet not link directly into the empires home cluster.
The size of this rebellion is based on power level which was based on how much emblezzment deposits and what role it was.  Council position = more power.
The rebellion will never include your home planet or your guarenteed habitable worlds.

The rebellion gets a fleet bonus based on condans power level, in addition to the fleet bonus its gets from being a determined exterminator.
It is quite posible that if you made condan a councillor that this is game-ending for you.  It is also posssible that its very small if you kept them as a govenor, admiral or spotted deposists very quickly.

If you defeat the rebellion you get a contiengency core relic as a reward provided condan had more than 1 system.


MAIN STORY - PLAYER IS VERY NAUGHTY
To quote Blade "some motherf***** is always trying to iceskate up a hill"
If you take condans path to becoming a terminator.  Then take crisis level 5, despite being told not to.  So creating a universe detroying eevent while being ruled by the AI whose sole pupose is to stop universe destroying events.  Well then you have asked for it.
Condan rebels, and from time as your ruler, will have /a lot/ of power so the reblelion will likely be massive.  you get a special dialog about it.
The contingency immiedately spawns.  (if not defeated).
Condans rebellion immiedately joins the contingency, thus getting all contingency power buffs, and giving the contingency all tis fleets and armies.
The effect of a subterfuge operation: attract crisis happens in the background on your homeworld.
On the off chance that your survive, you do not get double-relic, but unless you have a low crisis multipler, this is game ending and frankly you deserve the consequences of your own stupid-ass decisions.



MINOR FLAVOUR EVENTS
--------------------
1. Ability to build contingency warform armies on condans home planet (titanic warms, require living metal, less damage but more health)
2. Repair a planetary shipyard in order to build contingency war fleets (situation repair) then situation that eats alloys, LM and strategic resources, spawns a contingency fleet.  Takes aobut 5 years.  Fleet is about 60k fleet power (is an exact contincy fleet, 10 battleships and 20 cruisers)
3. Unhappy spirutalists (country has spiritualist ethics only).  Options from ignoring it and getting more netatives on condan, to brutally supressing it and becoming more authortarian
4. Unhappy xenophiles (country has xenophiles ethics only).  Options from ignoring it and getting more netatives on condan, to brutally supressing it and becoming more authortarian
5. Fire condan at any point: Trigger immiedate rebellion.



EVENT DETAILS
-------------

condan_comms_events.txt <--- everything in the diplomacy screen happens here
condan_events.txt <--- everything else happens here.

---------------------------------------------
condan_events.001  | Debug event, trigger it manually, gives you a display of its power level lets you trigger various things.
condan_events.030  | Change your empire into Determined Exterminator
condan_events.040  | Background event: 5 year pulse.  Increase condans power.
condan_events.041  | Background event: 5 year pulse.  Add emblezzments if unhappy.
condan_events.042  | Background event: 5 year pulse.  Trigger rebellion if unhappy.
condan_events.043  | Background event: 5 year pulse.  Trigger rebellion if contingency is back.
condan_events.070  | Condan Rebellion setup.  Flags systems, sets power level, calls into syndaw.1022
condan_events.090  | Background event: on condan fired.  Trigger rebellion.
condan_events.130  | Background event: 5 year pulse.  Trigger Flavour Events.
condan_events.150  | Crisis Level 5 super reellion activate contingency

condan_comms.001  | Inital contact on dig finished (regular + machine)
condan_comms.010  | Contact menu comms pre repair (regular + machine)
condan_comms.020  | Hiring Menu
condan_comms.021  | Kicking off rebellion dialog.
condan_comms.030  | Contact menu comms post repair (regular)
condan_comms.031  | Contact menu comms post repair (machine)
condan_comms.060  | First of the flavour event comms
condan_comms.100  | Become terminator events



GLOBAL SETUP
------------
global_event_target:condan_country <-- condans country in the comms screen, stores its power variable.   Create when you activate the core in archeology.  Destroyed and changed to a new country (regular) if the AI rebellion is triggered.
global_event_target:condan_leader <-- condan the leader.  Created when you repair the planet and hire the leader.  Killed often in the background to change roles.
global_event_target:condan_planet <-- condans home planet.  Created when the planet is spawned.
global_flag = condan_in_play <-- should pulse events fire.  set to true when condan is hired, removed when condan country is defeated.




MISSING CONTENT
---------------
As with everything, there is work left incomplete.  These are features etc... I would ahve liked to do, but did not have time / ability.

Not using the sodding humanoid robot portrait, but always being the core.  Unfortunately the core is set for diplo view so looks appalling on Leader Hire or planet govenor.    This would certainly be fixable by someone with skills in blender to rescale / recombine the assets, but I have none, and there was not time for me to learn from scratch.

Hive mind features.  What to do?  turn you into a devouring swarm and purge all life that way?  Massive synth transformation project?  There just wasn't time to implement it.

More nuanace around other purifiers.  Maybe it will be happy with you if you are fanatic purifiers, even if you don't take synths?  Maybe purifiers gives you a bonus to the transformation to termiantors.

More nuance to the termiantor situation: like some different choices in what traits you were getting?  Different ways to apprach it.

More nuance interacting with factions.  hell anything with factions, I wanted to make the flavour events faction focused and have faction penalties etc... but I could not see how to do that without overriding the vanilla factions, as all modifiers are contained inside the faction itself.  Pretty please PDX can we have the internal politics expansion next, and when we do can factions be rewritten to be moddable?   Pretty please with sugar on top?

More nusance about being happy / unhappy based on your diplomacy - if you are rivalling people and conquering it gets happy, if you are a puppy loving pacifist with non agression pacts it gets unhappy.  Just plain ran out of time.

Cleaning up some variable use to make use of the newer and better script_values functons.  I am still a cummugion around this using the oldschool variable syntax everywhere, and its clunky, some of which i could definately improve using the newer script variables.




Vanilla Bigs Found: 2.5
-----------------------

Missing exists=owner triggers for machine worlds [3.10.4] [e9b6]  (this is the one that shows up in the log)
https://forum.paradoxplaza.com/forum/threads/stellaris-missing-exists-owner-triggers-for-machine-worlds-3-10-4-e9b6.1619157/


Problems with creating countries in AI Rebellion
https://forum.paradoxplaza.com/forum/threads/stellaris-ai-rebellion-does-not-have-governor-set-and-causes-errors-to-logs-3-10-4-e9b6.1620081


0.5 bug: Machine worlds always give a replicator job, even to non-machine empires.  (Synths etc...)
Haven't reported this because looking at the planet_class object it doesn't seem to have a triggered_modifier section available, I think it is locked to permanant modifiers with no checking.