#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~ Salon Appointment Scheduler ~~~~\n"

#services list
SERVICES_MENU() {

  #get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  #if no services
  if [[ -z $SERVICES ]]
    then echo -e "\nSorry, there aren't available services."
    else
      #display services
      echo -e "\nSelect a service:"
      echo "$SERVICES" | while read SERVICE_ID BAR NAME
        do
          echo "$SERVICE_ID) $NAME"
        done
        #ask for service
        #echo -e "\nWhat service do you prefer?"
        read SERVICE_ID_SELECTED

        # Verify if SERVICE_ID_SELECTED is valid
        VALID_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

        if [[ -z $VALID_SERVICE_ID ]]; then
          echo -e "\nInvalid service selection. Please try again."
          SERVICES_MENU
        else
          #get costumer info
          echo -e "\nWhat is your phone number?"
          read CUSTOMER_PHONE
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
          #if customer doesn't exists
          if [[ -z $CUSTOMER_NAME ]]
            then
              #get new name
              echo -e "\nWhat is your name?"
              read CUSTOMER_NAME
              #insert new customer
              INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
          fi
              #get customer_id
              CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
              #ask service time
              echo -e "\nService time HH:MM"
              read SERVICE_TIME 
              #insert appointment
              INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
              #get service info
              SERVICE_INFO=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
              echo -e "\nI have put you down for a $(echo $SERVICE_INFO | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
              #echo "I have put you down for a $SERVICE_INFO at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
        fi
  fi 
}
SERVICES_MENU
