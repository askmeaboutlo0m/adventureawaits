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

import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.geom.Point;

typedef Orig = {
    x       :Float,
    y       :Float,
    pivotX  :Float,
    pivotY  :Float,
    rotation:Float,
    scale   :Float,
    scaleX  :Float,
    scaleY  :Float,
    alpha   :Float,
    data    :Renderable,
};


class Image extends Sprite
{

    public var data  (default, set ):Null<Renderable>;
    public var pivotX(default, set ) = 0.0;
    public var pivotY(default, set ) = 0.0;
    public var scale (default, set ) = 1.0;
    public var relX  (get,     set ):Float;
    public var relY  (get,     set ):Float;
    public var orig  (default, null):Orig;
    public var userData             :Dynamic;

    public var position      (get, set):Point;
    public var globalPosition(get, set):Point;


    public function new(?data:Renderable, ?args:Dynamic,
                        ?container:DisplayObjectContainer)
    {
        super();
        this.data = data;
        set(args, container);
        render();
    }


    public function set(?args:Dynamic, ?container:DisplayObjectContainer):Void
    {
        if (args != null)
        {
            // x and y need to come first, otherwise positions get messed up
            for (key in ["x", "y"])
            {
                if (Reflect.hasField(args, key))
                {
                    Reflect.setProperty(this, key, Reflect.field(args, key));
                    Reflect.deleteField(args, key);
                }
            }
            // masksParent is magical
            if (Reflect.hasField(args, "masksParent"))
            {
                if (args.masksParent)
                    container.mask = this;
                Reflect.deleteField(args, "masksParent");
            }
            // other order is irrelevant
            for (key in Reflect.fields(args))
                Reflect.setProperty(this, key, Reflect.field(args, key));
        }

        orig = {
            x        : x,
            y        : y,
            pivotX   : pivotX,
            pivotY   : pivotY,
            rotation : rotation,
            scale    : scale,
            scaleX   : scaleX,
            scaleY   : scaleY,
            alpha    : alpha,
            data     : data,
        };
    }


    public function render():Void
    {
        graphics.clear();
        if (data != null)
            data.renderTo(this, pivotX, pivotY);
    }


    public function set_data(data:Renderable):Renderable
    {
        return this.data = data;
    }

    public function set_pivotX(relx:Float):Float
    {
        if (data == null)
            return 0.0;
        x += (relx - pivotX) * data.width;
        return pivotX = relx;
    }

    public function set_pivotY(rely:Float):Float
    {
        if (data == null)
            return 0.0;
        y += (rely - pivotY) * data.height;
        return pivotY = rely;
    }

    public function set_scale(scale:Float)
    {
        return this.scale = scaleX = scaleY = scale;
    }

    public function get_relX()
    {
        return x - orig.x;
    }

    public function set_relX(relX:Float)
    {
        x = orig.x + relX;
        return x - orig.x;
    }

    public function get_relY()
    {
        return y - orig.y;
    }

    public function set_relY(relY:Float)
    {
        y = orig.y + relY;
        return y - orig.y;
    }


    public function get_position():Point
    {
        return new Point(x, y);
    }

    public function set_position(p:Point):Point
    {
        x = p.x;
        y = p.y;
        return p;
    }

    public function get_globalPosition():Point
    {
        return parent.localToGlobal(new Point(x, y));
    }

    public function set_globalPosition(p:Point)
    {
        var local = parent.globalToLocal(p);
        x = local.x;
        y = local.y;
        return p;
    }
}
