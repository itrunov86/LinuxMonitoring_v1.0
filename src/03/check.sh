if [ $# -ne 4 ]; then
    echo "There should be 4 parameters."
    exit 1
else  
    for i in $@
    do
        if ! [[ $i =~ ^[0-9]+$ ]] || [ $i -le 0 ] || [ $i -gt 6 ]; then
            echo "There should be numbers from 1 to 6. Please enter the correct number."
            exit 1
        fi     
    done
    
    if [[ $1 -eq $2 ]]; then
            echo "Choose different colors for foreground and background so they don't match. And try restarting the script."
            exit 1
        elif [[ $3 -eq $4 ]]; then
            echo "Choose different colors for foreground and background so they don't match. And try restarting the script."
            exit 1
        fi
fi