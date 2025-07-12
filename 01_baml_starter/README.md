# Getting Started with BAML

This guide will help you get started with using BAML to extract information from emails and tickets, even if you have little or no programming experience.

## What is BAML?
BAML is a tool that allows you to use AI to extract and classify information from text, such as emails or support tickets, with simple functions.

## Prerequisites
- Python installed on your computer
- Access to this project folder
- Your API keys set in the `.env` file (ask your admin if unsure)


## Step 1: Install BAML and Required Packages
Open a terminal in this folder and run:

```
uv pip install baml-py
uv pip install -r requirements.txt
```

If you don't have [uv](https://github.com/astral-sh/uv) installed, you can install it with:

```
pip install uv
```

## Step 2: Initialize BAML Project
Run the following command to initialize BAML in your project:

```
uv run baml-cli init
```

## Step 3: Generate Python Code from BAML
After editing your `.baml` files, generate the Python code, this commmand will auto-generate the `baml_client` directory, which will have auto-generated python code to call your BAML functions.

```
uv run baml-cli generate
```


## Step 4: Set Up Your Environment
Make sure your `.env` file contains the necessary API keys. Example:

```
OPENAI_API_KEY=your-openai-key-here
```


## Step 5: Run the Example
You can run the main example by typing:

```
python main.py
```

This will:
- Extract the type of spam from an email subject
- Classify a support ticket
- Extract order information from an Amazon order confirmation email

You will see the results printed in your terminal.

## How It Works
- The code uses simple Python functions to send your text to the BAML AI models.
- You only need to provide the text (like an email or ticket) as shown in the examples in `main.py`.

## Customizing
To try your own email or ticket, edit the `email` or `ticket` variables in `main.py` and run the script again.

## Need Help?
If you get stuck, ask your project admin or check the README for troubleshooting tips.

