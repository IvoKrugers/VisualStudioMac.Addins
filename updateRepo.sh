#!/bin/sh
clear

# Get and goto folder of this script's location
SCRIPTFILE=$0
ADDINFOLDER=${SCRIPTFILE%/*}
cd ${ADDINFOLDER}
ADDINFOLDER=$(pwd)

# Clean
rm *.mpack

# Pack
#If you get permision denied on /Applications/Visual\ Studio.app folder
#Goto the folder and Add full access to anyone via "get info" 
#sudo chmod u+w /Applications/Visual\ Studio.app
#sudo chmod -R a+rw /Applications/Visual\ Studio.app



for file in $(find ~/Xamarin_Projects/VS2022.EXTENSIONS -type f -wholename "*bin/Release/*VisualStudio*.dll"); do
  # Do something with $file
  echo "/Applications/Visual\ Studio\.app/Contents/MacOS/vstool setup pack \"$file\" -output $ADDINFOLDER"
  /Applications/Visual\ Studio\.app/Contents/MacOS/vstool setup pack "$file" -output "$ADDINFOLDER"
done


# Copy to local dir
for filename in /Applications/Visual\ Studio\.app/*VisualStudioMac*.mpack;
do
  echo "mv $filename"
  mv "$filename" .
done

# #mono /Applications/Visual\ Studio.app/Contents/Resources/lib/monodevelop/bin/vstool.exe setup pack ../bin/VisualStudioMac.OneClickToOpenFile.dll
# #mono /Applications/Visual\ Studio.app/Contents/Resources/lib/monodevelop/bin/vstool.exe setup pack ../bin/VisualStudioMac.GetGitUrl.dll 
# #mono /Applications/Visual\ Studio.app/Contents/Resources/lib/monodevelop/bin/vstool.exe setup pack ../bin/VisualStudioMac.FormatOnSave.dll 
# mono /Applications/Visual\ Studio.app/Contents/Resources/lib/monodevelop/bin/vstool.exe setup pack ../VisualStudioMac.SolutionTreeFilter/VisualStudioMac.SolutionTreeFilter/bin/VisualStudioMac.SolutionTreeFilter.dll 





# Rebuild Repo
/Applications/Visual\ Studio.app/Contents/MacOS/vstool setup rep-build $ADDINFOLDER
# rm index.html

#xml ed -i "/Repository" -t text -n "Name" -v "Visual Studio Mac Addins by Ivo Krugers" main.mrep