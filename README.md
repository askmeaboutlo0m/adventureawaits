# NAME

Adventure Awaits - a friendly text adventure game

# SYNOPSIS

This is an archive of a game I made a long time ago. It's a text adventure in the style of a modern point and click adventure. It's not in development or anything, but its ideas may be of interest. I intend to write about it at some point.

The primary version of this game with some additional bugfixes patched in after the fact is available at <https://askmeaboutlo0m.github.io/adventure/>

There's also compiled versions of the Lua port in [the releases section](https://github.com/askmeaboutlo0m/adventureawaits/releases).

# DESCRIPTION

This repository contains three parts to the game:

* [adv](adv) - the scripts that generate most of the content.
* [haxe](haxe) - the original Haxe version, which ran in Flash Player and is also the basis of the primary web version.
* [lua](lua) - a port to a newer engine, which runs natively and can compile to WebAssembly.

More about these pieces in the following sections.

# adv

This is a set of scripts that generate a bunch of lookup tables for the game. This is probably the most interesting part. It's one of those domain-specific languages.

The game-related scripts are in the `.pl` files. For example, [bootstrap.pl](adv/bootstrap.pl) contains the core verbs and actions. Rooms like [temple.pl](adv/temple.pl) contain all the definitions for the stuff in that room.

The generator code is in the `lib` directory. It basically does some sanity checking, some formatting and then spits out big lookup tables so that the game can handle the respective inputs.

You need Perl and Carton to set this up. Run `carton install` to install the dependencies, then `carton exec ./adv.pl` to run the generator. It'll spit out `Data.hx` and `Thing.hx`, in the current directory, which should look mostly the same as [haxe/adventure/src/adv/Data.hx](haxe/adventure/src/adv/Data.hx) and [haxe/adventure/src/adv/Thing.hx](haxe/adventure/src/adv/Thing.hx).

Some parts of the game, like room descriptions, initial inventory, some boss fight handlers etc. are in the engine instead.

# haxe

Really old code that I don't remember how to make run anymore. It's written in Haxe, which is some obscure cross-platform language thing that I really only used because I wanted to compile stuff to SWF. I wouldn't use this anymore.

I don't recall what you need to do to make this build, but there's a `project.xml` file that lists the dependencies, one of those being "soul".

This is also what I compiled to JavaScript at some point to make the website version, but I don't have that anymore. But I recall it not being very exciting, basically ripping out all the scene stuff and replaced it with some DOM manipulation.

# lua

This is a port of the compiled code to Lua, which can run as a native application. I just ported the generated code directly, since it's basically just some lookup tables, so there's no Lua version of the adv generator.

The engine that this uses is [rouse](https://github.com/askmeaboutlo0m/rouse), which is written in C and Lua. Windows and WebAssembly versions are in [the releases section](https://github.com/askmeaboutlo0m/adventureawaits/releases). On Linux, you have to build from source, the scripts in the repository should be usable. Don't know or care about macOS.

The WebAssembly version of this is *not* the primary browser version linked above, it's the native application running in the browser and rendering to an OpenGL canvas.

# LICENSE

MIT, see [the LICENSE file](LICENSE) for details.
