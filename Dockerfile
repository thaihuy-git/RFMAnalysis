FROM python:3.9

WORKDIR /RFMAnalysis

COPY . .

RUN pip install --no-cache-dir -r requirements.txt
