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


class SecretPassage extends Room
{
    public function new()
    {
        things = [
            Thing.temple,
            Thing.exitDoor,
            Thing.lever,
            Thing._holePipes,
        ];
    }

    override public function look()
    {
        var lines = [
            "You're at the foot of some stone stairs underneath the TEMPLE.",
            'In front of you is a DOOR with a glowing green "exit" sign above',
            "it. Next to it is a big old LEVER, connected to an intricate",
            "system of hydraulic PIPES that somehow seem to operate the DOOR.",
        ];

        if (has(Thing._gumPipes)) {
            lines.push("You stuck some CHEWING GUM around the rim of the");
            lines.push("hole in the PIPES.");
        }
        else if (has(Thing._nailPipes)) {
            lines.push("You stuck your rusty NAIL into the hole in the PIPES.");
        }
        else if (has(Thing._fixedPipes)) {
            lines.push("You made a makeshift patch for a hole in the PIPES");
            lines.push("from your rusty NAIL and some CHEWING GUM.");
        }

        return lines.join(" ");
    }
}
