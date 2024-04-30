final Map<String, String> htmlEntitiesMap = {
  '&quot;': '"',
  '&#039;': '\'',
  '&amp;': '&',
  '&lt;': '<',
  '&gt;': '>',
  '&nbsp;': ' ',
  '&copy;': '©',
  '&reg;': '®',
  '&euro;': '€',
  '&pound;': '£',
  '&yen;': '¥',
  '&cent;': '¢',
  '&sect;': '§',
  '&mdash;': '—',
  '&ndash;': '–',
  '&trade;': '™',
  '&raquo;': '»',
  '&laquo;': '«',
  '&hellip;': '…',
  '&dagger;': '†',
  '&Dagger;': '‡',
  '&rsquo;': '’',
  '&lsquo;': '‘',
  '&ldquo;': '“',
  '&rdquo;': '”',
};

String htmlEntityTransform(String input) {
  htmlEntitiesMap.forEach((key, value) {
    input = input.replaceAll(key, value);
  });

  return input;
}
