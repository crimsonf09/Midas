FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy 'example' folder and 'testData' folder into container under /app
COPY example /app

# Install required Python packages
RUN pip install --no-cache-dir \
    numpy==1.23.5 \
    pandas==1.5.3 \
    jupyter \
    ipykernel \
    matplotlib \
    scipy \
    scikit-learn \
    statsmodels

# Expose Jupyter Notebook port
EXPOSE 8888

# Register Jupyter kernel
RUN python -m ipykernel install --user --name=midas-env --display-name "Python (midas-env)"

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
