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

import haxe.Json;
import haxe.Timer;
#if yaml
import yaml.Yaml;
import yaml.Parser;
#end
#if flash
import flash.ui.ContextMenu;
#end
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.events.Event.RESIZE;
import openfl.events.EventDispatcher;
import openfl.Lib.current;
import openfl.text.TextField;
import openfl.text.TextFormat;
import soul.anim.Sequence;
import soul.asset.Asset;
import soul.render.Image;
import soul.render.Renderable;
import soul.render.RenderMovieClip;
import soul.Util;


class Soul extends Image
{

    public var soul      (default, null ):Soul;
    public var container (default, null ):Dynamic;
    public var realWidth (default, null ):Int;
    public var realHeight(default, null ):Int;
    public var cover     (default, set  ):Bool;
    public var content   (default, null ):Image = new Image();

    var assetPrefix   : String;
    var assetHandlers : Iterable<AssetHandler>;
    var images        = new Map<String, Image>();
    var assets        = new Map<String, Asset>();

    var coverMask = new Sprite();
    var resizing  = false;
  #if debug
    public var debug(default, null):Debug;
    var sayField:TextField;
  #end

    var currentScene:Scene;


    public function new(?args:Dynamic)
    {
        super();
        soul = this;

        if (args == null)
            args = {};

        Util.fillDefaults(args, {
            container     : current.stage,
            width         : 1920,
            height        : 1080,
            assetPrefix   : "assets",
            assetHandlers : Util.defaultAssetHandlers(),
            assetTypes    : [AssetType.IMAGE, AssetType.TEXT],
            cover         : true,
            contextMenu   : false,
        });

        container     = args.container;
        realWidth     = args.width;
        realHeight    = args.height;
        assetPrefix   = args.assetPrefix;
        assetHandlers = args.assetHandlers;

        var types:Iterable<AssetType> = args.assetTypes;
        for (type in types)
            findAssets(type);

        if (args.assets != null)
            addAssets(args.assets);

        addChild(content);
        addChild(coverMask);
        content.mask = coverMask;

        setResize(true);
        set_cover(args.cover);

      #if flash
        if (!args.contextMenu)
        {
            try
            {
                contextMenu = new ContextMenu();
                contextMenu.builtInItems.forwardAndBack = false;
                contextMenu.builtInItems.loop           = false;
                contextMenu.builtInItems.play           = false;
                contextMenu.builtInItems.print          = false;
                contextMenu.builtInItems.rewind         = false;
                contextMenu.builtInItems.save           = false;
                contextMenu.builtInItems.zoom           = false;
                contextMenu.builtInItems.quality        = true;
            }
            catch (e:Dynamic)
            {
                trace(e);
            }
        }
      #end

      #if debug
        debug = new Debug(this);
      #end
    }


    public function set_cover(c:Bool)
    {
        cover = c;
        content.mask = cover ? coverMask : null;
        resize();
        return cover;
    }


    public function delay(seconds:Float, call:Void -> Void):Timer
    {
        return Timer.delay(call, Std.int(seconds * 1000));
    }


    function getResizeWidth():Float
    {
        try
            return cast(container, Stage).stageWidth
        catch (e:Dynamic)
            return container.width;
    }

    function getResizeHeight():Float
    {
        try
            return cast(container, Stage).stageHeight
        catch (e:Dynamic)
            return container.height;
    }

    function resize(?e:Event):Void
    {
        var sw    = getResizeWidth ();
        var sh    = getResizeHeight();
        var ratio = sw / realWidth;
        var xpos, ypos : Float;

        if (realHeight * ratio > sh)
        {
            ratio = sh / realHeight;
            xpos  = (sw - realWidth  * ratio) / 2;
            ypos  = 0;
        }
        else
        {
            xpos  = 0;
            ypos  = (sh - realHeight * ratio) / 2;
        }

        content.scaleX = content.scaleY = ratio;
        content.x      = xpos;
        content.y      = ypos;

        var g = coverMask.graphics;
        g.clear();
        if (cover)
        {
            g.beginFill(0);
            g.drawRect(content.x, content.y, realWidth * ratio, realHeight * ratio);
            g.endFill();
        }

      #if debug
        if (sayField != null) {
            sayField.y = current.stage.stageHeight - sayField.height;
        }
      #end
    }

    public function setResize(enable:Bool)
    {
        var d:EventDispatcher = container; // for neko
        if (enable && !resizing)
            d.addEventListener   (RESIZE, resize);
        else if (!enable && resizing)
            d.removeEventListener(RESIZE, resize);

        if ((resizing = enable))
            resize();
    }


    public function findAssets(type:AssetType):Void
    {
        var re = ~/^(.+)\.([^.\/]+)$/;
        for (path in Assets.list(type))
        {
            if (path.indexOf(assetPrefix) == 0 && re.match(path))
            {
                var key    = re.matched(1);
                var suffix = re.matched(2).toLowerCase();
                for (handler in assetHandlers)
                {
                    var asset:Null<Asset> = handler(path, suffix, type);
                    if (asset != null)
                    {
                        assets[key] = asset;
                        break;
                    }
                }
            }
        }
    }


