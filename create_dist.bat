set PATH=C:\Python310\Scripts;%PATH%

rmdir build /s /q

python.exe setup.py bdist_wheel 
python.exe setup.py sdist --formats=gztar 

rmdir build /s /q


pause