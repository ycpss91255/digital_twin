import os
from glob import glob
from setuptools import find_packages, setup

package_name = "python_parameters"

setup(
    name=package_name,
    version="0.0.0",
    packages=find_packages(exclude=["test"]),
    data_files=[
        ("share/ament_index/resource_index/packages", ["resource/" + package_name]),
        ("share/" + package_name, ["package.xml"]),
        (os.path.join("share", package_name), glob("launch/*launch.[pxy][yma]*")),
    ],
    install_requires=["setuptools"],
    zip_safe=True,
    maintainer="cyc",
    maintainer_email="ycpss91255@gmail.com",
    description="Python parameter tutorial",
    license="Apache-2.0",
    tests_require=["pytest"],
    entry_points={
        "console_scripts": [
            "minimal_param_node = python_parameters.python_parameters_node:main",
        ],
    },
)
