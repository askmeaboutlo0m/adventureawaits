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
import soul.Scene;
import soul.Macro.*;
import soul.Util.*;
import openfl.Assets;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event.ENTER_FRAME;
import openfl.events.Event.RESIZE;
import openfl.events.KeyboardEvent;
import openfl.events.KeyboardEvent.KEY_DOWN;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.ui.Keyboard;

using StringTools;


class Term extends Scene
{
    public static inline var MAX_COL  = 56;
    public static inline var MAX_LINE = 15;

    static var font:String = null;

    var stage     :Stage;
    var background:Sprite;
    var textColor :Int;
    var stageColor:Int;
    var prompt    :String;

    var field  = new TextField();
    var lines  = new Array<String>();
    var input  = "";
    var ready  = true;


    public function new(soul, textColor:Int, stageColor:Int, prompt = "")
    {
        super(soul);

        if (font == null) {
            font = Assets.getFont("assets/Inconsolata-Regular.ttf").fontName;
        }

        this.textColor  = textColor;
        this.stageColor = stageColor;
        this.prompt     = prompt;
    }


    override public function setUp()
    {
        stage = Lib.current.stage;

        background = new Sprite();
        stage.addChildAt(background, 0);
        stage.addEventListener(RESIZE, updateBackground);
        updateBackground(null);

        field.embedFonts   = true;
        field.type         = DYNAMIC;
        field.autoSize     = LEFT;
        field.mouseEnabled = false;
        field.selectable   = false;
        field.multiline    = true;

        field.defaultTextFormat = new TextFormat(font, 68, textColor);
        content.addChild(field);

        var onFrame = makeOnFrame();
        addEventListener(ENTER_FRAME, onFrame);
        onFrame(null);

        stage.addEventListener(KEY_DOWN, onKey);
    }


    override public function tearDown()
    {
        stage.removeChild(background);
        stage.removeEventListener(KEY_DOWN, onKey);
        content.removeChild(field);
    }


    function updateBackground(_)
    {
        var g = background.graphics;
        g.clear();
        g.beginFill(stageColor);
        g.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        g.endFill();
    }


    function addLine(line:String)
    {
        lines.push(line);
        lines.splice(0, lines.length - MAX_LINE + 1);
    }


    function makeOnFrame()
    {
        return function (_) {
            var text:String;

            if (ready) {
                var block  = Math.ffloor(Lib.getTimer() / 500) % 2 == 0 ? "_" : "";
                var nl     = lines.length != 0 ? "\n" : "";

                text = '${lines.join("\n")}$nl$prompt$input$block';
            }
            else {
                text = lines.join("\n");
            }

            if (text != field.text) {
                field.text = text;
            }
        };
    }


    function key(e:KeyboardEvent, ks:Array<Int>)
    {
        return ks.indexOf(e.keyCode) >= 0;
    }

    function ctrl(e:KeyboardEvent, ks:Array<Int>)
    {
        return e.ctrlKey && key(e, ks);
    }

    function onKey(e:KeyboardEvent)
    {
        // override me
    }
}
