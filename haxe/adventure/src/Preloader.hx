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
import motion.Actuate;
import motion.easing.Quad;
import openfl.display.Graphics;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.events.Event.COMPLETE;
import openfl.events.Event.RESIZE;
import openfl.events.ProgressEvent;
import openfl.events.ProgressEvent.PROGRESS;
import openfl.Lib;


class Preloader extends Sprite
{
    static inline var BG    = 0xffffff;
    static inline var FG    = 0x000000;
    static inline var ALPHA = 0.6;
    static inline var ROUND = 10.0;

    static inline var OUTER_RATIO_Y = 0.1;
    static inline var OUTER_RATIO_X = 0.9;
    static inline var INNER_RATIO_Y = 0.8;


    var sw = 1920.0;
    var sh = 1080.0;

    var background = new Sprite();
    var outer      = new Sprite();
    var inner      = new Sprite();


    public function new()
    {
        super();
        addEventListener(PROGRESS, onProgress);
        addEventListener(COMPLETE, onComplete);

        try {
            var s = Lib.current.stage;
            s.addEventListener(RESIZE, function (_) {
                setStageDimensions(s);
                redraw();
            });
            setStageDimensions(s);
        }
        catch (e:Dynamic) {}

        outer.alpha  = ALPHA;
        inner.scaleX = 0.0;
        redraw();

        addChild(background);
        addChild(outer);
        addChild(inner);
    }


    function setStageDimensions(s:Stage)
    {
        try {
            sw = s.stageWidth;
            sh = s.stageHeight;
        }
        catch (e:Dynamic) {}
    }


    function redraw()
    {
        var outerH = sh * OUTER_RATIO_Y;
        var outerW = sw * OUTER_RATIO_X;
        outer.x = (sw - outerW) / 2;
        outer.y = sh / 2;

        var innerH = outerH * INNER_RATIO_Y;
        var delta  = outerH - innerH;
        var innerW = outerW - delta;
        inner.x = outer.x + delta / 2;
        inner.y = outer.y;

        var g:Graphics;

        g = background.graphics;
        g.clear();
        g.beginFill(BG);
        g.drawRect(0, 0, sw, sh);
        g.endFill();

        g = outer.graphics;
        g.clear();
        g.beginFill(FG);
        g.drawRoundRect(0, outerH / -2, outerW, outerH, ROUND);
        g.endFill();

        g = inner.graphics;
        g.clear();
        g.beginFill(BG);
        g.drawRoundRect(0, innerH / -2, innerW, innerH, ROUND);
        g.endFill();
    }


    function onProgress(e:ProgressEvent)
    {
        inner.scaleX = e.bytesTotal > 0 ? e.bytesLoaded / e.bytesTotal : 0.0;
    }


    function onComplete(e:Event)
    {
        e.preventDefault();
        removeEventListener(COMPLETE, onComplete);
        Actuate
            .tween(outer, 0.5, {alpha : 0.0})
            .ease(Quad.easeInOut)
            .onComplete(dispatchEvent.bind(new Event(COMPLETE)));
    }
}
