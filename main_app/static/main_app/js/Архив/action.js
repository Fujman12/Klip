$(function () {
    $('.js-post-review').submit(function (e) {
        e.preventDefault()
        var form = $(this);
          $.ajax({
            url: form.attr("action"),
            data: form.serialize(),
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if(data['form_is_valid']){
                    $('.posted-review').html(data['html_review_list']);
                    form[0].reset();
                }

            }
          });
          return false;
    });
})