-- Copyright (c) 2019, 2020 askmeaboutloom
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

dofile("scripts/lib/common.lua")

local PreloadScene = dofile("scripts/lib/preload.lua")

local msaa   = 0
local fb     = nil
local fps    = nil
local skip   = nil
local vsync  = nil
local record = false
local debug  = true

local arg_handlers = {
    msaa = {
        pattern  = "^(%d+)$",
        callback = function (value)
            msaa = tonumber(value)
        end,
    },
    framebuffer = {
        pattern  = "^(%d+)x(%d+)$",
        callback = function (width, height)
            fb = {tonumber(width), tonumber(height)}
        end,
    },
    framerate = {
        pattern  = "^(%d+)$",
        callback = function (value)
            fps = tonumber(value)
        end,
    },
    frameskip = {
        pattern  = "^(%d+)$",
        callback = function (value)
            skip = tonumber(value) ~= 0
        end,
    },
    vsync = {
        pattern  = "^(-?%d+)$",
        callback = function (value)
            local n = tonumber(value)
            vsync   = n < 0 and -1 or n > 0 and 1 or 0
        end,
    },
    record = {
        pattern  = "^(%d+)$",
        callback = function (value)
            record = tonumber(value) ~= 0
        end,
    },
    debug = {
        pattern  = "^(%d+)$",
        callback = function (value)
            debug = tonumber(value) ~= 0
        end,
    },
}

for i = 1, #arg do
    local key, value  = string.match(arg[i], "^--(%w+)=(.+)$")
    local arg_handler = arg_handlers[key]
    if arg_handler then
        local matched = {string.match(value, arg_handler.pattern)}
        if #matched > 0 then
            arg_handler.callback(table.unpack(matched))
        end
    end
end

return simple_main_args {
    title    = "adventure",
    msaa     = msaa,
    openal   = false,
    on_scene = function (scene)
        if fps   then R.framerate          = fps   end
        if vsync then SDL.gl_swap_interval = vsync end

        if skip ~= nil then
            R.skip_frames = skip
        end

        return PreloadScene.new {
            resources = slurplines("assets/assetlist"),
            packfiles = {
                {url = "assets.pack", bytes = 0},
            },
            on_done   = function (scene, preloader)
                local args = {
                    scene  = scene,
                    nvg    = preloader.nvg,
                    assets = preloader.loaded,
                }

                if fb then
                    args.frame_renderer = R.FrameRenderer.new(false)
                    args.frame_buffer   = R.FrameBuffer.new_2d(table.unpack(fb))
                    args.frame_buffer:unbind()
                end

                local dump = false
                if record then
                    if R.platform == "emscripten" then
                        R.warn("Can't record on Emscripten")
                    elseif not fb then
                        R.warn("Can't record without a frame buffer")
                    else
                        dump = true
                    end
                end

                redofile_caching = not debug
                rawset(_G, "DUMP_FRAME_BUFFER_EACH_FRAME", dump)
                rawset(_G, "WANT_DEBUG", debug)

                local initial_scene = redofile("scripts/advscene.lua")
                return initial_scene.new(args)
            end,
        }
    end,
}
