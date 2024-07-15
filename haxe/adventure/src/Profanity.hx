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
class Profanity
{
    /*
     * This regular expression is based on the one from
     * Regexp::Common::profanity under the terms of the MIT License. The
     * authors of that module have nothing to do with this software.
     *
     * https://metacpan.org/pod/Regexp::Common::profanity
     *
     * Following is the original copyright and permission notice:
     *
     * Copyright (c) 2001 - 2008, Damian Conway and Abigail
     *
     * Permission is hereby granted, free of charge, to any person obtaining a copy
     * Of this software and associated documentation files (the "Software"), to deal
     * In the Software without restriction, including without limitation the rights
     * To use, copy, modify, merge, publish, distribute, sublicense, and/or sell
     * Copies of the Software, and to permit persons to whom the Software is
     * Furnished to do so, subject to the following conditions:
     *
     * The above copyright notice and this permission notice shall be included in
     * All copies or substantial portions of the Software.
     *
     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
     * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
     * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
     * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
     * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
     * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
     * THE SOFTWARE.
     */
    static var PROFANITY = ~/(?:p(?:ork|r(?:onk|icks?)|uss(?:ies|y)|iss(?: take|\-take|take|e(?:rs|[srd])|ing|y)?)|quims?|root(?:e(?:rs|[rd])|ing|s)?|s(?:od(?:d(?:ed|ing)|s)?|punk|crew(?:ed|ing|s)?|h(?:ag(?:g(?:e(?:rs|[dr])|ing)|s)?|it(?:t(?:e(?:rs|[dr])|ing|y)|e(?:rs|[sdry])|ing|[se])?))|t(?:urds?|wats?|its?)|wank(?:e(?:rs|[rd])|ing|s)?|a(?:rs(?:e(?: hole|\-hole|hole|[sd])|ing|e)|ss(?: holes?|\-holes?|ed|holes?|ing))|b(?:on(?:e(?:rs|[sr])|ing|e)|u(?:gger|ll(?: shit(?:t(?:e(?:rs|[dr])|ing)|s)?|\-shit(?:t(?:e(?:rs|[dr])|ing)|s)?|shit(?:t(?:e(?:rs|[dr])|ing)|s)?))|a(?:stard|ll(?:e(?:rs|[dr])|ing|s)?)|lo(?:ody|w(?: jobs?|\-jobs?|jobs?)))|c(?:ock(?: suck(?:ers?|ing)|\-suck(?:ers?|ing)|suck(?:ers?|ing)|s)?|rap(?:p(?:e(?:rs|[rd])|ing|y)|s)?|u(?:nts?|m(?:ing|ming|s)))|d(?:ongs?|ick(?: head|\-head|ed|head|ing|less|s)?)|f(?:uck(?:ed|ing|s)?|art(?:e[rd]|ing|[sy])?|eltch(?:e(?:rs|[rsd])|ing)?)|h(?:ump(?:e(?:rs|[rd])|ing|s)?|a(?:rd[\- ]?on|lf(?: a[sr]|\-a[sr]|a[sr])sed))|m(?:other(?: fuck(?:ers?|ing)|\-fuck(?:ers?|ing)|fuck(?:ers?|ing))|uth(?:a(?: fuck(?:ers?|ing|[aaa])|\-fuck(?:ers?|ing|[aaa])|fuck(?:ers?|ing|[aaa]))|er(?: fuck(?:ers?|ing)|\-fuck(?:ers?|ing)|fuck(?:ers?|ing)))|erde?))/;

    public static function isContainedIn(str:String)
    {
        return PROFANITY.match(~/[^a-z]/g.replace(str.toLowerCase(), ""));
    }
}
