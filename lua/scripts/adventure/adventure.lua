-- Copyright (c) 2020 askmeaboutloom
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local Data      = dofile("scripts/adventure/data.lua")
local Profanity = dofile("scripts/adventure/profanity.lua")
local Adventure = class()


function Adventure:init(scene)
    self.scene   = scene
    self.inv     = Data.Inventory.new()
    self.over    = false
    self.indexes = {}
    self.user    = {}
    self.rooms   = {
        ["restroom"     ] = Data.RestRoom.new(),
        ["temple"       ] = Data.Temple.new(),
        ["cafeteria"    ] = Data.Cafeteria.new(),
        ["souvenierShop"] = Data.SouvenierShop.new(),
        ["secretPassage"] = Data.SecretPassage.new(),
        ["bossRoom"     ] = Data.BossRoom.new(),
    }

    self:welcome()
    self:set_room("restroom")
    self:print("")
end


function Adventure:welcome()
    self:print(Data.messages.welcome[1])
end


function Adventure:set_room(key)
    self.room = self.rooms[key]

    if not self.room.visited then
        self:wait()
        self:print(self.room:look())
        self.room.visited = true
    end

    if self.scene.tripping and (self.inv:has("nail") or self.inv:has("plug")) then
        self.scene.trip = true
        self:print("")
        self:print("You feel the effects of the WEEDS wearing off.")
    end
end


function Adventure:fight_dragon()
    self:wait()
    self:print(self:random_message({"fightDragon1"}))
    self:wait()
    self:print(self:random_message({"fightDragon2"}))
    self.room:remove("dragon")
    self.room:remove("dressShirt")
    self.room:add("stairs")
    self.room:add("brokenGlasses")
    self.inv:add("greetingCard")
    self.inv:add("twentyDollars")
end

function Adventure:befriend_dragon()
    self:print(self:random_message({"befriendDragon1"}))
    self:wait()
    self:print(self:random_message({"befriendDragon2"}))
    self:wait()
    self:print(self:random_message({"befriendDragon3"}))
    self:wait()
    self:game_over()
end

function Adventure:game_over()
    self:print("");
    self:print("");
    self:print("");
    self:print("Congratulations!");
    self:print("");

    if self.rooms["bossRoom"]:has("dragon") then
        self:print("You made it through the adventure and FRED very happy.")
    else
        self:print("You made it through the adventure and beat up a dragon.")
    end

    self:print("")

    local cried = self.user.cry or 0
    if cried == 0 then
        self:print("And you didn't even cry!")
    elseif cried == 1 then
        self:print("And you only cried once!")
    else
        self:print("And you only cried " .. cried .. " times!")
    end

    self:print("")
    self:print("")
    self:print("(Send a note or something to report his amazing feat!)")

    self:print("")
    self:print("")
    self.over = true
end


function Adventure:on_profanity()
    self:print(self:random_message({"onProfanity"}))
end


function Adventure:index(key, value)
    if value then
        self.indexes[key] = value
    end
    return self.indexes[key] or 0
end


function Adventure:print(s)
    if s then
        self.scene:print(s)
    end
end

function Adventure:wait()
    self.scene:wait()
end

function Adventure:emph(s)
    return '"' .. string.upper(s) .. '"'
end

function Adventure:print_not_found(things)
    local quoted = {}
    for i, thing in ipairs(things) do
        table.insert(quoted, self:emph(thing))
    end
    self:print("I don't see any " .. table.concat(quoted, " or ") .. " here.")
end


function Adventure:preempt(pieces)
    local key = table.concat(pieces, "/")
    local pre = Data.pre[key]
    return pre and pre(self)
end

function Adventure:amend(msg, pieces)
    local key   = table.concat(pieces, "/")
    local amend = Data.amend[key]
    if amend then
        return amend(self, msg)
    else
        return msg
    end
end

function Adventure:react(pieces)
    local key  = table.concat(pieces, "/")
    local post = Data.post[key]
    if post then
        post(self)
    end
end


function Adventure:message(pieces)
    local key     = table.concat(pieces, "/")
    local indexes = self.indexes

    if not indexes[key] then
        indexes[key] = 0
    else
        indexes[key] = indexes[key] + 1
    end

    local idx = indexes[key]
    local msg = ""

    if Data.messages[key] then
        local list = Data.messages[key]
        msg = idx < #list and list[idx + 1] or list[#list]
        while msg == ".rand" do
            msg = table.roll(list)
        end
    else
        msg = nil
    end

    return {idx = idx + 1, msg = msg}
end


function Adventure:random_message(pieces, default)
    local key  = table.concat(pieces, "/")
    local list = Data.messages[key]
    if list then
        return table.roll(list)
    else
        return default
    end
end


function Adventure:thing_from_word(noun)
    local normalized = string.gsub(noun, "%s+", "")
    return self.room:find(normalized) or self.inv:find(normalized)
end


function Adventure:get_verb(type, raw)
    local key = type .. "/" .. raw
    return Data.verbs[key] or raw
end


