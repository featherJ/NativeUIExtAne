#!/bin/bash

TARGET=NativeUIExt
ANE_NAME=NativeUIExt

rm -f $TARGET
rm -f $ANE_NAME


ADT="/Applications/Adobe Flash Builder 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK/bin/adt"

echo $ADT

rm -rf build
mkdir -p build/mac


cp -r osx/$TARGET/Build/Intermediates.noindex/ArchiveIntermediates/$TARGET/IntermediateBuildFilesPath/UninstalledProducts/macosx/$TARGET.framework build/mac
cp as3-library/$TARGET/extension.xml build
cp as3-library/$TARGET/bin/$TARGET.swc build
unzip -o -q build/$TARGET.swc library.swf
mv library.swf build/mac

"$ADT" -package \
	-target ane $ANE_NAME.ane build/extension.xml \
	-swc build/$TARGET.swc  \
	-platform MacOS-x86-64 \
	-C build/mac .

if [ -f ./$ANE_NAME.ane ];
then
    echo "SUCCESS"
	rm -rf build
else
    echo "FAILED"
fi
