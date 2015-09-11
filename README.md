# Caffe for Windows

Caffe is a deep learning framework made with expression, speed, and modularity in mind.
It is developed by the Berkeley Vision and Learning Center ([BVLC](http://bvlc.eecs.berkeley.edu)) and community contributors.

This branch is for Windows and Visual Studio 2013.

Most of procedures I did and 3rdparty are from Neil Shao's [blog post](https://initialneil.wordpress.com/2015/01/11/build-caffe-in-windows-with-visual-studio-2013-cuda-6-5-opencv-2-4-9/). If you have any problems, you may refer to the blog post. Most of issues including LMDB(+ memory-hog issue), pycaffe, matcaffe have been solved in this repository.

# Step 1
We need following external libraries to build caffe.
- CUDA 7.5 + cuDNN v3
- OpenCV 3.0.0
- [Boost 1.56](http://sourceforge.net/projects/boost/files/boost-binaries/1.56.0/boost_1_56_0-msvc-12.0-64.exe/download)
- OpenBLAS (in 3rdparty)
- GFlags, GLog, Protobuf (in 3rdparty)
- LevelDB, LMDB, HDF5 (in 3rdparty)

You can download pre-built 3rd party libraries here. You should extract 3rdparty folder to `caffe/`.
https://www.dropbox.com/s/v038gymle57kn7d/3rdparty.zip?dl=0

# Step 2
Check if following environment variables are set.
- CUDA_PATH_V7_5
- OPENCV_HOME (like `D:\dev\opencv`)
- BOOST_1_56_0 (like `D:\dev\boost_1_56_0`)
- Path (add like `D:\dev\opencv\build\x64\vc12\bin;D:\dev\caffe\3rdparty\bin;C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v7.5\bin`)

For pycaffe,
- PYTHON_27_HOME (like `C:\Python27`)
- PYTHONPATH (add like `D:\dev\caffe\python`)
- Path (add like `D:\dev\boost_1_56_0\lib64-msvc-12.0`)

And, execute `scripts/GeneratePB_python.bat`. You should also install all python packages in `caffe/python/requirements.txt`. Most of packages can be installed by `pip`, but you may have to install some packages yourself. For leveldb, you may refer to https://code.google.com/p/py-leveldb/issues/detail?id=12.

For matcaffe,
- MATLAB_HOME (like `C:\Program Files\MATLAB\R2014a`)

And, execute `addpath matlab` in MATLAB command line.

# Step 3
Open `caffe/caffe.sln` and set `Release` mode.
You may need some changes in project settings according to your environment.
Finally, you can build caffe.
