k = Kontakt
fs = Filesystem

-- USER SETUP ------------------------------------

output_folder = ""
-- END USER SETUP ------------------------------------

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

k.set_instrument_script_source(inst, 4, "") -- clear script
-- io.remove()

key_range = {}
ks_keys = {}
ks_names = {}
read_file_into_table("key_range.nka", key_range)
read_file_into_table("ks_keys.nka", ks_keys)
for i = 1, #ks_keys do ks_keys[i] = tonumber(ks_keys[i]) end
for i = 1, #key_range do key_range[i] = tonumber(key_range[i]) end
read_file_into_table("ks_names.nka", ks_names)

-- Find num_ks
end_found = 0
for i, key in pairs(ks_keys) do
	if key == 0 and end_found == 0 then
		num_ks = i - 1
		end_found = 1
	end
end

keymap = "# MIDI note/CC name map\n"
for i = 1, num_ks do
	keymap = keymap .. ks_keys[i] .. " " .. ks_names[i] .. "\n"
end
for i = 0, 10 do
	if i*12 >= key_range[1] and i*12 <= key_range[2] then
		keymap = keymap .. i * 12 .. " C" .. i-2 .. "\n"
	end
end
for i = 1, num_ks do
	keymap = keymap .. "NO " .. ks_keys[i] .. "\n"
end
for i = key_range[1], key_range[2] do
	if is_in_table(ks_keys, i) == false then
		keymap = keymap .. "NO " .. i .. "\n"
	end
end

path = k.script_path .. "/" .. nki_name .. ".txt"
keymap_file = io.open(path, "w")
keymap_file:write(keymap)
