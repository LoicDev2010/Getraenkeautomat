#!/bin/bash

# Autor: Loïc Déverin #
# Mail: loic.deverin@stud.bzbs.ch #
# Datum: 13.05.2026 #


{   # Variablen
    RED='\e[31m'
    GREEN="\e[32m"
    NONE="\e[0m"
    geld=0
    getraenk=""
    milch=""
    zucker=""
    guthaben=7000
}

Main() {
    ErsteAuswahl() {    # Die erste Auswahl (Geld einfwerfen oder Abbrechen)
        echo "1) Bargeld"
        echo "2) Twint"
        echo "3) Paypal"
        echo "0) Abbrechen"
        read -rp "Auswahl: " auswahl

        case $auswahl in
            1)
                Bar
            ;;
            2)
                Twint
            ;;
            3)
                Paypal
            ;;
            0)
                exit
            ;;
            *) 
                UngueltigeAuswahl
            ;;
        esac
    }

    Twint() {   # QRCode wird aufgerufen, mit sleep wird zeit zum "scannen" simuliert, dann check ob man mindestens 5000Rp. (5Fr.) Guthaben hat
        QRCode
        sleep 5

        if ((guthaben >= 5000)); then
            geld=$guthaben
            GetraenkeAuswahl
        else
            UngenuegendesGuthaben
        fi
    }

    Paypal() {  # QRCode wird aufgerufen, mit sleep wird zeit zum "scannen" simuliert, dann check ob man mindestens 5000Rp. (5Fr.) Guthaben hat
        QRCode
        sleep 5

        if ((guthaben >= 5000)); then
            geld=$guthaben
            GetraenkeAuswahl
        else
            UngenuegendesGuthaben
        fi
    }

    Bar() {   # Geld einwerfen und test ob >
        read -rp "Geld einwerfen (in Rappen): " geld
        
        if ((geld <= 0)); then
            echo -e "${RED}Bitte Geld Einwerfen!${NONE}"
        else
            GetraenkeAuswahl
        fi
    }

    Abbrechen() {   # Abbrechen mit Rückgabe von Rückgeld
        echo -e "${GREEN}Rückgeld: ${geld}${NONE}"
        exit
    }

    GetraenkeAuswahl() {    # Die Getränkeoberwahl (Kaffee, Tee, ...)
        echo "Bitte treffen Sie eine Auswahl (1-6):"
        echo "1) Kaffee"
        echo "2) Tee"
        echo "3) CocaCola"
        echo "4) Sprite"
        echo "5) Fanta"
        echo "6) Wasser"
        echo "0) Abbrechen"
        read -rp "Auswahl: " kategorie

        case $kategorie in
            1)
                Kaffee
            ;;
            2)
                Tee
            ;;
            3)
                CocaCola
            ;;
            4)
                Sprite
            ;;
            5)
                Fanta
            ;;
            6)
                Wasser
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Kaffee() {  # Wird aufgerufen wenn Kaffee ausgewählt wird
        echo "1) Latte Machiatto - 250 Rappen"
        echo "2) Cappucino - 220 Rappen"
        echo "3) Espresso - 180 Rappen"
        echo "4) Normaler Kaffee - 150 Rappen"
        echo "0) Abbrechen"
        read -rp "Auswahl: " getraenk

        case $getraenk in
            1)
                if ((geld >= 250)); then
                    getraenk="Latte Machiatto"
                    ((geld-=250))
                    Zucker
                else
                    UngenuegendGeld
                fi
            ;;
            2)
                if ((geld >= 220)); then
                    getraenk="Cappucino"
                    ((geld-=220))
                    Zucker
                else
                    UngenuegendGeld
                fi
            ;;
            3)
                if ((geld >= 180)); then
                    getraenk="Espresso"
                    ((geld-=180))
                    Zucker
                else
                    UngenuegendGeld
                fi
            ;;
            4)
                if ((geld >= 150)); then
                    getraenk="Normaler Kaffee"
                    ((geld-=150))
                    Zucker
                else
                    UngenuegendGeld
                fi
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Tee() { # Wird aufgerufen wenn Tee ausgewählt wird
        echo "1) Schwarz Tee - 150 Rappen"
        echo "2) Minze Tee - 150 Rappen"
        echo "3) Früchte Tee - 150 Rappen"
        echo "0) Abbrechen"
        read -rp "Auswahl: " getraenk

        case $getraenk in
            1)
                if ((geld >= 150)); then
                    getraenk="Schwarz Tee"
                    ((geld-=150))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            2)
                if ((geld >= 150)); then
                    getraenk="Minze Tee"
                    ((geld-=150))
                    Ausgabe
                else
                    UngenuegendGeld  
                fi
            ;;
            3)
                if ((geld >= 150)); then
                    getraenk="Früchte Tee"
                    ((geld-=150))
                    Ausgabe
                else
                    UngenuegendGeld   
                fi
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    CocaCola() {    # Wird aufgerufen wenn CocaCola ausgewählt wird
        echo "1) Cola Normal - 200 Rappen"
        echo "2) Cola Zero - 200 Rappen"
        echo "3) Cola Light - 200 Rappen"
        echo "0) Abbrechen"
        read -rp "Auswahl: " getraenk

        case $getraenk in
            1)
                if ((geld >= 200)); then
                    getraenk="Cola Normal"
                    ((geld-=200))
                    Ausgabe
                else
                    UngenuegendGeld            
                fi
            ;;
            2)
                if ((geld >= 200)); then
                    getraenk="Cola Zero"
                    ((geld-=200))
                    Ausgabe
                else
                    UngenuegendGeld            
                fi
            ;;
            3)
                if ((geld >= 200)); then
                    getraenk="Cola Light"
                    ((geld-=200))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Sprite() {  # Wird aufgerufen wenn Sprite ausgewählt wird
        echo "1) Sprite Normal - 200 Rappen"
        echo "2) Sprite Zero - 200 Rappen"
        echo "0) Abbrechen"
        read -rp "Auswahl: " getraenk

        case $getraenk in
            1)
                if ((geld >= 200)); then
                    getraenk="Sprite Normal"
                    ((geld-=200))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            2)
                if ((geld >= 200)); then
                    getraenk="Sprite Zero"
                    ((geld-=200))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Fanta() {   # Wird aufgerufen wenn Fanta ausgewählt wird
        echo "1) Fanta Normal - 200 Rappen"
        echo "2) Fanta Holunder - 220 Rappen"
        echo "3) Fanta Exotic - 220 Rappen"
        echo "0) Abbrechen"
        read -rp "Auswahl: " getraenk

        case $getraenk in
            1)
                if ((geld >= 200)); then
                    getraenk="Fanta Normal"
                    ((geld-=200))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            2)
                if ((geld >= 220)); then
                    getraenk="Fanta Holunder"
                    ((geld-=220))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            3)
                if ((geld >= 220)); then
                    getraenk="Fanta Exotic"
                    ((geld-=220))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Wasser() {  # Wird aufgerufen wenn Wasser ausgewählt wird
        echo "1) Stilles Wasser - 100 Rappen"
        echo "2) Mineral Wasser - 100 Rappen"
        echo "0) Abbrechen"
        read -rp "Auswahl: " getraenk

        case $getraenk in
            1)
                if ((geld >= 100)); then
                    getraenk="Stilles Wasser"
                    ((geld-=100))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            2)
                if ((geld >= 100)); then
                    getraenk="Mineral Wasser"
                    ((geld-=100))
                    Ausgabe
                else
                    UngenuegendGeld
                fi
            ;;
            0)
                Abbrechen
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    UngueltigeEingabe() {   # Wird aufgerufen wenn eine ungültige Eingabe erfolgt
        echo -e "${RED}Ungültige Eingabe${NONE}"
        GetraenkeAuswahl
    }

    Zucker() {  # Auswahl mit/ohne Zucker (nur bei Kaffee)
        echo "1) Mit Zucker"
        echo "2) Ohne Zucker"
        read -rp "Auswahl: " zucker

        case $zucker in
            1)
                zucker="mit Zucker"
                Milch
            ;;
            2)
                zucker="ohne Zucker"
                Milch
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Milch() {   # Auswahl mit/ohne Milch (nur bei Kaffee)
        echo "1) Mit Milch"
        echo "2) Ohne Milch"
        read -rp "Auswahl: " milch

        case $milch in
            1)
                milch="mit Milch"
                Ausgabe
            ;;
            2)
                milch="ohne Milch"
                Ausgabe
            ;;
            *)
                UngueltigeEingabe
            ;;
        esac
    }

    Ausgabe() { # zeitverzögerte Ausgabe
        echo -e "${GREEN}Rückgeld: ${geld}${NONE}"
        echo -n "Getränk wird zubereitet..."
        for i in {1..4}; do
            sleep 1
            echo -n ".."
        done
        echo ""

        if [[ $milch == "" ]]; then
            echo -e "Ihr Getränk: ${GREEN}${getraenk}"
            echo -e "${RED}Bitte entnehmen!${NONE}"
        else
            echo -e "Ihr Getränk: ${GREEN}${getraenk} (${milch}, ${zucker})"
            echo -e "${RED}Bitte entnehmen!${NONE}"
        fi
    }

    UngenuegendGeld() { # Wird aufgerufen wenn man zu wenig Geld hat
        echo -e "${RED}Ungenügend Geld${NONE}"
        GetraenkeAuswahl
    }

    UngenuegendesGuthaben() {   # Wird aufgerufen wenn man zu wenig Guthaben hat (Twint/Paypal)
        echo -e "${RED}Ungenügendes Guthaben${NONE}"
        exit
    }

    QRCode() {  # QRCode für Twint und Paypal
        echo "####### # # # #######"
        echo "#     #  #  # #     #"
        echo "# ### # #   # # ### #"
        echo "# ### # ####  # ### #"
        echo "# ### # #  ## # ### #"
        echo "#     # ## #  #     #"
        echo "####### # # # #######"
        echo "        # #          "
        echo "###  ####   ## #  #  "
        echo " #  # ##   # # ##### "
        echo "## #   ### #    #    "
        echo "# # ####  ## # #  ## "
        echo "  ##  #  # #  #   #  "
        echo "        #   # #   #  "
        echo "#######  #####  # ## "
        echo "#     # # #  #   #   "
        echo "# ### #  #### ###  # "
        echo "# ### # # # #  #  ## "
        echo "# ### #  #   ## #### "
        echo "#     # ###  #   #   "
        echo "####### #  # ####### "
    }

    ErsteAuswahl    
}

Main    # gestartet wird mit der Funktion "Main"