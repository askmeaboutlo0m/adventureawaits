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
package soul.render;

import openfl.display.MovieClip;
import openfl.display.Sprite;


class RenderMovieClip implements Renderable
{

    public var data  (default, default):MovieClip;
    public var width (get,     null)   :Float;
    public var height(get,     null)   :Float;

    public function new(d:MovieClip)
    {
        data = d;
    }


    public function renderTo(img:Image, px:Float, py:Float):Void
    {
        var wrapper = new Sprite();
        wrapper.addChild(data);
        data.x = data.width  * px;
        data.y = data.height * py;
        img.addChild(wrapper);
        wrapper.x = -data.width  * 2 * px;
        wrapper.y = -data.height * 2 * py;
    }


    function get_width():Float
        return data.width;

    function get_height():Float
        return data.height;

}
