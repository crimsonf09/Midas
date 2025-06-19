FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy 'example' folder into container
COPY example /app

# Install required Python packages (pandas 1.5.3 + compatible numpy + Jupyter + kernel)
RUN pip install --no-cache-dir \
    numpy==1.23.5 \
    pandas==1.5.3 \
    jupyter \
    ipykernel \
    matplotlib \
    scipy \
    scikit-learn \
    statsmodels

# Optional: install more if your code uses these:
# RUN pip install seaborn plotly openpyxl xlrd

# Expose Jupyter Notebook port
EXPOSE 8888

# Register Jupyter kernel inside Docker
RUN python -m ipykernel install --user --name=midas-env --display-name "Python (midas-env)"

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
