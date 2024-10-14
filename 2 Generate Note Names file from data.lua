k = Kontakt
fs = Filesystem

inst = 0
nki_name = k.get_instrument_name(inst)

-- Helper functions
function is_in_table(tbl, item)
	output = false
	for n = 1, #tbl do
		if tbl[n] == item then
			output = true
		end
	end
	return output
end

function read_file_into_table(file, tbl)
	path = k.script_path .. "/" .. file
	file = io.open(path, "r")
	file:read()
	for line in file:lines() do
		table.insert(tbl, line)
	end
end

key_types = {}
ks_names = {}
read_file_into_table("nki data/key_types.nka", key_types)
for i = 1, #key_types do key_types[i] = tonumber(key_types[i]) end
read_file_into_table("nki data/ks_names.nka", ks_names)

keymap = "# MIDI note/CC name map\n"
for i = 1, 128 do
	if key_types[i] == 2 then
		if ks_names[i] ~= '' then
			keymap = keymap .. i-1 .. " " .. ks_names[i] .. "\n"
		else
			keymap = keymap .. i-1 .. " " .. "keyswitch" .. "\n"
		end
	end
end
for i = 1, 128 do
	if key_types[i] == 2 then
		keymap = keymap .. "NO " .. i-1 .. "\n"
	end
end
for i = 1, 128 do
	if key_types[i] == 1 then
		keymap = keymap .. "NO " .. i-1 .. "\n"
	end
end

path = k.script_path .. "/Generated Note Names/" .. nki_name .. ".txt"
keymap_file = io.open(path, "w")
keymap_file:write(keymap)
