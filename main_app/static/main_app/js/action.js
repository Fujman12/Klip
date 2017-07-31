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

    $(".js-submit-syka").on('click', function () {
        var form = $('.js-create-deal-form');
        console.log(form);

        $.ajax({
        url: form.attr("action"),
        data: form.serialize(),
        type: form.attr("method"),
        dataType: 'json',
        success: function (data) {
          /*if (data.form_is_valid) {
            alert("New survey created!");  // <-- This is just a placeholder for now for testing
            $("#modal-book").modal("hide");
            window.location.href = '/faq/' + data.topic_pk

          }
          else {
            $("#modal-book .modal-content").html(data.html_form);
          }*/
          if(data.form_is_valid){
              $('#myModal').modal('hide');
              alert('New deal created');
              $('#imageModal').modal('show');
              $('#imageModal .modal-content').html(data.image_upload_form)
          }

        }
        });
        return false;
    });
    
    $('.status-switch-js').change(function () {
        var item =$(this);
        if(item.is(":checked")){
            $.ajax({
                url:item.attr("data-url"),
                data: {'checked': '1'},
                type:'post',
                dataType:'json',
                success: function () {
                    alert('Deal status changed');
                }
            })
        } else {
            $.ajax({
                url:item.attr("data-url"),
                data: {'checked': '0'},
                type:'post',
                dataType:'json',
                success: function () {
                    alert('Deal status changed');
                }
            })
        }
    });

    $('.js-remove-deal').click(function(){
        var btn =$(this);
        var r = confirm('Are you sure you want to remove this deal?');
        if(r == true){
            $.ajax({
                url:btn.attr("data-url"),
                type:'get',
                success: function () {
                    alert('Deal has been removed');
                }
            })
        }
    });




})

