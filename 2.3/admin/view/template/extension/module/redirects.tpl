<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-account" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-account" class="form-horizontal">

        <table id="redirect-list" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
              <th class="text-left"><?php echo $old_url; ?></th>
              <th class="text-left"><?php echo $new_url; ?></th>
              <th></th>
            </tr>
            </thead>
            <tbody>
            <?php $redirect_row = 0;
                   foreach ($redirects as $redirect) { ?>
            <tr id="redirect-row-<?php echo $redirect_row; ?>">
              <td class="text-left">
                <input type="text" maxlength="255" name="redirect[<?php echo $redirect_row; ?>][old_url]" value="<?php echo $redirect['old_url']; ?>" class="validate-url form-control" placeholder="<?php echo $old_placeholder; ?>">
              <td class="text-left">
                <input type="text" maxlength="255" name="redirect[<?php echo $redirect_row; ?>][new_url]" value="<?php echo $redirect['new_url']; ?>" class="validate-url form-control" placeholder="<?php echo $new_placeholder; ?>">
              </td>
              <td class="text-right"><button type="button" onclick="$('#redirect-row-<?php echo $redirect_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $btn_del_row; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
            </tr>
            <?php $redirect_row++;
                   } ?>
            </tbody>
            <tfoot>
            <tr>
              <td colspan="100%" class="text-right">
                  <button type="button" onclick="addRedirect();" data-toggle="tooltip" title="<?php echo $btn_new_row; ?>" class="btn btn-primary">
                  <i class="fa fa-plus-circle"></i></button>
              </td>
            </tr>
            </tfoot>
          </table>





        </form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
var redirect_row = <?php echo $redirect_row; ?>;

function addRedirect() {

  html  = '<tr id="redirect-row-' + redirect_row + '">';
  html += '    <td class="text-right">';
  html += '        <input maxlength="255" type="text" name="redirect[' + redirect_row + '][old_url]" value="" class="validate-url form-control" placeholder="<?php echo $old_placeholder; ?>">';
  html += '    </td>';
  html += '    <td class="text-left">'
  html += '        <input maxlength="255" type="text" name="redirect[' + redirect_row + '][new_url]" value="" class="validate-url form-control" placeholder="<?php echo $new_placeholder; ?>">';
  html += '    </td>';
  html += '    <td class="text-right">';
  html += '        <button type="button" onclick="$(\'#redirect-row-' + redirect_row + '\').remove();" data-toggle="tooltip" title="<?php echo $btn_del_row; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>';
  html += '    </td>';
  html += '</tr>';

  $('#redirect-list tbody').append(html);

redirect_row++;
}
//--></script>
<?php echo $footer; ?>

<script type="text/javascript">

//validate fields - disallow spaces
$('#redirect-list').on('keypress', '.validate-url', function( e ) {
    if(e.which === 32) {
        return false;
    };
});

//Limit text length if maxlength is set on textarea
$("input[maxlength]").bind("keyup input paste", function() {
      var limit = parseInt($(this).attr('maxlength'));
      var text = $(this).val();
      var chars = text.length;
      var charsRemaining = limit - chars;
      if (charsRemaining === 0) {
        alert("URL Character Limit of 255 Chars Exceeded")
      }

      if(chars > limit){
          var new_text = text.substr(0, limit);
          $(this).val(new_text);
      }
  });
  </script>
