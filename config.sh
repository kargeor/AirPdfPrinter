#!/bin/bash

PTR="PDF"

service cups start

echo "Configuring the printer $PTR."
lpadmin -p $PTR -v cups-pdf:/ -E -P /usr/share/ppd/cups-pdf/CUPS-PDF_opt.ppd

echo "Setting the default printer to $PTR."
lpadmin -d $PTR



### https://www.cups.org/doc/sharing.html

cupsctl --share-printers --remote-any

lpadmin -p PDF -o printer-is-shared=true


###



service cups stop
