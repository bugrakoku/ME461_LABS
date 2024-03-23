from setuptools import find_packages, setup

package_name = 'spawn_service'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='ahmedmuhammad',
    maintainer_email='thisisdeahmed@gmail.com',
    description='TODO: Package description',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'spawn_service = spawn_service.spawn_service:main',
            'spawn_targets_service = spawn_service.spawn_targets_service:main'
        ],
    },
)