    function assetPath(path:String):String
    {
        var abs = path.indexOf(":") < 0 ? '$assetPrefix/$path' : path;
        return path.charAt(0) == "/" ? path.substr(1) : abs;
    }


    public function getAsset(path:String):Renderable
    {
        var key = assetPath(path);
        if (key.indexOf(":") < 0)
        {
            if (!assets.exists(key))
                throw new SoulError('Asset not found: "$path" ($key)');
            return assets[key].get();
        }
        else
        {
            return new RenderMovieClip(Assets.getMovieClip(key));
        }
    }


    public function getImage(key:String):Image
    {
        if (!images.exists(key))
            throw new SoulError('Image not found: "$key"');
        return images[key];
    }


    public function add(key:String, ?args:Dynamic):Image
    {
        if (key != null && images.exists(key))
            throw new SoulError('Image already exists: "$key"');

        if (args == null)
            args = {};

        var render:Renderable = null;
        var asset :Dynamic = Reflect.hasField(args, "asset") ? args.asset : key;
        if (asset != null)
        {
            if (Std.is(asset, Renderable))
                render = asset;
            else
                render = getAsset(asset);
        }

        Util.fillDefaults(args, {
            x            : 0,
            y            : 0,
            parent       : content,
            relative     : content,
            mouseEnabled : false,
        });

        for (k in ["parent", "relative"])
        {
            if (Std.is(Reflect.field(args, k), String))
                Reflect.setField(args, k, getImage(Reflect.field(args, k)));
        }

        var rel:Image = args.parent;
        while (rel != args.relative)
        {
            args.x -= rel.x;
            args.y -= rel.y;

            if (!Std.is(rel.parent, Image))
                throw new SoulError('Can\'t find relative position for "$key"');

            rel = cast(rel.parent, Image);
        }

        var imgArgs = Reflect.copy(args);
        for (k in ["asset", "parent", "relative"])
            Reflect.deleteField(imgArgs, k);
        var img = new Image(render, imgArgs, args.parent);

        if (key != null)
            images[key] = img;
        args.parent.addChild(img);

        return img;
    }


    public function addMultiple(list:Iterable<Dynamic>):Iterable<Image>
    {
        return Lambda.map(list, function(v:Dynamic)
        {
            var args = Reflect.copy(v);
            Reflect.deleteField(args, "key");
            return add(v.key, args);
        });
    }

    public function addJson(path:String):Iterable<Image>
    {
        var json = Assets.getText(assetPath(path));
        if (json == null)
            throw new SoulError('JSON asset not found: "$path"');
        return addMultiple(Json.parse(json));
    }

  #if yaml
    public function addYaml(path:String):Iterable<Image>
    {
        var yaml = Assets.getText(assetPath(path));
        if (yaml == null)
            throw new SoulError('YAML asset not found: "$path"');

        var opts  = new ParserOptions();
        opts.maps = false;
        return addMultiple(Yaml.parse(yaml, opts));
    }
  #end

    public function addAssets(assets:String):Iterable<Image>
    {
        if (~/\.json$/.match(assets))
            return addJson(assets);
      #if yaml
        else if (~/\.y(a)?ml$/i.match(assets))
            return addYaml(assets);
      #end
        else
            throw new SoulError("Don't know how to load assets"
                              + 'from "${assets}"');
    }


    static function findKey(key:String, assets:Array<Dynamic>):Null<Int>
    {
        for (i in 0 ... assets.length)
            if (assets[i].key == key)
                return i;
        return null;
    }

    static function relativePos(what:String, key:String, delta:Int,
                                assets:Array<Dynamic>):Int
    {
        var pos = findKey(key, assets);
        if (pos == null)
            throw new SoulError('Can\'t find "$key" in "$what"');

        pos += delta;
        if (pos < 0)
            throw new SoulError('Invalid offset "$pos" in "$what: $key"');

        return pos;
    }

    static function makeLike(args:Dynamic, key:String, assets:Array<Dynamic>)
    {
        var pos = findKey(key, assets);
        if (pos == null)
            throw new SoulError('Can\'t find "$key" in "LIKE" for ${args.key}');

        var other = assets[pos];

        for (field in Reflect.fields(other))
            if (!Reflect.hasField(args, field))
                Reflect.setField(args, field, Reflect.field(other, field));
    }

    static function setAssetProperty(assets:Array<Dynamic>, asset:Dynamic,
                                     args:Dynamic, key:String):Void
    {
        var value:Dynamic = Reflect.field(args, key);

        var rx = ~/^\s*\.\s*([^\.]+)(\.(\w+))?\s*$/;
        if (Std.is(value, String) && rx.match(value)) {
            var other = rx.matched(1);
            var i     = findKey(other, assets);

            if (i == null)
                throw new SoulError('Can\'t find "$other" in "$value"');

            var otherKey = rx.matched(3);

            if (otherKey != null && otherKey.length != 0)
                value = Reflect.getProperty(assets[i], otherKey);
            else
                value = Reflect.getProperty(assets[i], key);
        }

        Reflect.setProperty(asset, key, value);
    }

