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

local SceneBase = dofile("scripts/lib/scenebase.lua")
local Profanity = dofile("scripts/adventure/profanity.lua")
local Adventure = dofile("scripts/adventure/adventure.lua")
local AdvScene  = class(SceneBase)

local MAX_COL   = 56
local MAX_LINE  = 15
local MAX_INPUT = 40
local FG        = {101.0 / 255.0, 123.0 / 255.0, 131.0 / 255.0}
local BG        = {253.0 / 255.0, 246.0 / 255.0, 227.0 / 255.0}
local FLASK_FG  = { 98.0 / 255.0, 255.0 / 255.0,  81.0 / 255.0}
local FLASK_BG  = { 26.0 / 255.0,  26.0 / 255.0,  26.0 / 255.0}

local LETTERS = {
    [SDL.Keycode.a    ] = "A",
    [SDL.Keycode.b    ] = "B",
    [SDL.Keycode.c    ] = "C",
    [SDL.Keycode.d    ] = "D",
    [SDL.Keycode.e    ] = "E",
    [SDL.Keycode.f    ] = "F",
    [SDL.Keycode.g    ] = "G",
    [SDL.Keycode.h    ] = "H",
    [SDL.Keycode.i    ] = "I",
    [SDL.Keycode.j    ] = "J",
    [SDL.Keycode.k    ] = "K",
    [SDL.Keycode.l    ] = "L",
    [SDL.Keycode.m    ] = "M",
    [SDL.Keycode.n    ] = "N",
    [SDL.Keycode.o    ] = "O",
    [SDL.Keycode.p    ] = "P",
    [SDL.Keycode.q    ] = "Q",
    [SDL.Keycode.r    ] = "R",
    [SDL.Keycode.s    ] = "S",
    [SDL.Keycode.t    ] = "T",
    [SDL.Keycode.u    ] = "U",
    [SDL.Keycode.v    ] = "V",
    [SDL.Keycode.w    ] = "W",
    [SDL.Keycode.x    ] = "X",
    [SDL.Keycode.y    ] = "Y",
    [SDL.Keycode.z    ] = "Z",
    [SDL.Keycode.SPACE] = " ",
}


function AdvScene:init(args)
    self.super.init(self, table.merge(args, {width = 1920, height = 1080}))
    self:init_terminal()
    self:init_sprites()
    self:init_adv()
end

function AdvScene:init_terminal()
    self.fg       = R.Nvg.rgbf(table.unpack(FG))
    self.bg       = R.Nvg.rgbf(table.unpack(BG))
    self.lines    = {}
    self.buffered = {}
    self.input    = {}
    self.waiting  = false
    self.ready    = true
    self.prompt   = "> "
    self.dirty    = true
    self.flasking = false

    self.field = R.TextField.new {
        font   = self:font_asset("Inconsolata-Regular"),
        size   = 68,
        color  = self.fg,
        align  = R.Nvg.Align.LEFT | R.Nvg.Align.TOP,
        width  = 1920.0 * 2.0,
    }
end

function AdvScene:init_sprites()
    local background = R.Sprite.new("background")
    background.content = function (nvg, matrix)
        nvg:set_transform(matrix)
        nvg:fill_color(self.bg)
        nvg:begin_path()
        nvg:rect(0.0, 0.0, 1920.0, 1080.0)
        nvg:fill()
    end
    self.root:add_child(background)

    local field = R.Sprite.new("field")
    field.content = self.field
    self.root:add_child(field)
end

function AdvScene:init_adv()
    self.adv = Adventure.new(self)
    self:put_buffer()
end


function AdvScene:on_event(event)
    self.super.on_event(self, event)
    if event.type == SDL.EventType.KEYDOWN then
        if self.waiting then
            self.waiting = false
            table.remove(self.lines)
            self:put_buffer()
        else
            local key    = event.key
            local sym    = key.sym
            local input  = self.input
            local letter = LETTERS[sym]
            if letter and #input < MAX_INPUT then
                table.insert(input, letter)
            elseif sym == SDL.Keycode.BACKSPACE then
                table.remove(input)
            elseif sym == SDL.Keycode.RETURN
                    and (key.mod & SDL.Keymod.ALT) == 0
                    and self.ready then
                self:submit()
            end
        end
    end
end

function AdvScene:submit()
    local str  = table.concat(self.input)
    self.input = {}
    self.ready = false
    self.dirty = true

    if string.match(str, "%S") then
        self:add_line(self.prompt .. str)
        table.insert(self.buffered, "")

        local ok, err = pcall(self.interpret, self, str)
        if not ok then
            self:print(err)
        end

        table.insert(self.buffered, "")
        self:put_buffer()
    else
        table.insert(self.lines, "Input?")
        self:delay(0.5, function ()
            table.remove(self.lines)
            self.ready = true
        end)
    end
end


function AdvScene:tween_color(target, time, r, g, b)
    self:seq(target, "quad_in_out")
        :tween():field("r", r):field("g", g):field("b", b):t(time)
        :start()
end

function AdvScene:tween_colors()
    if self.flasking then
        self:tween_color(self.fg, 0.5, table.unpack(FLASK_FG))
        self:tween_color(self.bg, 0.5, table.unpack(FLASK_BG))
    else
        self:tween_color(self.fg, 0.5, table.unpack(FG))
        self:tween_color(self.bg, 0.5, table.unpack(BG))
    end
end

function AdvScene:interpret(str)
    local norm = str:trim():lower():gsub("%s+", " ")

    if norm == "get ye flask" then
        self:print("You can't get ye flask!")
        self.flasking = not self.flasking
        if not self.tripping then
            self:tween_colors()
        end
    elseif Profanity.is_contained_in(norm) then
        self.adv:on_profanity()
    elseif #norm > 0 then
        self.adv:parse(norm)
    end
end


function AdvScene:on_render()
    if self.ready then
        local block = (SDL.ticks // 500) % 2 == 0
        if self.prev_block ~= block then
            self.prev_block = block
            self.dirty      = true
        end

        if self.dirty then
            local maybe_newline = #self.lines == 0 and "" or "\n"
            self.field.string = table.concat({
                table.concat(self.lines, "\n"),
                maybe_newline,
                self.prompt,
                table.concat(self.input),
                block and "_" or "",
            })
        end
    elseif self.dirty then
        self.field.string = table.concat(self.lines, "\n")
    end

    self.field.color = self.fg
    self.clear_color = self.bg
    self.super.on_render(self)
end


function AdvScene:add_line(line)
    local lines = self.lines
    table.insert(lines, line)
    while #lines > MAX_LINE do
        table.remove(lines, 1)
    end
end

function AdvScene:delay(seconds, callback)
    self:seq():delay(seconds):start(callback)
end


function AdvScene:print(s)
    local buffered = self.buffered

    if string.match(s, "%S") then
        local words = {}
        local len   = 0

        for i, line in ipairs(string.split(s, "\n")) do
            for word in string.gmatch(line, "%S+") do
                len = len + #word
                if (len + #words - 1) >= MAX_COL then
                    table.insert(buffered, table.concat(words, " "))
                    words = {}
                    len   = #word
                end
                table.insert(words, word)
            end

            table.insert(buffered, table.concat(words, " "))
            words = {}
            len   = 0
        end
    else
        table.insert(buffered, "")
    end

    self.dirty = true
end


function AdvScene:wait()
    table.insert(self.buffered, false)
end



function AdvScene:trip_color(target)
    return self:seq(target, "quad_in_out")
        :tween():field("r", 0.0, 1.0)
                :field("g", 0.0, 1.0)
                :field("b", 0.0, 1.0)
                :t(3, 6)
        :loop()
end

function AdvScene:start_tripping()
    self.tripping = true
    self.trip_fg_id = self:trip_color(self.fg)
    self.trip_bg_id = self:trip_color(self.bg)
end

function AdvScene:stop_tripping()
    self.tripping = false
    self:kill_by_id(self.trip_fg_id)
    self:kill_by_id(self.trip_bg_id)
    self:tween_colors()
end

function AdvScene:put_buffer()
    local buffered = self.buffered
    if #buffered > 0 then
        local line = table.remove(buffered, 1)
        if line then
            self:add_line(line)
            self:delay(0.02, function () self:put_buffer() end)
        else
            self:add_line("")
            self:add_line("(Hit any key to read on...)")
            self.waiting = true
            self.ready   = false
        end
    else
        self.ready = not self.adv.over
        if self.trip then
            self.trip = false
            if not self.tripping then
                self:start_tripping()
            else
                self:stop_tripping()
            end
        end
    end
end


return AdvScene
