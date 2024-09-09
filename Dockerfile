FROM python:3.12

WORKDIR /usr/src/app

COPY src/ .
COPY requirements.txt .

RUN pip install --no-cache -r requirements.txt

# Install SQLite3
RUN apt-get update && apt-get install -y sqlite3

# Create the SQLite database and initialize it
RUN sqlite3 quiz.db < quiz.sql

# Add users using adduser.py (assuming it processes users.csv and adds them to quiz.db)
RUN python adduser.py

EXPOSE 8080

CMD ["python", "./softdes.py"]