jQuery(function ($) {
  // Load Google visualization library if a chart element exists
  if ($('[data-chart]').length > 0) {
        $('[data-chart]').each(function () {
          var div = $(this)
          // Fetch chart data
          $.getJSON(div.data('chart'), function (data) {
            $.each(data, function () { $('div').append(this); });
          });
        });
  }
});