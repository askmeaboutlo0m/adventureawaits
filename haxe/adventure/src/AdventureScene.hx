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
import adv.Adventure;
import adv.Parser;
import Main;
import motion.Actuate;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import soul.Util.QIO;
import soul.Util.rand;

using StringTools;

import openfl.display.FPS;
import openfl.events.ErrorEvent;
import openfl.events.UncaughtErrorEvent.UNCAUGHT_ERROR;


class AdventureScene extends Term
{
    static inline var FG = 0x657b83;
    static inline var BG = 0xfdf6e3;

    var adv:Adventure;

    var flasking = false;
    var buffered = new Array<String>();
    var waiting  = false;

    public var tripping(default, null   ) = false;
    public var trip    (default, default) = false;


    override public function new(soul)
    {
        super(soul, FG, BG, "> ");
        adv = new Adventure(this);
    }


    override public function setUp()
    {
        super.setUp();

        Main.uee.addEventListener(UNCAUGHT_ERROR, onError);

        adv.welcome();
        adv.setRoom("restroom");
        print("");
        putBuffer();
    }


    override public function tearDown()
    {
        super.tearDown();
        Main.uee.removeEventListener(UNCAUGHT_ERROR, onError);
    }

    function onError(e)
    {
        if (e.error != null && e.error.type != "securityError") {
            print('Uncaught error: ${e.error}');
        }
    }


    public function print(s:String)
    {
        var words = new Array<String>();
        var len   = 0;

        for (line in ~/\n/g.split(s)) {
            for (word in ~/\s+/g.split(line.trim())) {
                len += word.length;
                if (len + words.length - 1 >= Term.MAX_COL) {
                    buffered.push(words.join(" "));
                    words = [];
                    len   = word.length;
                }
                words.push(word);
            }
            buffered.push(words.join(" "));
            words = [];
            len   = 0;
        }
    }

    public function wait()
    {
        buffered.push(null);
    }

    function putBuffer()
    {
        if (buffered.length > 0) {
            var line = buffered.shift();
            if (line != null) {
                addLine(line);
                delay(0.02, putBuffer);
            }
            else {
                addLine("");
                addLine("(Hit any key to read on...)");
                waiting = true;
                ready   = false;
            }
        }
        else {
            ready = !adv.over;
            if (trip) {
                trip = false;
                if (!tripping) {
                    startTripping();
                }
                else {
                    stopTripping();
                }
            }
        }
    }


    function interpret(str:String)
    {
        var norm = ~/\s+/g.replace(str.trim().toLowerCase(), " ");

        if (norm == "get ye flask") {
            print("You can't get ye flask!");

            if (flasking = !flasking) {
                textColor  = 0x62ff51;
                stageColor = 0x1a1a1a;
            }
            else {
                textColor  = FG;
                stageColor = BG;
            }

            if (!tripping) {
                Actuate.transform(field,      0.5).color( textColor).ease(QIO);
                Actuate.transform(background, 0.5).color(stageColor).ease(QIO);
            }
        }
        else if (norm.length != 0) {
            Parser.parse(adv, norm);
        }
    }


    function startTripping()
    {
        function changeColor(d:Dynamic) {
            if (tripping) {
                Actuate.transform(d, rand(3, 6))
                       .color(Std.int(rand(0x000000, 0xffffff)))
                       .ease(QIO)
                       .onComplete(changeColor.bind(d));
            }
        }
        tripping = true;
        changeColor(background);
        changeColor(field);
    }

    function stopTripping()
    {
        tripping = false;
        Actuate.stop(background);
        Actuate.stop(field);
        Actuate.transform(field,      1).color( textColor).ease(QIO);
        Actuate.transform(background, 1).color(stageColor).ease(QIO);
    }


    override function onKey(e:KeyboardEvent)
    {
        if (ready) {
            if (e.charCode >= 32 && e.charCode <= 126 && input.length <= 40) {
                var char = String.fromCharCode(e.charCode);
                if (~/^[a-zA-Z ]$/.match(char)) {
                    input += char.toUpperCase();
                }
            }
            else if (e.charCode == 8 && input.length != 0) {
                input = input.substr(0, input.length - 1);
            }
            else if (e.charCode == 13) {
                if (~/\S/.match(input)) {
                    ready = false;
                    addLine('$prompt$input');

                    buffered.push("");
                    interpret(input);
                    buffered.push("");
                    input = "";

                    putBuffer();
                }
                else {
                    lines.push("Input?");
                    ready = false;
                    input = "";

                    delay(0.5, function () {
                        lines.pop();
                        ready = true;
                    });
                }
            }
        }
        else if (waiting) {
            waiting = false;
            lines.pop();
            putBuffer();
        }
    }
}
