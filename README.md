coffeescript_backbone_01
========================
Some general tests using Adam J Spooner's tutorial http://adamjspooner.github.io/coffeescript-meet-backbonejs/
Pages rendered through Python and Flask.


Usage examples
--------------
http://localhost:5000/bb/4 step 4 of tutorial
http://localhost:5000/bb/5/n for step5 NEW VERSION

There are some 'b' version, not soi much worth mentioning, accessed through e.g. http://localhost:5000/bb/5/b


What are new version changes
----------------------------
Moved to much newer versions of underscore/backbone/jquery.
In (this) first commit just listenTo call instead of bind call to collection, a few small changes while playing.

Howtos
------
To auto compile on any change in any coffee file:
coffee --watch --compile scripts