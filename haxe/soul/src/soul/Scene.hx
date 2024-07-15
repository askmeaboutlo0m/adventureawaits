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
package soul;

import haxe.Timer;
import motion.Actuate;
import openfl.events.Event;
import soul.anim.Sequence;
import soul.render.Image;
import soul.render.Renderable;


class Scene
{

    public var soul      (default, null ):Soul;
    public var content   (get,     null ):Image;
    public var realWidth (get,     null ):Int;
    public var realHeight(get,     null ):Int;

    var listeners:Array<Array<Dynamic>> = [];
    var action                          = false;

    public function new(s:Soul)
    {
        soul = s;
    }

    public function construct()
    {
        action = true;
        setUp();
    }

    public function dispose()
    {
        action = false;
        tearDown();
        Actuate.reset();
        for (l in listeners)
            soul.removeEventListener(l[0], l[1], l[2]);
        soul.clear();
        soul = null;
    }

    public function setUp   ():Void { /* to be overridden */ }
    public function tearDown():Void { /* to be overridden */ }


    public inline function get_content   ():Image return soul.content;
    public inline function get_realWidth ():Int   return soul.realWidth;
    public inline function get_realHeight():Int   return soul.realHeight;


    public function addEventListener(type:String, listener:Dynamic -> Void,
                                     capture:Bool = false, priority:Int = 0,
                                     weak:Bool = false):Void
    {
        soul.addEventListener(type, listener, capture, priority, weak);
        listeners.push([type, listener, capture]);
    }

    public function removeEventListener(type:String, listener:Dynamic -> Void,
                                        capture:Bool = false):Void
    {
        soul.removeEventListener(type, listener, capture);
        for (i in 0 ... listeners.length)
        {
            var l = listeners[i];
            if (l[0] == type && l[1] == listener && l[2] == capture)
            {
                listeners.splice(i, 1);
                break;
            }
        }
    }


    public function delay(seconds:Float, call:Void -> Void):Timer
    {
        return Timer.delay(function() { if (soul != null) call(); },
                           Std.int(seconds * 1000));
    }


    public inline function setResize(enable:Bool):Void
        return soul.setResize(enable);

    public inline function getAsset(path:String):Renderable
        return soul.getAsset(path);

    public inline function getImage(key:String):Image
        return soul.getImage(key);

    public inline function add(key:String, ?args:Dynamic):Image
        return soul.add(key, args);

    public inline function addMultiple(list:Iterable<Dynamic>):Iterable<Image>
        return soul.addMultiple(list);

    public inline function addJson(path:String):Iterable<Image>
        return soul.addJson(path);

  #if yaml
    public inline function addYaml(path:String):Iterable<Image>
        return soul.addYaml(path);
  #end

    public inline function addAssets(assets:String):Iterable<Image>
        return soul.addAssets(assets);

    public inline function combine(attrs:Iterable<Dynamic>,
                            ?assets:Array<Dynamic>):Iterable<Dynamic>
        return soul.combine(attrs, assets);

    public inline function combineJson(path:String,
                                ?assets:Array<Dynamic>):Iterable<Dynamic>
        return soul.combineJson(path, assets);

  #if yaml
    public inline function combineYaml(path:String,
                                ?assets:Array<Dynamic>):Iterable<Dynamic>
        return soul.combineYaml(path, assets);
  #end

    public inline function combineAssets(path:String,
                                  ?assets:Array<Dynamic>):Iterable<Dynamic>
        return soul.combineAssets(path, assets);

    public inline function sequence(?img:Dynamic, ?easing:Dynamic):Sequence
        return soul.sequence(img, easing);

    public inline function remove(key:String):Bool
        return soul.remove(key);

    public inline function clear():Void
        return soul.clear();

    public inline function setScene(scene:Scene):Void
        soul.setScene(scene);


    public inline function setFrameOf(image:Dynamic, asset:Dynamic):Void
        soul.setFrameOf(image, asset);


    public inline function say(message:String):Void
        soul.say(message);
}
