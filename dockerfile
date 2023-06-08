# Start from a base image with Python 3.7
FROM python:3.7

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Install additional packages (NumPy and pandas)
RUN pip install numpy pandas

# Install Jupyter Notebook
RUN pip install jupyter

# Expose the Jupyter Notebook port
EXPOSE 8888

# Copy the Jupyter Notebook configuration file
COPY jupyter_notebook_config.py /root/.jupyter/

# Start Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