    public function combine(attrs:Iterable<Dynamic>,
                            ?assets:Array<Dynamic>):Iterable<Dynamic>
    {
        if (assets == null)
            assets = new Array<Dynamic>();

        for (args in attrs)
        {
            if (Reflect.hasField(args, "INCLUDE"))
            {
                var include:Dynamic = args.INCLUDE;
                if (Std.is(include, String))
                    combineAssets(include, assets);
                else
                    combine(include, assets);
            }
            else if (Reflect.hasField(args, "REMOVE"))
            {
                var key:String = args.REMOVE;
                var found = findKey(key, assets);
                if (found == null)
                    trace('Warning: ignored REMOVE for nonexistent "$key"');
                else
                    assets.splice(found, 1);
            }
            else if (Reflect.hasField(args, "key"))
            {
                var found:Dynamic   = null;
                var pos  :Null<Int> = null;
                var delta:Int       = 0;

                if (Reflect.hasField(args, "DELTA"))
                    delta = args.DELTA;
                if (Reflect.hasField(args, "BEFORE"))
                    pos = relativePos("BEFORE", args.BEFORE, 0 - delta, assets);
                if (Reflect.hasField(args, "AFTER"))
                    pos = relativePos("AFTER",  args.AFTER,  1 + delta, assets);
                if (Reflect.hasField(args, "LIKE"))
                    makeLike(args, args.LIKE, assets);

                var found = findKey(args.key, assets);
                var asset = found == null ? {} : assets[found];

                for (key in Reflect.fields(args))
                    if (~/^[^A-Z]/.match(key))
                        setAssetProperty(assets, asset, args, key);

                if (pos != null)
                {
                    if (found != null)
                    {
                        assets.splice(found, 1);
                        if (pos > found)
                            --pos;
                    }
                    assets.insert(pos, asset);
                }
                else if (found == null)
                {
                    assets.push(asset);
                }
            }
            else
            {
                throw new SoulError("Missing 'INCLUDE', 'REMOVE' or 'key' in "
                                  + "attributed assets");
            }
        }

        return assets;
    }

    public function combineJson(path:String,
                                ?assets:Array<Dynamic>):Iterable<Dynamic>
    {
        var json = Assets.getText(assetPath(path));
        if (json == null)
            throw new SoulError('JSON asset not found: "$path"');
        return combine(Json.parse(json), assets);
    }

  #if yaml
    public function combineYaml(path:String,
                                ?assets:Array<Dynamic>):Iterable<Dynamic>
    {
        var yaml = Assets.getText(assetPath(path));
        if (yaml == null)
            throw new SoulError('YAML asset not found: "$path"');

        var opts  = new ParserOptions();
        opts.maps = false;
        return combine(Yaml.parse(yaml, opts), assets);
    }
  #end

    public function combineAssets(path:String,
                                  ?assets:Array<Dynamic>):Iterable<Dynamic>
    {
        if (~/\.json$/.match(path))
            return combineJson(path, assets);
      #if yaml
        else if (~/\.y(a)?ml$/i.match(path))
            return combineYaml(path, assets);
      #end
        else
            throw new SoulError("Don't know how to set asset attributes"
                              + 'from "${path}"');
    }


    public function remove(key:String):Bool
    {
        var obj:Image = getImage(key);

        if (obj != null && obj.parent != null)
            obj.parent.removeChild(obj);

        return images.remove(key);
    }

    public function clear()
    {
        var keys = new Array<String>();
        for (k in images.keys())
            keys.push(k);
        for (k in keys)
            remove(k);
    }


    public function sequence(?img:Dynamic, ?easing:Dynamic):Sequence
    {
        return new Sequence(this, Std.is(img, String) ? getImage(img) : img,
                            easing);
    }


    public function setScene(scene:Scene):Void
    {
        if (currentScene != null)
            currentScene.dispose();

        if ((currentScene = scene) != null)
            currentScene.construct();
    }


    public function setFrameOf(image:Dynamic, asset:Dynamic):Void
    {
        if (Std.is(image, String))
            image = getImage(image);

        if (Std.is(asset, String))
            asset = getAsset(asset);

        image.data = asset;
        image.render();
    }


    public function say(message:String):Void
    {
      #if debug
        if (sayField == null) {
            var format  = new TextFormat();
            format.font = "Courier New";
            format.bold = true;
            format.size = 20;

            sayField                   = new TextField();
            sayField.defaultTextFormat = format;
            sayField.background        = true;
            sayField.autoSize          = LEFT;
            sayField.alpha             = 0.8;

            current.stage.addChild(sayField);
        }

        sayField.text = message;
        sayField.y    = current.stage.stageHeight - sayField.height;
      #end
    }
}
