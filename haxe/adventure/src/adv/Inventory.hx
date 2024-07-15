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


class Inventory extends Room
{
    public function new()
    {
        things = [
            Thing.self,
            Thing.clothes,
            Thing.restroom,
            Thing.hands,
            Thing.room,
            Thing.floor,
            Thing.ceiling,
            Thing.wall,
            Thing.narrator,
        ];
    }


    override public function look()
    {
        var names = things
            .filter(function (t) { return t.inv.length != 0; })
            .map(function (t) { return t.inv; });

        if (names.length == 0) {
            return "You have nothing, not even yourself!";
        }
        else if (names.length == 1) {
            return 'You have only ${names[0]}.';
        }
        else {
            var last = names.pop();
            return 'You have ${names.join(", ")} and $last.';
        }
    }
}
