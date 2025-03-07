pip install Django psycopg2-binary djangorestframework python-decouple django-cors-headers djangorestframework-simplejwt cryptography mysqlclient gunicorn whitenoise
python manage.py collectstatic --noinput
python manage.py migrate