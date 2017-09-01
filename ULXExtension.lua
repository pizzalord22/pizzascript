---
--- Created by Mark.
--- DateTime: 29-8-2017 21:59
---
--- intercept ulx commands and add usefull information
--- who banned the player? ban msg + | banned by (admin name)
--[[

-- all the ulx commands

Category: Fun
o ulx armor <players> <armor: 0<=x<=255> - Sets the armor for target(s). (say: !armor)
o ulx blind <players> [<amount: 0<=x<=255, default 255>] - Blinds target(s). (say: !blind) (opposite: ulx unblind)
o ulx cloak [<players, defaults to self>] [<amount: 0<=x<=255, default 255>] - Cloaks target(s). (say: !cloak) (opposite: ulx uncloak)
o ulx freeze <players> - Freezes target(s). (say: !freeze) (opposite: ulx unfreeze)
o ulx god [<players, defaults to self>] - Grants god mode to target(s). (say: !god) (opposite: ulx ungod)
o ulx hp <players> <hp: 1<=x<=2147483647> - Sets the hp for target(s). (say: !hp)
o ulx ignite <players> [<seconds: 1<=x<=300, default 300>] - Ignites target(s). (say: !ignite) (opposite: ulx unignite)
o ulx jail <players> [<seconds, 0 is forever: 0<=x, default 0>] - Jails target(s). (say: !jail) (opposite: ulx unjail)
o ulx jailtp <player> [<seconds, 0 is forever: 0<=x, default 0>] - Teleports, then jails target(s). (say: !jailtp)
o ulx maul <players> - Maul target(s). (say: !maul)
o ulx playsound <sound> - Plays a sound (relative to sound dir).
o ulx ragdoll <players> - ragdolls target(s). (say: !ragdoll) (opposite: ulx unragdoll)
o ulx slap <players> [<damage: 0<=x, default 0>] - Slaps target(s) with given damage. (say: !slap)
o ulx slay <players> - Slays target(s). (say: !slay)
o ulx sslay <players> - Silently slays target(s). (say: !sslay)
o ulx strip <players> - Strip weapons from target(s). (say: !strip)
o ulx unigniteall - Extinguishes all players and all entities. (say: !unigniteall)
o ulx whip <players> [<times: 2<=x<=100, default 10>] [<damage: 0<=x, default 0>] - Slaps target(s) x times with given damage each time. (say: !whip)

Category: Rcon
   o ulx cexec <players> {command} - Run a command on console of target(s). (say: !cexec)
   o ulx ent <classname> [{<flag>:<value>}] - Spawn an ent, separate flag and value with ':'.
   o ulx exec <file> - Execute a file from the cfg directory on the server.
   o ulx luarun {command} - Executes lua in server console. (Use '=' for output)
   o ulx rcon {command} - Execute command on server console. (say: !rcon)


Category: User Management
   o ulx addgroup <group> [<inherits from>] - Create a new group with optional inheritance.
   o ulx adduser <player> <group> - Add a user to specified group.
   o ulx adduserid <SteamID, IP, or UniqueID> <group> - Add a user by ID to specified group.
   o ulx groupallow <group> <command> [<access tag>] - Add to a group's access.
   o ulx groupdeny <group> <command> - Remove from a group's access.
   o ulx removegroup <group> - Removes a group. USE WITH CAUTION.
   o ulx removeuser <player> - Permanently removes a user's access.
   o ulx removeuserid <SteamID, IP, or UniqueID> - Permanently removes a user's access by ID.
   o ulx renamegroup <current group> <new group> - Renames a group.
   o ulx setgroupcantarget <group> [<target string>] - Sets what a group is allowed to target
   o ulx userallow <player> <command> [<access tag>] - Add to a user's access.
   o ulx userallowid <SteamID, IP, or UniqueID> <command> [<access tag>] - Add to a user's access.
   o ulx userdeny <player> <command> [<remove explicit allow or deny instead of outright denying: 0/1>] - Remove from a user's access.
   o ulx userdenyid <SteamID, IP, or UniqueID> <command> [<remove explicit allow or deny instead of outright denying: 0/1>] - Remove from a user's access.
   o ulx usermanagementhelp - See the user management help.

Category: Utility
   o ulx ban <player> [<minutes, 0 for perma: 0<=x, default 0>] [{reason}] - Bans target. (say: !ban)
   o ulx banid <steamid> [<minutes, 0 for perma: 0<=x, default 0>] [{reason}] - Bans steamid.
   o ulx debuginfo - Dump some debug information.
   o ulx help - Shows this help.
   o ulx kick <player> [{reason}] - Kicks target. (say: !kick)
   o ulx map <map> [<gamemode>] - Changes map and gamemode. (say: !map)
   o ulx noclip [<players, defaults to self>] - Toggles noclip on target(s). (say: !noclip)
   o ulx resettodefaults [<string>] - Resets ALL ULX and ULib configuration!
   o ulx spectate <player> - Spectate target. (say: !spectate)
   o ulx unban <steamid> - Unbans steamid.
   o ulx who - See information about currently online users.

Category: Chat
   o ulx asay {message} - Send a message to currently connected admins. (say: @)
   o ulx csay {message} - Send a message to everyone in the middle of their screen. (say: @@@)
   o ulx gag <players> - Gag target(s), disables microphone. (say: !gag) (opposite: ulx ungag)
   o ulx gimp <players> - Gimps target(s) so they are unable to chat normally. (say: !gimp) (opposite: ulx ungimp)
   o ulx mute <players> - Mutes target(s) so they are unable to chat. (say: !mute) (opposite: ulx unmute)
   o ulx psay <player> {message} - Send a private message to target. (say: !p)
   o ulx thetime - Shows you the server time. (say: !thetime)
   o ulx tsay {message} - Send a message to everyone in the chat box. (say: @@)

Category: Voting
   o ulx stopvote - Stops a vote in progress. (say: !stopvote)
   o ulx veto - Veto a successful votemap. (say: !veto)
   o ulx vote <title> {options} - Starts a public vote. (say: !vote)
   o ulx voteban <player> [<minutes: 0<=x, default 1440>] [{reason}] - Starts a public ban vote against target. (say: !voteban)
   o ulx votekick <player> [{reason}] - Starts a public kick vote against target. (say: !votekick)
   o ulx votemap [{map}] - Vote for a map, no args lists available maps. (say: !votemap)
   o ulx votemap2 {map} - Starts a public map vote. (say: !votemap2)

Category: Teleport
   o ulx bring <player> - Brings target to you. (say: !bring)
   o ulx goto <player> - Goto target. (say: !goto)
   o ulx return [<player, defaults to self>] - Returns target to last position before a teleport. (say: !return)
   o ulx send <player> <player> - Goto target. (say: !send)
   o ulx teleport [<player, defaults to self>] - Teleports target. (say: !tp)

Category: Menus
   o ulx motd - Show the message of the day. (say: !motd)
   o xgui <show, hide, toggle> - Opens and/or closes XGUI. (say: !xgui, !menu) (alias: ulx menu)
   o xgui fban <player> - Opens the add ban window, freezes the specified player, and fills out the Name/SteamID automatically. (say: !fban)
   o xgui xban <player> - Opens the add ban window and fills out Name/SteamID automatically if a player was specified. (say: !xban)

]]


