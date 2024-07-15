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


class BossRoom extends Room
{
    public function new()
    {
        things = [
            Thing.dragon,
            Thing.dressShirt,
        ];
    }

    override public function look()
    {
        var lines:Array<String>;

        if (has(Thing.dragon)) {
            lines = [
                "You find yourself in a small room, which is mostly filled",
                "out by a large, fiersome DRAGON! It must be the root of all",
                "evil, the mastermind behind all of this. The air is hot and",
                "thick with smoke, filling you with anticipation and your",
                "lungs with carbon monoxide: you're ready for a fight!",
            ];
        }
        else {
            lines = [
                "You're standing in the now-empty room and are clutching your",
                "spoils of combat in each hand: the GREETING CARD and the",
                "TWENTY DOLLARS that were inside it. On the ground lay the",
                "broken pair of GLASSES you knocked down. In front of you are",
                "STAIRS leading upwards to the surface, from where sunlight",
                "is streaming in.",
            ];
        }

        return lines.join(" ");
    }
}
