$(document).ready(function() {

  var Table = {};

  Table.applyNavbarPositions = function() {
    $.get('/cms/navbar_content_nodes/positions', function(data) {
      $('.navbar-table tbody tr').css('opacity', '0.5');
      $('.navbar-table tr td[data-content=position]').text('');
      $('.navbar-table tr td[data-content=shown]').text('Nein');
      for (let id in data) {
        $('.navbar-table tbody tr[data-node-id=' + id + ']').css('opacity', '1');
        $('.navbar-table tr[data-node-id=' + id + '] td[data-content=position]').text(data[id]);
        $('.navbar-table tr[data-node-id=' + id + '] td[data-content=shown]').text('Ja');
      }
    });
  };

  Table.applyNavbarPositions();

  Table.preserveCellWidth = function (event, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  Table.bind_sortable = function () {
    $('table.content-nodes tbody').sortable({
      helper: Table.preserveCellWidth,
      stop: function(event, ui) {
        var url = ui.item.attr('data-sort-url'),
            position = $('tr').index(ui.item);
        $.post(url, { position: position }, function() {
          Table.applyNavbarPositions();
        });
      }
    });
  };

  window.CmsTable = {
    bind_sortable: Table.bind_sortable
  };
});
