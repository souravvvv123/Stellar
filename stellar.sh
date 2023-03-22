
echo "  ##########  ########### #########    #          #               ##         ######### "
echo "  #                #      #            #          #              #  #        #       # "
echo "  #                #      #            #          #             #    #       #       # "
echo "  #                #      #            #          #            #      #      #       #  "
echo "  ##########       #      #########    #          #           ##########     #########  "
echo "           #       #      #            #          #          #          #    # #         "  
echo "           #       #      #            #          #         #            #   #    #       "
echo "  ##########       #      #########    #########  ######## #              #  #       #    "



parameter=$1

function getting_headers(){
    while read -r header; do
    echo "$header"
    done < headers.txt
 }
echo "enter Your Collaborator or callbackurl url"
read callbackurl


if [[ $parameter == "" || $parameter == "-H" ]]; then
    echo "Usage to scan a single domain: ./stellar.sh https://domain.com/"
    echo "Usage to scan a list of domains ./stellar.sh -L domains.txt "
    exit 1

elif [[ $parameter == "-L" ]]; then
    
    if [[ $# -lt 2 ]]; then
        echo "Usage: ./stellar.sh -L domains.txt"
        exit 1
    fi
    wordlist=$2
    while read -r links; do
         multi=$(curl -s $links --head -H $(getting_headers): $callback| grep "Content-Length")
         echo "the domain is $links and $multi"
    done < $wordlist
    exit 1
else
echo "Usage to scan a single domain: ./stellar.sh https://domain.com/"
echo "Usage to scan a list of domains ./stellar.sh -L domains.txt "
exit 1
fi

abc=$(curl -s $parameter --head -H $(getting_headers): $callbackurl| grep "Content-Length")
echo "the url is:$parameter and the $abc"
 



