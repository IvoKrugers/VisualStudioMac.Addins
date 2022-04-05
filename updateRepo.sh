#!/bin/sh

SCRIPTFILE=$0

#Get the absolute path to the containing folder
PROJECTFOLDER=${SCRIPTFILE%/*}

cd ${PROJECTFOLDER}

pwd

rm *.mpack
mono /Applications/Visual\ Studio.app/Contents/Resources/lib/monodevelop/bin/vstool.exe setup pack ../VisualStudioMac.OneClickToOpenFile/VisualStudioMac.OneClickToOpenFile/bin/VisualStudioMac.OneClickToOpenFile.dll
mono /Applications/Visual\ Studio.app/Contents/Resources/lib/monodevelop/bin/vstool.exe setup pack ../VisualStudioMac.GetGitUrl/VisualStudioMac.GetGitUrl/bin/Release/net471/VisualStudioMac.GetGitUrl.dll 



/Applications/Visual\ Studio.app/Contents/MacOS/vstool setup rep-build .
rm index.html

#xml ed -i "/Repository" -t text -n "Name" -v "Visual Studio Mac Addins by Ivo Krugers" main.mrep