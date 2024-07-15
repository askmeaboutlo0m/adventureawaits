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


class RestRoom extends Room
{
    public function new()
    {
        things = [
            Thing.toilet,
            Thing.trashcan,
            Thing.shiny,
            Thing.restroomdoor,
        ];
    }

    override public function look()
    {
        var lines = [];
        lines.push("You're in a small room covered in white tile.");

        if (!visited) {
            lines.push("You're not sure how you got here.");
        }

        if (has(Thing.restroomdoor)) {
            lines.push("There is a single DOOR leading out of this room.");
        }

        if (has(Thing.temple)) {
            lines.push("The single DOOR out of this room leads to the TEMPLE.");
        }

        lines.push("Opposite of it, there is a TOILET. There's no other");
        lines.push("place for you to stand than right in front of it.");

        if (has(Thing.trashcan)) {
            lines.push("In the corner, there's a little plastic TRASHCAN.");
        }

        if (has(Thing.trash)) {
            lines.push("Inside, you saw some TRASH and a SHINY THING.");
        }

        if (has(Thing.fire)) {
            lines.push("There's a FIRE burning in the corner.");
        }

        if (has(Thing.soot)) {
            lines.push("In the corner, there's a pile of SOOT.");
        }

        return lines.join(" ");
    }
}
