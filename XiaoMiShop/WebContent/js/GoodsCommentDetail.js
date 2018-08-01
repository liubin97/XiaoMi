$(document).ready(function(){
    $('#doc-prompt-toggle').on('click', function() {
        $('#my-prompt').modal({
            relatedTarget: this,
            onConfirm: function(e) {
                $('#mCommentReply').submit();
            },
            onCancel: function(e) {

            }
        });
    });
});