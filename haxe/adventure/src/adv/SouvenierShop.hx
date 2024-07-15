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


class SouvenierShop extends Room
{
    public function new()
    {
        things = [
            Thing.clapper,
            Thing.slapChop,
            Thing.bowflex,
            Thing.temple,
        ];
    }

    override public function look()
    {
        var lines = [
            "This is the SOUVENIER SHOP of the TEMPLE, filled with kitsch.",
        ];

        if (has(Thing.clapper)) {
            lines.push("In the center of the room, there is a LAMP");
            lines.push("standing on a small pedestal.");
        }

        if (has(Thing.sparks)) {
            lines.push("SPARKS are happily flying from the");
            lines.push("filament of its exploded bulb.");
        }

        if (has(Thing.slapChop)) {
            lines.push("On the far wall, there's some plastic piece of");
            lines.push("junk that a sign identifies as a SLAP CHOP.");
        }
        else if (has(Thing._bladeInTable)) {
            lines.push("On the far wall, there's a BLADE stuck in a table.");
        }

        lines.push("In one corner, a complex-looking piece of WORKOUT");
        lines.push("EQUIPMENT has been set up.");

        return lines.join(" ");
    }
}
