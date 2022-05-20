FROM python:rc-alpine3.13

# preparations
WORKDIR /app
COPY . .

# install
RUN pip3 install -r requirements.txt

# port expose
EXPOSE 5000

# run
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=5000"]