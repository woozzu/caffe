REM This script converts the cifar data into leveldb format.

set EXAMPLE=examples/cifar10
set DATA=data/cifar10
set DBTYPE=lmdb

echo "Creating $DBTYPE..."

rd /s /q "%EXAMPLE%/cifar10_train_%DBTYPE%"
rd /s /q "%EXAMPLE%/cifar10_test_%DBTYPE%"

"./bin/convert_cifar_data.exe" %DATA% %EXAMPLE% %DBTYPE%

echo "Computing image mean..."

"./bin/compute_image_mean" -backend=%DBTYPE% ^
  %EXAMPLE%/cifar10_train_%DBTYPE% %EXAMPLE%/mean.binaryproto

echo "Done."
