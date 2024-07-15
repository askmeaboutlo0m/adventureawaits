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

import motion.easing.IEasing;
import motion.easing.Linear.easeNone;
import soul.render.Image;
import soul.render.Renderable;
import soul.Soul;
import soul.Util;


class Sequence implements Animatable
{

    public var defaultImage (default, default):Image;
    public var defaultEasing(default, default):IEasing;
    public var userData     (default, default):Dynamic;
    public var map          (get,     never  ):Attrs;
    public var imap         (get,     never  ):Attrs;

    var soul:Soul;
    var elements = new Array<Animatable>();


    public function new(soul:Soul, ?img:Image, ?easing:IEasing, ?data:Dynamic)
    {
        this.soul     = soul;
        defaultImage  = img;
        defaultEasing = easing == null ? easeNone : easing;
        userData      = data == null ? {} : data;
    }


    public function animate(?complete:Void -> Void, ?parent:Sequence):Void
    {
        if (parent == null)
            parent = this;

        var i    = elements.length - 1;
        var func = complete == null ? function(){} : complete;
        while (i >= 0)
            func = elements[i--].animate.bind(func, parent);

        func();
    }

    public function start(?complete:Void -> Void):Sequence
    {
        animate(complete);
        return this;
    }

    public function loop():Sequence
    {
        animate(function() { loop(); });
        return this;
    }


    public function add(element:Animatable):Sequence
    {
        elements.push(element);
        return this;
    }


    public function get_map():Attrs
        return new Attrs(this);

    public function get_imap():Attrs
        return new Attrs(this).initial();


    public function tween(time:LazyFloat, data:Dynamic,
                          ?ease:Lazy<IEasing>, ?obj:Dynamic):Sequence
    {
        if (obj  == null) obj  = defaultImage;
        if (ease == null) ease = new Lazy<IEasing>(Plain(defaultEasing));
        return add(new Tween(obj, time, data, ease));
    }

    public function color(time:LazyFloat, color:LazyFloat,
                          ?alpha:LazyFloat, ?ease:Dynamic,
                          ?obj:Lazy<Image>):Sequence
    {
        if (obj  == null) obj  = new Lazy<Image  >(Plain(defaultImage));
        if (ease == null) ease = new Lazy<IEasing>(Plain(defaultEasing));
        return add(new Color(obj, time, color, alpha, ease));
    }

    public function delay(a:LazyFloat, ?b:LazyFloat):Sequence
    {
        return add(new Delay(b == null ? a : Util.random(a|null, b|null)));
    }

    public function call(func:VoidOrDynamic):Sequence
    {
        return add(new Call(func));
    }

    public function cancel(func:Lazy<Bool>):Sequence
    {
        return add(new Cancel(func));
    }

    public function parallel(anim:Lazy<Sequence>):Sequence
    {
        return add(new Parallel(anim));
    }

    public function frame(renderable:StringOrLazy<Renderable>, ?time:LazyFloat,
                          ?obj:Lazy<Image>):Sequence
    {
        var data:Lazy<Renderable> = switch renderable.getType()
        {
            case Left(str): soul.getAsset(str);
            case Right(lz): lz;
        };
        if (obj == null) obj = new Lazy<Image>(Plain(defaultImage));
        return add(new Frame(obj, data, time));
    }


    public function attr(d:Dynamic):Sequence
    {
        return add(new Call(function(u:Dynamic)
        {
            for (key in Reflect.fields(d))
                Reflect.setField(u, key, Util.maybeCall(Reflect.field(d, key), u));
        }));
    }

}
