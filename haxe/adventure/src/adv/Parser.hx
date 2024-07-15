/*
 * Copyright (c) 2017 askmeaboutloom
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */
package adv;

import AdventureScene;


class Parser
{
    static var SHORTCUTS = [
        "l"   => "look",
        "u"   => "use",
        "t"   => "take",
        "g"   => "go",
        "s"   => "speak",
        "h"   => "help",
        "i"   => "inventory",
        "inv" => "inventory",
    ];

    public function new() {}


    static function applyReplacements(str:String):String
    {
        for (r in Data.replacements) {
            str = r.re.replace(str, r.word);
        }
        return str;
    }


    static function isStopword(word:String):Bool
    {
        return Data.stopwords.indexOf(word) != -1;
    }


    static function mungeWords(input:Array<String>):Array<String>
    {
        var output = new Array<String>();

        if (input.length > 0) {
            if (SHORTCUTS.exists(input[0])) {
                output.push(SHORTCUTS[input.shift()]);
            }
            else {
                output.push(input.shift());
            }
        }

        var buffer = new Array<String>();

        for (word in input) {
            if (isStopword(word)) {
                if (buffer.length != 0) {
                    output.push(buffer.join(" "));
                    buffer = [];
                }
            }
            else {
                buffer.push(word);
            }
        }

        if (buffer.length != 0) {
            output.push(buffer.join(" "));
        }

        return output;
    }


    public static function parse(adv:Adventure, str:String)
    {
        var words = mungeWords(~/\s+/g.split(applyReplacements(str)));
        adv.interpret(words);
    }
}
