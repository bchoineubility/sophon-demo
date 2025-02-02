#!/bin/bash
res=$(which unzip)
if [ $? != 0 ];
then
    echo "Please install unzip on your system!"
    exit
fi
pip3 install dfss -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade
scripts_dir=$(dirname $(readlink -f "$0"))

pushd $scripts_dir
# datasets
if [ ! -d "../datasets" ]; 
then
    python3 -m dfss --url=open@sophgo.com:sophon-demo/C3D/datasets_0918/datasets.zip
    unzip datasets.zip -d ../
    rm datasets.zip

    echo "datasets download!"
else
    echo "Datasets folder exist! Remove it if you need to update."
fi

# models
if [ ! -d "../models" ]; 
then
    python3 -m dfss --url=open@sophgo.com:sophon-demo/C3D/models_0918/models.zip
    unzip models.zip -d ../
    rm models.zip
    python3 -m dfss --url=open@sophgo.com:sophon-demo/C3D/models_240315/BM1688.zip
    unzip BM1688.zip -d ../models/
    rm BM1688.zip
    python3 -m dfss --url=open@sophgo.com:sophon-demo/C3D/models_240412/CV186X.zip
    unzip CV186X.zip -d ../models/
    rm CV186X.zip
    echo "models download!"
else
    echo "Models folder exist! Remove it if you need to update."
fi
popd