from django.core.exceptions import PermissionDenied
from users_app.models import Profile


def is_dispensary(function):
    def wrap(request, *args, **kwargs):
        user = request.user
        if user.profile.user_type == Profile.DISPENSARY:
            return function(request, *args, **kwargs)
        else:
            raise PermissionDenied
    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap