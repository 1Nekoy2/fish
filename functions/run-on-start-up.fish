function run-on-start-up

    switch (random 1 8)
        case 1
            fortune | cowsay -f kitty | lolcat
        case 2
            fortune | uwuify | cowsay -f kitty | lolcat
        case 3
            fastfetch
        case 4
            seq 64 | sort --random-sort | spark | lolcat
        case 5
            colorbars
        case 6
            colortest
        case 7
            colortest-slim
        case 8
            colorwheel
        case '*'
            echo "error" 
    end

end
