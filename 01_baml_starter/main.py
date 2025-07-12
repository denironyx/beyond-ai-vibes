import json
import re
import typing
from datetime import datetime
from dotenv import load_dotenv
import os

from baml_client import b
from baml_client.config import set_log_level

os.environ['BAML_LOG'] = 'WARN'  # Set the log level for BAML client

#os.environ["BAML_LOG"] = "WARN"

load_dotenv()
# set_log_level("WARN")

# You can call a function from the baml_client module
def extract_spam_type(email: str):
    """
    Extracts the spam type from the email subject.

    args:
        email (str): The email subject to classify.
    
    returns:
        SpamType: The classified spam type.
    """
    spam_type = b.ClassifyText(email).value
    print(f"Extracted spam type: {spam_type}")
    return spam_type

extract_spam_type("Your order has been shipped!")
print("Spam type extraction complete.")


# Runing the classify ticket functions. /baml_src/ticket_classifier.baml
def extract_classify_ticket(ticket: str):
    """
    Extracts and classifies the ticket information.

    args:
        ticket (str): The ticket information to classify.
    
    returns:
        dict: A dictionary containing the classified ticket information.
    """
    classification = b.ClassifyTicket(ticket)
    print(f"Extracted classification: {classification}")
    return {"classification": classification}

extract_classify_ticket("My Account is locked and I need help with billing issues.")
print("Ticket classification complete.")



# Running the get_order_info function. /baml_src/get_order_info.baml
def get_order_info(email: dict):
    """
    Extracts order information from the email.

    args:
        email (dict): The email containing order information, with keys 'from_address', 'subject', and 'body'.
    
    returns:
        dict: A dictionary containing the extracted order information.
    """
    order_info = b.GetOrderInfo(email)
    print(f"Extracted order info: {order_info}")
    return {"order_info": order_info}


email = {
    "from_address": "hello@amazon.com",
    "subject": "Your Amazon Order Confirmation of 'Wood Dowel Rods...' has shipped!",
    "body": """
        Hi Sam, your package will arrive:
        Thurs, April 4
        Track your package:
        www.amazon.com/gp/your-account/ship-track?ie=23&orderId123
        On the way:
        Wood Dowel Rods...
        Order #113-7540940
        Ship to:
            Sam
            SEATTLE, WA
        Shipment total:
        $0.00
    """
}
get_order_info(email)
print("Order info extraction complete.")