function Adventure:act(raw)
    local verb = self:get_verb("act", raw)

    if verb == "look" then
        self:print(self.room:look())
    elseif verb == "inventory" then
        self:print(self.inv:look())
    elseif verb == "undress" or verb == "divest" then
        return self:interact("take", "clothes")
    elseif verb == "yes" and self.user.expectFight then
        self:combine("dragon", "hands")
    elseif verb == "no" and self.user.expectFight then
        self:print("Didn't think so.")
    elseif verb == "yes" and self.user.expectFriends then
        self:befriend_dragon()
    elseif verb == "no" and self.user.expectFriends then
        self:print("FRED is disappointed, but he understands. Not many people like him, even if his mom says otherwise.")
    elseif Data.messages["just_" .. raw] then
        self:print(self:random_message({"just_" .. raw}))
    elseif Data.messages["just_" .. verb] then
        self:print(self:random_message({"just_" .. verb}))
    else
        self:print("Don't know how to " .. self:emph(raw) .. ".")
    end

    if verb == "cry" then
        if self.user.cry then
            self.user.cry = self.user.cry + 1
        else
            self.user.cry = 1
        end
    end

    if verb == "clap" and self.room:has("clapper") then
        if not self.user.clapper then
            self.user.clapper = 1
        elseif self.user.clapper < 4 then
            self.user.clapper = self.user.clapper + 1
        end

        self:print("")
        self:print(self:random_message({"clapper" .. self.user.clapper}))

        if self.user.clapper == 3 then
            self.room:add("sparks")
        end
    end
end


function Adventure:interact(raw, noun)
    local thing = self:thing_from_word(noun)
    if not thing then
        return self:print_not_found({noun})
    end

    local verb = thing:resolve(self:get_verb("interact", raw))

    if self:preempt({verb, thing.id}) then
        return
    end

    if thing.id == "self" and (verb == "look" or verb == "open" or verb == "take") then
        return self:act("inventory")
    end

    local res = self:message({verb, thing.id})

    if not res.msg then
        if verb == "take" and self.inv:has(thing.id) then
            res.msg = ".got"
        else
            res.msg = self:random_message({"no_" .. verb},
                    "Don't know how to " .. string.upper(raw) .. " that.")
        end
    end

    if res.msg == ".got" then
        res.msg = "You already got it."
    end

    self:print(self:amend(res.msg, {verb, thing.id}))
    self:react({verb, thing.id, "[" .. res.idx .. "]"})
    self:react({verb, thing.id})
end


function Adventure:combine(a, b)
    local thing = self:thing_from_word(a)
    local other = self:thing_from_word(b)

    local not_found = {}
    if not thing then
        table.insert(not_found, a)
    end
    if not other then
        table.insert(not_found, b)
    end
    if #not_found > 0 then
        return self:print_not_found(not_found)
    end

    if thing.id == other.id then
        return self:print("You can't combine something with itself.")
    end

    if other.id < thing.id then
        thing, other = other, thing
    end

    local args = {"combine", thing.id, other.id}
    if self:preempt(args) then
        return
    end

    local res = self:message(args)

    if res.msg then
        self:print(self:amend(res.msg, args))
    else
        res = self:message({"combine", thing.id})
        if res.msg then
            self:print(res.msg)
        else
            res = self:message({"combine", other.id})
            if res.msg then
                self:print(res.msg)
            else
                self:print(self:random_message({"no_combine"}))
            end
        end
    end

    self:react({"combine", thing.id, other.id, "[" .. res.idx .. "]"})
    self:react(args)
end


local AGGRESSIVE_WORDS = {
    ["attack" ] = true,
    ["beat"   ] = true,
    ["break"  ] = true,
    ["destroy"] = true,
    ["fight"  ] = true,
    ["kick"   ] = true,
    ["kill"   ] = true,
    ["murder" ] = true,
    ["punch"  ] = true,
    ["smash"  ] = true,
}

function Adventure:has_aggression(words)
    for i, word in ipairs(words) do
        if AGGRESSIVE_WORDS[word] then
            return true
        end
    end
    return false
end

function Adventure:interpret(words)
    if #words < 1 then
        return self:print(self:random_message({"no_interpret"}))
    end

    if self:has_aggression(words) and self.room ~= self.rooms["bossRoom"] then
        self:print(self:random_message({"just_kill"}))
    elseif #words > 1 and words[1] == "help" then
        local key  = table.concat(words, "_")
        if Data.messages[key] then
            self:print(self:random_message({key}))
        else
            table.remove(words, 1)
            local topic = string.upper(table.concat(words, " "))
            self:print("There's no help for \"" .. topic .. "\".")
        end
    elseif #words == 1 then
        self:act(words[1])
    elseif #words == 2 then
        self:interact(words[1], words[2])
    elseif #words == 3 then
        if words[1] == "combine" and
           words[2] == "ice" and
           words[3] == "cream" then
            self:print("That was just an example! You have neither ice nor cream with you.")
        else
            self:combine(words[2], words[3])
        end
    else
        self:print(self:random_message({"no_interpret"}))
    end

    self.user.expectFight       = self.user.expectNextFight
    self.user.expectFriends     = self.user.expectNextFriends
    self.user.expectNextFight   = false
    self.user.expectNextFriends = false
end


local SHORTCUTS = {
    ["l"  ] = "look",
    ["u"  ] = "use",
    ["t"  ] = "take",
    ["g"  ] = "go",
    ["s"  ] = "speak",
    ["h"  ] = "help",
    ["i"  ] = "inventory",
    ["inv"] = "inventory",
}

function Adventure:munge_words(input)
    local output = {}

    if #input > 0 then
        local first = table.remove(input, 1)
        table.insert(output, SHORTCUTS[first] or first)
    end

    local buffer = {}
    for i, word in ipairs(input) do
        if Data.stopwords[word] then
            if #buffer > 0 then
                table.insert(output, table.concat(buffer, " "))
                buffer = {}
            end
        else
            table.insert(buffer, word)
        end
    end

    if #buffer > 0 then
        table.insert(output, table.concat(buffer, " "))
    end

    return output
end

function Adventure:parse(line)
    local words = {}
    for word in string.gmatch(line, "%S+") do
        table.insert(words, Data.replacements[word] or word)
    end
    self:interpret(self:munge_words(words))
end


return Adventure
