# Kontakt Note Names Generator for Reaper

This small project uses Kontakt's API to pull info from nki's and generate note name txt's for Reaper. 

These note name txt's can be used in Reaper's piano roll to make note input easier. 

In the piano roll, there is a view mode called "Named Notes"

![named notes](./images/named notes.png)

In this mode you can rearrange notes by ctrl+dragging them, and you can ctrl+alt+click to hide notes.

For sample libraries with reduced ranges or lots of keyswitches, this could simplify the piano roll significantly. You could only show the playable range, and put the keyswitches all together in a group at the bottom.

It takes some time to set all this up though. In my opinion, this would fall under the category of busy-work, which should be avoided if you're trying to actually write music.

However, if you use this pair of Kontakt API Lua scripts, it might actually be worth it to use note maps!

# Usage

1. Put this repo anywhere on your harddrive. 
2. Load a single nki
3. Run the two Kontakt API Lua scripts in order. 
4. Note name txt's will appear in the "Generated Note Names" subfolder.
5. Load them from the piano roll (File &rarr; Note/CC names &rarr; Load note/CC names from file)

> [!TIP]
>
> Make sure "Developer features are enabled (File &rarr; Options... &rarr; Developer &rarr; Enable developer features)
>
> Also, make sure not to save the nki after running these scripts!
>
> Note that you might need to clear note names before loading a new txt.



# Limitations

The 5th script slot must not be password protected.

The instrument must be editable via the wrench (No cog).

If the developer didn't specify key types and names for keyswitches, the script won't find them.
