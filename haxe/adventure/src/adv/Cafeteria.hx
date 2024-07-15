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


class Cafeteria extends Room
{
    public function new()
    {
        things = [
            Thing.temple,
            Thing.table,
            Thing.chewingGum,
            Thing.vendingMachine,
            Thing._jerkyInMachine,
        ];
    }

    override public function look()
    {
        var lines = [
            "You're bathing in the fluorescent lighting of a CAFETERIA.",
            "There's a VENDING MACHINE standing against the far wall",
            "and a cheap, round TABLE in the center of the room.",
            "This joint is pretty un-hip, you think to yourself, as you",
            "eye the exit back to the TEMPLE.",
        ];
        return lines.join(" ");
    }
}
