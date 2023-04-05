FROM python:3.10.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev && apk add --no-cache freetype-dev

WORKDIR /code

COPY ./requirements.txt ./requirements.txt

RUN pip install --upgrade pip 

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
