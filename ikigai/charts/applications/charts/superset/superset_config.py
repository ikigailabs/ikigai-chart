import os

MAPBOX_API_KEY = os.getenv('MAPBOX_API_KEY', '')
CACHE_CONFIG = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_HOST': 'redis',
    'CACHE_REDIS_PORT': 6379,
    'CACHE_REDIS_DB': 1,
    'CACHE_REDIS_URL': 'redis://redis-service.superset:6379/1'}
SQLALCHEMY_DATABASE_URI = \
    'postgresql://SUPERSET_POSTGRES_USERNAME:SUPERSET_POSTGRES_PASSWORD@SUPERSET_POSTGRES_HOSTNAME:5432/SUPERSET_POSTGRES_DATABASE_NAME'
CACHE_NO_NULL_WARNING = True
SQLALCHEMY_TRACK_MODIFICATIONS = True
SESSION_COOKIE_SAMESITE = None
# Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = False
ENABLE_PROXY_FIX = True
PREFERRED_URL_SCHEME = 'https'
SESSION_COOKIE_HTTPONLY = False
ENABLE_CORS = True

APP_ICON = "/static/assets/images/ikigai.png"

from security import CustomSecurityManager
CUSTOM_SECURITY_MANAGER = CustomSecurityManager


class ReverseProxied(object):

    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        script_name = environ.get('HTTP_X_SCRIPT_NAME', '')
        if script_name:
            environ['SCRIPT_NAME'] = script_name
            path_info = environ['PATH_INFO']
            if path_info.startswith(script_name):
                environ['PATH_INFO'] = path_info[len(script_name):]

        scheme = environ.get('HTTP_X_SCHEME', '')
        if scheme:
            environ['wsgi.url_scheme'] = scheme
        return self.app(environ, start_response)


ADDITIONAL_MIDDLEWARE = [ReverseProxied, ]