--- if an admin uses a command print it to everyone that has an higher rank
--- if possible add the admins name when he uses a command eg: !ban player durationmsg+| kicked by (admin name)

hook.Add("PlayerSay", "chat", function( ply, text, team )
    if string.sub( text, 1,5 ) == "!menu" then
        return  ply .. " opend the ulx menu"
    elseif string.sub( text, 1, 2 ) == "//" or string.sub( text, 1, 4 ) == "/ooc" then
        return "[OOC" .. text
    elseif string.sub( text, 1,3 ) == "///" or string.sub( text, 1,1 ) == "@" then
        return "[ADMIN]" .. text
    elseif string.sub( text, 1, 2 ) == "/y" then
        return "[YELL]" .. text
    elseif string.sub( text, 1, 2 ) == "/w" then
        return "[WHISPER]" .. text
    elseif string.sub( text, 1,  2 ) == "/a" or string.sub( text, 1, 7 ) == "/advert" then
        return "[ADVERT]" .. text
    elseif string.sub( text, 1, 6 ) == "/comms" then
        return "[COMMS]" .. text
    end
end)

hook.Add( "PhysgunDrop", "PhysgunDrop", function()
    function GM:PhysgunDrop( ply, ent )
        print( "player:" .. ply .. " dropped " .. ent)
    end
end)

hook.Add( "EntityRemoved", "entityRemoved", function()
    function GM:EntityRemoved( ent )
        print( "Entity: " .. ent .. " was removed")
    end
end)