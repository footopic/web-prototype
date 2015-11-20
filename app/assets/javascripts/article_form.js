var marked = require('marked');
console.log(marked);

$(function() {
    var $text_edit = $('#article_text');
    var $text_preview = $('#text-preview-area');

    // 変更をマークダウンにしプレビューに反映する
    $text_edit.keyup(function() {
        $text_preview.html(marked($(this).val()));
    });
});
