function validateLogin() {

    if($('#admin_name').val() == "" || $.trim($('#admin_name').val()).length == 0){
        $('#my-alert').modal('toggle');
    }else if($('#admin_password').val() == "" || $.trim($('#admin_password').val()).length == 0){
        $('#my-alert').modal('toggle');
    }else{
        $('#validateAdmin').submit();
    }
}
