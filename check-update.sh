#! /bin/bash

for pname in `ls ~/.emacs.d/my-*`;
do
    #base="$HOME/repos/emacs_configuration/emacs.d";
    fname=`$HOME/Scripts/filename.perl $pname`;
    if [ -e $fname ]; then
        echo "================================================================"
        echo "$pname  vs  $fname";
        echo "================================================================"
        diff $pname $fname;
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
    fi
done



              

