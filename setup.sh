#!/bin/bash

repo(){
cd ~
git clone https://github.com/yqlbu/TRT-yolov3
cd TRT-yolov3/yolov3_onnx
}

start(){
# add github part
echo "[INFO]  Start downloading YOLOv3 cfg and weights ..."
echo "[INFO]  Download starts in 3 secs ..."
sleep 3
sh download.sh
echo "[ENGINE]  Converting Yolo Weight to ONNX model in 3 secs ..."
sleep 3
python3 yolov3_to_onnx.py --model yolov3-416
echo "[ENGINE]  Converting from ONNX to TensorRT Engine in 3 secs ..."
sleep 3
python3 onnx_to_tensorrt.py --model yolov3-416
}

menu(){
echo "
+-------------------------------------------------+
|@@@@@@@  TRT-YOLOv3 Object Detection API  @@@@@@@@
|                                                 |
|  This script helps you download the necessary   |
|  weights files, and finish the conversion pro   |
|  -cess automatically.                           |
|                                                 |
|  Author: Kevin Yu (kevinyu211@yahoo.com)        |
|                                                 |
+-------------------------------------------------+
"
read -p ' ->  Confirm to continue the process? [y/n]: ' VAL
echo " ->  You choose $VAL."
case "$VAL" in 
    [yY])
        echo "[INFO]  Download will start in 3 seconds."
        sleep 3
        echo "[INFO]  Start!"
        # start
        ;;
    [nN])
        echo "[INFO]  Installation ends..."
        ;;
    *)
        echo "[ERROR] Please enter corrent input"
        ;;
esac
}

menu
repo
start
