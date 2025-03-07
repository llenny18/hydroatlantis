pip install Django psycopg2-binary0 djangorestframework python-decouple django-cors-headers djangorestframework-simplejwt cryptography mysqlclient gunicorn whitenoise
python manage.py collectstatic --noinput
python manage.py migrate