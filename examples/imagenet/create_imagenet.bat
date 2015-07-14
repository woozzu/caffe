cd ../../

REM Create the imagenet lmdb inputs
REM N.B. set the path to the imagenet train + val data dirs

set EXAMPLE=examples/imagenet
set DATA=data/ilsvrc12
set BUILD=bin

set TRAIN_DATA_ROOT=e:/ILSVRC2012_img_train/
set VAL_DATA_ROOT=e:/ILSVRC2012_img_val/

set BACKEND=lmdb

rd /s /q "%EXAMPLE%/ilsvrc12_train_%BACKEND%"
rd /s /q "%EXAMPLE%/ilsvrc12_val_%BACKEND%"

REM Set RESIZE=true to resize the images to 256x256. Leave as false if images have
REM already been resized using another tool.
set RESIZE=true
if "%RESIZE%"=="true" (
  set RESIZE_HEIGHT=256
  set RESIZE_WIDTH=256
) else (
  set RESIZE_HEIGHT=0
  set RESIZE_WIDTH=0
)

if not exist %TRAIN_DATA_ROOT% (
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: %TRAIN_DATA_ROOT%"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" ^
       "where the ImageNet training data is stored."
  Exit /b
)

if not exist %VAL_DATA_ROOT% (
  echo "Error: VAL_DATA_ROOT is not a path to a directory: %VAL_DATA_ROOT%"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  Exit /b
)

echo "Creating train lmdb..."

"%BUILD%/convert_imageset" ^
    --resize_height=%RESIZE_HEIGHT% ^
    --resize_width=%RESIZE_WIDTH% ^
    --shuffle=true ^
    --backend=%BACKEND% ^
    %TRAIN_DATA_ROOT% ^
    %DATA%/train.txt ^
    %EXAMPLE%/ilsvrc12_train_%BACKEND%

echo "Creating val lmdb..."

"%BUILD%/convert_imageset" ^
    --resize_height=%RESIZE_HEIGHT% ^
    --resize_width=%RESIZE_WIDTH% ^
    --shuffle=true ^
    --backend=%BACKEND% ^
    %VAL_DATA_ROOT% ^
    %DATA%/val.txt ^
    %EXAMPLE%/ilsvrc12_val_%BACKEND%

echo "Done."

pause
