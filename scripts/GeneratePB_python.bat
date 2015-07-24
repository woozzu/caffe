if exist "./python/caffe/proto/caffe_pb2.py" (
    echo caffe_pb2.py remains the same as before
) else (
    echo caffe_pb2.py is being generated
    if not exist "./python/caffe/proto" (
        mkdir "./python/caffe/proto"
        echo. 2>./python/caffe/proto/__init__.py
    )
    "./3rdparty/bin/protoc" -I="./src/caffe/proto" --python_out="./python/caffe/proto" "./src/caffe/proto/caffe.proto"
)