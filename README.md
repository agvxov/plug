# Plug

> PLUG - PlacehoLder Un- and Generator; for in place metaprogramming or easy payload embedding

A complementary tool for traditional preprocessors to avoid adding a redundant step of translation to every update.

### In practice

### Why?
Multiple reasons actually:

#### In place metaprogramming
Think preprocessors.
Only the most well adapted preprocessors have the privilage to have inplace operation support,
as the standard C preprocessor does.
However if one wishes to do something more hacky,
perhaps with the m4 preprocessor,
one would end up with `mysource.extension.m4`.
Which would be annoying to edit for multiple reasons:
+ getting the right highlighting is most likely painful to setup
+ a new intermediate file (mysource.extension) is introduced, which could be edited by accident
+ in case of large files, the reason/extend of using m4 becomes obfuscated by the dominating original format

#### Embedding
Say you wish to make a shell script self-contained,
but it relies on an external file.
It sounds self-contradictory,
however it could come up when,
say one of the tools involved need large amounts of binary data.

Imagine an installer for example that must unpack a tar.

Before you wonder if I had made this twisted hack up, I can prove the contrary:

https://www.xmodulo.com/embed-binary-file-bash-script.html
