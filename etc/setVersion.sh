#! /usr/bin/env fish

set pluginVersion (jq '.version' './src/version.json')
jq ".version = $pluginVersion" package.json | sponge package.json
jq ".version = $pluginVersion" src/plugin.info | sponge src/plugin.info
