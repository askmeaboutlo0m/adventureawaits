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
package soul.anim;

import haxe.ds.StringMap;
import motion.easing.IEasing;
import soul.render.Image;
import soul.Util;


class Attrs extends StringMap<LazyFloat>
{

    var seq          :Sequence;
    var image        :Lazy<Image>;
    var easings      :Array<Lazy<IEasing>> = [];
    var smartRotation:Bool                 = false;
    var setInitial   :Bool                 = false;

    public function new(seq:Sequence)
    {
        super();
        this.seq = seq;
    }


    function makeAnim(?time:LazyFloat):Sequence
    {
        if (image == null) image = new Lazy<Image>(Plain(seq.defaultImage));

        if (setInitial)
        {
            var s = new Set(image, this, null, null, smartRotation);
            s.animate(null, seq);
        }

        var easing:Lazy<IEasing>;
        if (easings.length == 0)
            easing = new Lazy<IEasing>(Plain(seq.defaultEasing));
        else if (easings.length == 1)
            easing = easings[0];
        else
            easing = pickEasing.bind(easings);

        return seq.add(new Set(image, this, time, easing, smartRotation));
    }

    public function apply():Sequence
        return makeAnim();

    public function tween(a:LazyFloat, ?b:LazyFloat):Sequence
        return makeAnim(b == null ? a : Util.random(a|null, b|null));

    public inline function p():Sequence
        return apply();

    public inline function t(a:LazyFloat, ?b:LazyFloat):Sequence
        return tween(a, b);


    static function pickEasing(es:Array<Lazy<IEasing>>, u:Dynamic):IEasing
        return es[Std.random(es.length)]|u;

    public function ease(e:Lazy<IEasing>)
    {
        easings.push(e);
        return this;
    }

    public inline function e(e:Lazy<IEasing>):Attrs
        return ease(e);


    public function smart(s:Bool = true):Attrs
    {
        smartRotation = s;
        return this;
    }


    public function initial(i:Bool = true):Attrs
    {
        setInitial = i;
        return this;
    }

    public inline function i(i:Bool = true):Attrs
        return initial(i);


    inline function rset(key:String, a:LazyFloat, ?b:LazyFloat):Attrs
    {
        if (b == null)
            set(key, a);
        else
            set(key, Util.random(a|null, b|null));
        return this;
    }


    public function x(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("x", a, b);

    public function y(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("y", a, b);

    public function rotation(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("rotation", a, b);

    public function alpha(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("alpha", a, b);

    public function scale(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("scale", a, b);

    public function scaleX(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("scaleX", a, b);

    public function scaleY(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("scaleY", a, b);

    public function pivotX(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("pivotX", a, b);

    public function pivotY(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("pivotY", a, b);

    public function relX(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("relX", a, b);

    public function relY(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("relY", a, b);


    public function r(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("rotation", a, b);

    public function a(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("alpha", a, b);

    public function s(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("scale", a, b);

    public function sx(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("scaleX", a, b);

    public function sy(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("scaleY", a, b);

    public function px(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("pivotX", a, b);

    public function py(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("pivotY", a, b);

    public function rx(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("relX", a, b);

    public function ry(a:LazyFloat, ?b:LazyFloat):Attrs
        return rset("relY", a, b);
}
