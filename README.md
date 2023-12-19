# DebounceLibrary
simple, barebones debounce library for Roblox.

## How to use

### debounceLib.New
```lua
function debounceLib.New(debounceDelay : number, callbackFunction : function) : table
```
Returns new object

### debounceObject:DoDebounce
```lua
function debounceObject:DoDebounce(tempDebounceDelay : number) : boolean
```
Returns true if debounce **should** happen, false if not.

### debounceObject:SetDelay
```lua
function debounceObject:SetDelay(debounceDelay : number)
```
Updates current `debounceDelay` to new one.