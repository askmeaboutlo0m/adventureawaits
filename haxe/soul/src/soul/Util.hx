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

import haxe.ds.Either;
import openfl.Assets;
import openfl.geom.Point;
import motion.easing.*;
import soul.asset.Asset;
import soul.asset.BitmapAsset;
#if svg
import soul.asset.SVGAsset;
#end

typedef AssetHandler = String -> String -> AssetType -> Null<Asset>;


enum Three<T>
{
    Plain(v:T);
    VFunc(v:Void    -> T);
    DFunc(v:Dynamic -> T);
}

abstract Lazy<T>(Three<T>)
{
    public inline function new(t:Three<T>)
        this = t;

    @:from static inline function fromPlain<T>(v:T):Lazy<T>
        return new Lazy<T>(Plain(v));

    @:from static inline function fromVFunc<T>(v:Void -> T):Lazy<T>
        return new Lazy<T>(VFunc(v));

    @:from static inline function fromDFunc<T>(v:Dynamic -> T):Lazy<T>
        return new Lazy<T>(DFunc(v));

    @:op(A|B)
    public inline function call(u:Dynamic):T
        return switch this
        {
            case Plain(v): v;
            case VFunc(v): v();
            case DFunc(v): v(u);
        };
}

// Compiler can't figure out on its own that Int and Float are unifiable.
abstract LazyFloat(Three<Float>)
{
    public inline function new(t:Three<Float>)
        this = t;

    @:from static inline function fromPlain(v:Float):LazyFloat
        return new LazyFloat(Plain(v));

    @:from static inline function fromVFunc(v:Void -> Float):LazyFloat
        return new LazyFloat(VFunc(v));

    @:from static inline function fromDFunc(v:Dynamic -> Float):LazyFloat
        return new LazyFloat(DFunc(v));

    @:from static inline function fromPlainInt(i:Int):LazyFloat
    {
        var v:Float = i;
        return new LazyFloat(Plain(v));
    }

    @:from static inline function fromVFuncInt(i:Void -> Int):LazyFloat
    {
        var v:Void -> Float = i;
        return new LazyFloat(VFunc(v));
    }

    @:from static inline function fromDFuncInt(i:Dynamic -> Int):LazyFloat
    {
        var v:Dynamic -> Float = i;
        return new LazyFloat(DFunc(v));
    }

    @:op(A|B)
    public inline function call(u:Dynamic):Float
        return switch this
        {
            case Plain(v): v;
            case VFunc(v): v();
            case DFunc(v): v(u);
        };
}


abstract StringOrLazy<T>(Either<String, Lazy<T>>)
{
    public inline function new(t:Either<String, Lazy<T>>)
        this = t;

    @:from static inline function fromString<T>(v:String):StringOrLazy<T>
        return new StringOrLazy<T>(Left(v));

    @:from static inline function fromPlain<T>(v:T):StringOrLazy<T>
        return new StringOrLazy<T>(Right(new Lazy<T>(Plain(v))));

    @:from static inline function fromVFunc<T>(v:Void -> T):StringOrLazy<T>
        return new StringOrLazy<T>(Right(new Lazy<T>(VFunc(v))));

    @:from static inline function fromDFunc<T>(v:Dynamic -> T):StringOrLazy<T>
        return new StringOrLazy<T>(Right(new Lazy<T>(DFunc(v))));

    public inline function getType():Either<String, Lazy<T>>
        return this;
}


abstract VoidOrDynamic(Either<Void -> Void, Dynamic -> Void>)
{
    public inline function new(t:Either<Void -> Void, Dynamic -> Void>)
        this = t;

    @:from static inline function fromVFunc(v:Void -> Void):VoidOrDynamic
        return new VoidOrDynamic(Left(v));

    @:from static inline function fromDFunc<T>(v:Dynamic -> Void):VoidOrDynamic
        return new VoidOrDynamic(Right(v));

    public inline function getType():Either<Void -> Void, Dynamic -> Void>
        return this;

    @:op(A|B)
    public inline function call(u:Dynamic):Void
        switch this
        {
            case Left (v): v();
            case Right(v): v(u);
        };
}


class Util
{
    public static var ZERO(default, never) = new Point(0, 0);

    public static var LN (default, never):IEasing = Linear.easeNone;

    public static var BI (default, never):IEasing = Bounce.easeIn;
    public static var BO (default, never):IEasing = Bounce.easeOut;
    public static var BIO(default, never):IEasing = Bounce.easeInOut;

    public static var CI (default, never):IEasing = Cubic.easeIn;
    public static var CO (default, never):IEasing = Cubic.easeOut;
    public static var CIO(default, never):IEasing = Cubic.easeInOut;

    public static var EI (default, never):IEasing = Elastic.easeIn;
    public static var EO (default, never):IEasing = Elastic.easeOut;
    public static var EIO(default, never):IEasing = Elastic.easeInOut;

    public static var KI (default, never):IEasing = Back.easeIn;
    public static var KO (default, never):IEasing = Back.easeOut;
    public static var KIO(default, never):IEasing = Back.easeInOut;

    public static var NI (default, never):IEasing = Quint.easeIn;
    public static var NO (default, never):IEasing = Quint.easeOut;
    public static var NIO(default, never):IEasing = Quint.easeInOut;

    public static var QI (default, never):IEasing = Quad.easeIn;
    public static var QO (default, never):IEasing = Quad.easeOut;
    public static var QIO(default, never):IEasing = Quad.easeInOut;

    public static var RI (default, never):IEasing = Quart.easeIn;
    public static var RO (default, never):IEasing = Quart.easeOut;
    public static var RIO(default, never):IEasing = Quart.easeInOut;

    public static var SI (default, never):IEasing = Sine.easeIn;
    public static var SO (default, never):IEasing = Sine.easeOut;
    public static var SIO(default, never):IEasing = Sine.easeInOut;

    public static var XI (default, never):IEasing = Expo.easeIn;
    public static var XO (default, never):IEasing = Expo.easeOut;
    public static var XIO(default, never):IEasing = Expo.easeInOut;


    public static function defaultAssetHandlers():Array<AssetHandler>
    {
        return [
            BitmapAsset.load,
          #if svg
            SVGAsset.load,
          #end
        ];
    }


    public static function fillDefaults(struct:Dynamic, defaults:Dynamic):Void
    {
        for (key in Reflect.fields(defaults))
        {
            if (!Reflect.hasField(struct, key))
                Reflect.setField(struct, key, Reflect.field(defaults, key));
        }
    }


    public static inline function maybeCall<T>(val:Dynamic, u:Dynamic):T
        return Reflect.isFunction(val) ? val(u) : val;


    public static inline function attr(key:String):Dynamic -> Dynamic
        return function(u:Dynamic) { return Reflect.field(u, key); };

    public static function rand(a:Float, b:Float):Float
    {
        var low = Math.min(a, b);
        return low + (Math.max(a, b) - low) * Math.random();
    }

    public static inline function random(a:Float, b:Float):?Dynamic -> Float
        return function (?_:Dynamic) { return rand(a, b); };


    public static function pick<T>(arr:Array<T>):T
    {
        var i = Std.random(arr.length);
        var v = arr[i];
        arr.splice(i, 1);
        return v;
    }

    public static function roll<T>(arr:Array<T>):T
        return arr[Std.random(arr.length)];


    public static inline function toRad(deg:Float):Float
        return (Math.PI / 180.0) * deg;

    public static inline function toDeg(rad:Float):Float
        return (180.0 / Math.PI) * rad;
}
