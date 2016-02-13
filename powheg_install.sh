#!/bin/bash

pwg_inst_main_folder=`pwd`

########################################################################
########lhapdf##########################################################
########################################################################

echo "lhapdf "
cd $pwg_inst_main_folder/
wget http://www.hepforge.org/archive/lhapdf/lhapdf-5.8.9.tar.gz
tar xzf lhapdf-5.8.9.tar.gz
cd lhapdf-5.8.9/
./configure --prefix=$pwg_inst_main_folder/lhapdf
make
make install
###########################################################################
cd $pwg_inst_main_folder/lhapdf/share/lhapdf/
mkdir PDFsets
cd PDFsets
wget http://www.hepforge.org/archive/lhapdf/pdfsets/current/CT10nlo.LHgrid
wget http://www.hepforge.org/archive/lhapdf/pdfsets/current/cteq61.LHgrid
wget http://www.hepforge.org/archive/lhapdf/pdfsets/current/MSTW2008nlo68cl.LHgrid
wget http://www.hepforge.org/archive/lhapdf/pdfsets/current/MSTW2008nlo90cl.LHgrid

##########################################################################
#########fastjet##########################################################
##########################################################################

echo "fastjet "


cd $pwg_inst_main_folder/
wget http://fastjet.fr/repo/fastjet-3.0.3.tar.gz
tar -xvf fastjet-3.0.3.tar.gz
cd fastjet-3.0.3
./configure --prefix=$pwg_inst_main_folder/fastjet
make
make install

###########################################################################
#####pdf###################################################################
###########################################################################

export PATH=$pwg_inst_main_folder/fastjet/bin/:$PATH
export PATH=$pwg_inst_main_folder/lhapdf/bin/:$PATH
export LD_LIBRARY_PATH=$pwg_inst_main_folder/fastjet/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$pwg_inst_main_folder/lhapdf/lib/:$LD_LIBRARY_PATH




echo "powheg "
cd $pwg_inst_main_folder
# I usually add a subfolder for versioning of powheg here
svn checkout  --revision r2246 --username anonymous \
     --password anonymous svn://powhegbox.mib.infn.it/trunk/POWHEG-BOX
cd POWHEG-BOX/HJJ
make pwhg_main

############################################################################
exit 0

