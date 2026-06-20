function hex2rgb(hex)
	hex = hex:gsub("#", "")
	return { tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6)), tonumber("0x" .. hex:sub(7, 8)) }
end
