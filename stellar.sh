
echo "  ##########  ########### #########    #          #               ##         ######### "
echo "  #                #      #            #          #              #  #        #       # "
echo "  #                #      #            #          #             #    #       #       # "
echo "  #                #      #            #          #            #      #      #       #  "
echo "  ##########       #      #########    #          #           ##########     #########  "
echo "           #       #      #            #          #          #          #    # #         "  
echo "           #       #      #            #          #         #            #   #    #       "
echo "  ##########       #      #########    #########  ######## #              #  #       #    "


secret_token=notaoriginalone
parameter=$1

function getting_collaburl(){
    echo "enter your collaborator URL"
read collaburl
 }



if [[ $parameter == "" || $parameter == "-h" ]]; then
    echo "Usage: to scan a single domain: ./stellar.sh https://www.domain.com/"
    echo "Usage: to scan a list of domains ./stellar.sh -L domains.txt "
    echo "Usage: to forcefully find status code of domain ./stellar.sh -f https://www.domain.com/"
    echo "usage: to forcefully find the status code of a list of domains ./stellar.sh -g domains.txt"
    exit 1
fi
if [[ $parameter == http* ]]; then
getting_collaburl
while read -r header; do
content_length=$(curl -s $parameter --head -H $header: $collaburl| grep -i "content-length")
echo "the header is $header and the $content_length"
done < headers.txt
fi
if [[ $parameter == "-L" ]]; then
getting_collaburl
while read -r names; do
while read -r header; do
content_length=$(curl -s $names --head -H $header: $collaburl| grep -i "content-length")
echo "performing for $names"
echo "the header is $header and the $content_length"
done < headers.txt
done < $2
fi

if [[ $parameter == "-f" ]]; then
getting_collaburl
while read -r headers; do 
getting_length=$(curl -s $2 --head -H $headers: $collaburl | wc -c)
echo "the header is $headers and the length is $getting_length"
done < headers.txt
fi

if [[ $parameter == "-g" ]]; then
getting_collaburl
while read -r names; do
while read -r header; do
content_length=$(curl -s $names --head -H $header: $collaburl| wc -c)
echo "performing for $names"
echo "the header is $header and the content length is:$content_length"
done < headers.txt
done < $2
fi

