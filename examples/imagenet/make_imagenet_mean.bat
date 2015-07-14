cd ../../

REM Compute the mean image from the imagenet training lmdb
REM N.B. this is available in data/ilsvrc12

set EXAMPLE=examples/imagenet
set DATA=data/ilsvrc12
set BUILD=bin

"%BUILD%/compute_image_mean" %EXAMPLE%/ilsvrc12_train_lmdb ^
  %DATA%/imagenet_mean.binaryproto

echo "Done."

pause
