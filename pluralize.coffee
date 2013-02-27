pluralize = (count) ->
  words = Array::slice.call arguments, 1
	if count <= 1
		return words

	results = []
	for word in words
		for pair in pluralize._dict
			if word.match pair[0]
				word = word.replace pair[0], pair[1]
				break
		results.push word

	return results

pluralize._dict = [
	[/^is$/,                      'are'],
	[/(quiz)$/,                   '$1zes'],
	[/^(oxen)$/,                  '$1'],
	[/^ox$/,                      '$1en'],
	[/([m|1])ice$/,               '$1ice'],
	[/(m|1)ouse$/,                '$1ice'],
	[/(matr|vert|ind)(?:ix|ex)$/, '$1ices'],
	[/(x|ch|ss|sh)$/,             '$1es'],
	[/([^aeiouy]|qu)y$/,          '$1ies'],
	[/(hive)$/,                   '$1s'],
	[/(?:([^f])fe|([lr])f)$/,     '$1$2ves'],
	[/sis$/,                      'ses'],
	[/([ti])a$/,                  '$1a'],
	[/([ti])um$/,                 '$1a'],
	[/(buffal|tomat)o$/,          '$1oes'],
	[/(bu)s$/,                    '$1ses'],
	[/(alias|status)$/,           '$1es'],
	[/(octop|vir)i$/,             '$1i'],
	[/(octop|vir)us$/,            '$1i'],
	[/(ax|test)is$/,              '$1es'],
	[/s$/,                        's'],
	[/$/,                         's']
]

module.exports = pluralize
