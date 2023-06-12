# Start from a base image with Python 3.7
FROM python:3.7

# Set the working directory in the container
WORKDIR /app


# Copy the requirements file into the container
COPY requirements.txt .
COPY Face_detection.ipynb /app/
COPY DATA /app/DATA

RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter Notebook
RUN pip install jupyter

# Copy the Jupyter Notebook configuration file
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
