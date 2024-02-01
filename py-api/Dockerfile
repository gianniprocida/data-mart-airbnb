FROM       python:3

WORKDIR    /app
COPY       requirements.txt /app/
RUN        pip install -r requirements.txt

COPY       *.py /app/
#RUN        chmod a+x *.py
COPY       templates /app/templates

CMD         ["python","-u","app.py" ]