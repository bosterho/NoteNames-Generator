k = Kontakt
fs = Filesystem
inst = 0

-- USER SETUP ------------------------------------
-- END USER SETUP ------------------------------------

script = '{ Compiled on Sun Oct 13 19:35:16 2024 }\n'
script = script .. 'on init\n'
  script = script .. 'declare $sksp_dummy\n'
  script = script .. 'declare $concat_it\n'
  script = script .. 'declare $concat_offset\n'
  script = script .. 'declare $string_it\n'
  script = script .. 'declare $list_it\n'
  script = script .. 'declare $preproc_i\n'
  script = script .. 'declare $i\n'
  script = script .. 'declare $num_ks\n'
  script = script .. 'declare %key_types[128]\n'
  script = script .. 'declare !ks_names[128]\n'
  script = script .. 'declare @info_path\n'
  script = script .. 'declare $key_active\n'
script = script .. 'end on\n'
script = script .. 'on persistence_changed\n'
  script = script .. '$i := 0\n'
  script = script .. 'while ($i<=127)\n'
    script = script .. '$key_active := 1\n'
    script = script .. 'if (get_key_color($i)=$KEY_COLOR_INACTIVE or (get_key_color($i)=$KEY_COLOR_NONE))\n'
      script = script .. '$key_active := 0\n'
    script = script .. 'end if\n'
    script = script .. 'if ($key_active=1)\n'
      script = script .. '%key_types[$i] := 1\n'
      script = script .. 'if (get_key_type($i)=$NI_KEY_TYPE_CONTROL)\n'
        script = script .. '%key_types[$i] := 2\n'
        script = script .. '!ks_names[$i] := get_key_name($i)\n'
      script = script .. 'end if\n'
    script = script .. 'end if\n'
    script = script .. 'inc($i)\n'
  script = script .. 'end while\n'
  script = script ..   '@info_path := ' .. '"' .. k.script_path .. '/nki data/' .. '"' .. '\n'
  script = script .. 'save_array_str(%key_types,@info_path & "key_types.nka")\n'
  script = script .. 'save_array_str(!ks_names,@info_path & "ks_names.nka")\n'
script = script .. 'end on\n'



k.set_instrument_script_source(inst, 4, script)