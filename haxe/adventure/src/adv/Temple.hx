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


class Temple extends Room
{
    public function new()
    {
        things = [
            Thing.restroom,
            Thing.cafeteria,
            Thing.souvenierShop,
            Thing.statue,
            Thing.painting,
            Thing._nailInWall,
            Thing.flute,
            Thing.altar,
            Thing.yellowWeeds,
        ];
    }

    override public function look()
    {
        var lines = [
            "You find yourself in what looks to be an ancient temple. The",
            "entire room is made from dark brick and the walls are lined with",
            "huge pillars that extend high up to the dome ceiling.",
            "\n\n",
        ];

        if (has(Thing.secretPassage)) {
            lines.push("The stone ALTAR at the end of the room has slid");
            lines.push("aside and revealed a SECRET PASSAGE.");
        }
        else {
            lines.push("A stone ALTAR stands at the end of the room.");
        }

        lines.push("Next to it are a man-sized STATUE and a huge PAINTING.");
        lines.push("Doors lead to the CAFETERIA, RESTROOM and SOUVENIER SHOP.");

        return lines.join(" ");
    }
}
