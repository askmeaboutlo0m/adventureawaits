-- This regular expression is based on the one from
-- Regexp::Common::profanity under the terms of the MIT License. The
-- authors of that module have nothing to do with this software.
--
-- https://metacpan.org/pod/Regexp::Common::profanity
--
-- Following is the original copyright and permission notice:
--
-- Copyright (c) 2001 - 2008, Damian Conway and Abigail
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- Of this software and associated documentation files (the "Software"), to deal
-- In the Software without restriction, including without limitation the rights
-- To use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- Copies of the Software, and to permit persons to whom the Software is
-- Furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- All copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
local PROFANITY = {
    "arse",
    "arsed",
    "arse hole",
    "arsehole",
    "arses",
    "arsing",
    "assed",
    "ass hole",
    "asshole",
    "ass holes",
    "assholes",
    "assing",
    "balled",
    "baller",
    "ballers",
    "balling",
    "balls",
    "bastard",
    "bloody",
    "blow job",
    "blowjob",
    "blow jobs",
    "blowjobs",
    "bone",
    "boner",
    "boners",
    "bones",
    "boning",
    "bugger",
    "bull shit",
    "bull shits",
    "bullshit",
    "bullshits",
    "bull shitted",
    "bullshitted",
    "bull shitter",
    "bullshitter",
    "bull shitters",
    "bullshitters",
    "bull shitting",
    "bullshitting",
    "cock",
    "cocks",
    "cock sucker",
    "cocksucker",
    "cock suckers",
    "cocksuckers",
    "cock sucking",
    "cocksucking",
    "crapped",
    "crapper",
    "crappers",
    "crapping",
    "crappy",
    "crap",
    "craps",
    "cuming",
    "cumming",
    "cum",
    "cums",
    "cunt",
    "cunts",
    "dicked",
    "dick head",
    "dick heads",
    "dickhead",
    "dickheads",
    "dicking",
    "dickless",
    "dick",
    "dicks",
    "dong",
    "dongs",
    "farted",
    "farter",
    "farting",
    "fart",
    "farts",
    "farty",
    "feltched",
    "feltcher",
    "feltchers",
    "feltches",
    "feltching",
    "fucked",
    "fucking",
    "fuck",
    "fucks",
    "half arsed",
    "halfarsed",
    "half assed",
    "halfassed",
    "hard on",
    "hardon",
    "humped",
    "humper",
    "humpers",
    "humping",
    "humps",
    "merd",
    "merde",
    "mother fucker",
    "motherfucker",
    "mother fuckers",
    "motherfuckers",
    "mother fucking",
    "motherfucking",
    "mutha fucka",
    "muthafucka",
    "mutha fucker",
    "muthafucker",
    "mutha fuckers",
    "muthafuckers",
    "mutha fucking",
    "muthafucking",
    "muther fucker",
    "mutherfucker",
    "muther fuckers",
    "mutherfuckers",
    "muther fucking",
    "mutherfucking",
    "pissed",
    "pisser",
    "pissers",
    "pisses",
    "pissing",
    "piss take",
    "pisstake",
    "pissy",
    "pork",
    "prick",
    "pricks",
    "pronk",
    "pussies",
    "pussy",
    "quim",
    "quims",
    "rooted",
    "rooter",
    "rooters",
    "rooting",
    "roots",
    "screwed",
    "screwing",
    "screws",
    "shagged",
    "shagger",
    "shaggers",
    "shagging",
    "shags",
    "shite",
    "shited",
    "shiter",
    "shiters",
    "shites",
    "shitey",
    "shiting",
    "shit",
    "shits",
    "shitted",
    "shitter",
    "shitters",
    "shitting",
    "shitty",
    "sodded",
    "sodding",
    "sod",
    "sods",
    "spunk",
    "tit",
    "tits",
    "turd",
    "turds",
    "twat",
    "twats",
    "wanked",
    "wanker",
    "wankers",
    "wanking",
    "wank",
    "wanks",
}

return {
    is_contained_in = function (str)
        for i, substr in ipairs(PROFANITY) do
            if string.match(str, substr) then
                return true
            end
        end
        return false
    end,
}