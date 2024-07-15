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
package soul;
import openfl.events.Event.ENTER_FRAME;
import openfl.events.KeyboardEvent.KEY_DOWN;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.ui.Keyboard;
import soul.render.Image;


private class DebugField extends TextField
{

    public static var FORMAT = new TextFormat("sans-serif");
    public static var INPUT  = 0xaaffff;
    public static var LABEL  = 0xffaaff;

    public var update:String -> DebugField -> Void;


    public function new(h:Float, ?t:String)
    {
        super();

        background        = true;
        defaultTextFormat = FORMAT;
        height            = 20;
        width             = 60;
        y                 = 20 * h;

        if (t == null)
        {
            backgroundColor = INPUT;
            type            = TextFieldType.INPUT;
            x               = width;
        }
        else
        {
            backgroundColor = LABEL;
            text            = ' $t';
        }
    }

}


class Debug extends Sprite
{

    var FIELDS = ["image", "current", "x", "y", "relX", "relY", "rotation",
                  "scaleX", "scaleY", "scale", "pivotX", "pivotY", "alpha"];
    var fields = new Map<String, DebugField>();

    var soul   :Soul;
    var current:String;
    var image  :Image;

    var enabled(default, set):Bool;


    public function new(s:Soul)
    {
        super();
        soul = s;

        var i = 0;
        for (f in FIELDS)
        {
            var label = new DebugField(i, '$f:');
            var input = new DebugField(i);
            addChild(label);
            addChild(input);

            input.update = Reflect.hasField(this, '${f}Update')
                         ? Reflect.field(   this, '${f}Update')
                         : updateDefault;

            var change = Reflect.hasField(this, '${f}Change')
                       ? Reflect.field(   this, '${f}Change')
                       : changeDefault;
            input.addEventListener(KEY_DOWN, function(e)
            {
                if (e.keyCode == Keyboard.ENTER)
                {
                    change(f, input.text);
                    // XXX: For some strange reason, hitting enter in a text
                    //      field just keeps firing the KEY_DOWN event until
                    //      the field is hidden again.
                    //      This is a hack that hides the field, shows it
                    //      again and then sets the input focus back to it.
                    input.visible    = false;
                    input.visible    = true;
                    soul.stage.focus = input;
                }
            });

            if (Reflect.hasField(this, '${f}Init'))
                Reflect.field(this, '${f}Init')(input);

            fields[f] = input;
            ++i;
        }

        soul.stage.addEventListener(KEY_DOWN, function(e)
        {
            if (e.keyCode == Keyboard.F12)
                enabled = !enabled;
        });
        addEventListener(ENTER_FRAME, function(_)
        {
            for (key in fields.keys())
            {
                var f = fields[key];
                if (soul.stage.focus != f)
                    f.update(key, f);
            }
        });

        enabled = visible = mouseEnabled = false;
        alpha   = 0.8;
        soul.addChild(this);
    }


    function set_enabled(e:Bool)
    {
        return enabled = visible = mouseEnabled = e;
    }


    function imageChange(k:String, text:String)
    {
        try
        {
            image   = soul.getImage(text);
            current = text;

            for (k in fields.keys())
                fields[k].update(k, fields[k]);
        }
        catch (e:SoulError)
        {
            /* ignore it */
        }
    }

    function imageUpdate(_, _) {}


    function currentInit(f:DebugField)
    {
        f.backgroundColor = DebugField.LABEL;
        f.type            = TextFieldType.DYNAMIC;
    }

    function currentChange(_, _) {}

    function currentUpdate(k:String, f:DebugField)
    {
        if (current != null)
            f.text = current;
    }


    function updateDefault(k:String, f:DebugField)
    {
        if (image != null)
            f.text = '${Reflect.getProperty(image, k)}';
    }

    function changeDefault(k:String, text:String)
    {
        if (image != null && ~/^-?(\d+|\d*\.\d+)$/.match(text))
        {
            var val:Float = Std.parseFloat(text);
            Reflect.setProperty(image, k, val);
            image.render();
            for (k in fields.keys())
                fields[k].update(k, fields[k]);
        }
    }

}
