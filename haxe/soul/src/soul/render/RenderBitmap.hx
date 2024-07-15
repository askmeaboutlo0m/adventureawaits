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

import openfl.display.BitmapData;
import openfl.geom.Matrix;


class RenderBitmap implements Renderable
{

    public var data  (default, default):BitmapData;
    public var width (get,     null   ):Float;
    public var height(get,     null   ):Float;

    public function new(d:BitmapData)
    {
        data = d;
    }


    public function renderTo(img:Image, px:Float, py:Float):Void
    {
        var g  = img.graphics;
        var tx = -px * data.width;
        var ty = -py * data.height;

        var m  = new Matrix();
        m.tx   = tx;
        m.ty   = ty;

        g.beginBitmapFill(data, m, false, true);
        g.drawRect(tx, ty, data.width, data.height);
        g.endFill();
    }


    function get_width():Float
        return data.width;

    function get_height():Float
        return data.height;

}