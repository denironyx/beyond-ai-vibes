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




