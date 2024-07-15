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

import soul.render.Image;
import soul.render.Renderable;
import soul.Util;


class Frame extends Delay
{

    var obj :Lazy<Image>;
    var data:Lazy<Renderable>;


    public function new(obj:Lazy<Image>, data:Lazy<Renderable>, ?time:LazyFloat)
    {
        super(time == null ? new LazyFloat(Plain(0.0)) : time);
        this.obj  = obj;
        this.data = data;
    }


    override public function animate(?complete:Void -> Void,
                                     ?parent  :Sequence):Void
    {
        var u:Dynamic = parent == null ? null : parent.userData;

        var o:Image =  obj|u;
        o.data      = data|u;
        o.render();

        super.animate(complete, parent);
    }

}
