pip install Django>=3.2,<4.0 psycopg2-binary>=2.9,<3.0 djangorestframework>=3.12,<4.0 python-decouple>=3.4,<4.0 django-cors-headers>=3.10,<4.0 djangorestframework-simplejwt cryptography mysqlclient gunicorn whitenoise
python manage.py collectstatic --noinput
python manage.py migrate