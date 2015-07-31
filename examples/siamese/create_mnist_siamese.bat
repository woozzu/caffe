REM This script converts the mnist data into leveldb format.

set EXAMPLES=./examples/siamese
set DATA=./data/mnist

echo "Creating leveldb..."

rd /s /q "%EXAMPLE%/mnist_siamese_train_leveldb"
rd /s /q "%EXAMPLE%/mnist_siamese_test_leveldb"

"bin/convert_mnist_siamese_data.exe" ^
    %DATA%/train-images-idx3-ubyte ^
    %DATA%/train-labels-idx1-ubyte ^
    %EXAMPLES%/mnist_siamese_train_leveldb
"bin/convert_mnist_siamese_data.exe" ^
    %DATA%/t10k-images-idx3-ubyte ^
    %DATA%/t10k-labels-idx1-ubyte ^
    %EXAMPLES%/mnist_siamese_test_leveldb

echo "Done."
