# Discourse Permalink Plugin

**ATTENTION**: this plugin is defunc on vanilla discourse at the moment due to incompability with other plugins.

This plugin allows for custom permalinks for topics.

## Details

Through this plugin a topic can now have a `permalink`-custom_field for lookup that it can be found it.

The plugin operates in two modes: redirect and legacy-mode. When the permalink_redirect setting is set to true (default) in the Administration interface, the plugin will match the permalink and when found redirect to the new URL – this is recommended behaviour. If disabled however, the topic will be only accessible through that permalink and use that instead of the generated links.

.Attention: This plugin requires discourse >= 0.9.9.7 . Please upgrade to master.

## Installation

Just two easy steps. From your main discourse do:

    cd plugins
    git clone https://github.com/ligthyear/discourse-plugin-permalink.git   # clone the repo here
    cd ..
    rake assets:precompile                      # precompile assets

## Changelog:

 * 2014-07-15
  - publish initial version

## TODO

(in order of importance)

 - fix post_number URLS
 - make more tests
 - find out why the Dropdown-Button-View hicks up sometimes
 - add UI for custom_field configuration
 - fix 404 behaviour
 - add locales


### other Limitations:


## Authors:
Benjamin Kampmann <me @ create-build-execute . com>

## License (BSD):
Copyright (c) 2014, Benjamin Kampmann
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
