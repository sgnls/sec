$(document).on('mouseover', '.glossary-term, .glossary-definition', function(e) {
  var def = $(e.target).closest('.glossary-term').find('.glossary-definition');
  clearTimeout(def.data('timeout'));
  def.data('timeout', null).show();
});

$(document).on('mouseout', '.glossary-term, .glossary-definition', function(e) {
  var def = $(e.target).closest('.glossary-term').find('.glossary-definition');
  if (!def.data('timeout')) {
    def.data('timeout', setTimeout(function() {
      def.data('timeout', null).hide();
    }, 200));
  }
});

$(document).on('click', '.glossary-term', function(e) {
  if (!$(e.target).closest('.glossary-definition').length) {
    var url = $(e.target).closest('.glossary-term').find('a').attr('href');
    window.open(url);
  }
});
