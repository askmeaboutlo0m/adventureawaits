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

import motion.Actuate;
import motion.easing.IEasing;
import soul.render.Image;
import soul.Util;
import soul.Util.maybeCall;


class Tween implements Animatable
{

    var obj :Dynamic;
    var time:LazyFloat;
    var data:Dynamic;
    var ease:Lazy<IEasing>;


    public function new(obj:Dynamic, time:LazyFloat, data:Dynamic,
                        ?ease:Lazy<IEasing>)
    {
        this.obj  = obj;
        this.time = time;
        this.data = data;
        this.ease = ease;
    }


    public function animate(?complete:Void -> Void, ?parent:Sequence):Void
    {
        var u:Dynamic = parent == null ? null : parent.userData;

        var t:Dynamic = {};
        for (key in Reflect.fields(data))
            Reflect.setField(t, key, maybeCall(Reflect.field(data, key), u));

        var tween = Actuate.tween(maybeCall(obj, u), time|u, t);
        if (ease != null)
            tween.ease(ease|u);

        if (complete != null)
            tween.onComplete(complete);
    }


}
