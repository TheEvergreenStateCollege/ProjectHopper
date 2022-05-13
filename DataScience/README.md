# Project Hopper Data Science Container

This container image is based on the [Jupyter SciPy Notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) environment created by the [Project Jupyter](https://jupyter.org) team.

We have added required packages for use with the textbook [Principles and Techniques of Data Science](http://www.textbook.ds100.org) by Lau, Gonzalez and Nolan and its associated [Github Repo](https://github.com/DS-100/sp22).

This container provides many popular Python packages for working with and modeling data, including:

- [pandas](https://pandas.pydata.org)
- [NumPy](https://numpy.org)
- [scikit-learn](https://scikit-learn.org/stable/)
- [Matplotlib](https://matplotlib.org)
- [SQLAlchemy](https://www.sqlalchemy.org)
- [seaborn](https://seaborn.pydata.org)

and those listed in the requirements file and in the Dockerfile.

## Usage Notes

This container is powered by [Conda](https://docs.conda.io/en/latest/) and [Mamba](https://mamba.readthedocs.io/en/latest/) for managing Python environments. 

### Running Jupyter Notebook Cells

To run cells in a Jupyter Notebook, select the Python kernel associated with the `base` Conda environment, which has the following file path:

```sh
/opt/conda/bin/python
```

### Installing Additional Packages

If there are extra packages you would like to install for your own use, you can use the command `mamba install`.

If the course is missing required packages, please let your instructor know or contact the project maintainers.
