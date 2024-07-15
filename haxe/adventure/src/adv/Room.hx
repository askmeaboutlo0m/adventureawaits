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
package adv;


class Room
{
    public var things (default, null   ):Array<Thing> = [];
    public var visited(default, default):Bool         = false;


    public function has(t:Thing):Bool
    {
        return things.indexOf(t) != -1;
    }

    public function add(t:Thing):Bool
    {
        if (!has(t)) {
            things.push(t);
            return true;
        }
        return false;
    }

    public function remove(t:Thing):Bool
    {
        return things.remove(t);
    }


    public function find(noun:String):Thing
    {
        for (t in things) {
            if (t.like(noun)) {
                return t;
            }
        }
        return null;
    }


    public function look()
    {
        return things.map(function (t:Thing) {
            return '- ${t.name}';
        }).join("\n");
    }
}
