enum SpamType {
    Spam
    NotSpam
}

// ClassifyText function to classify input text as Spam or NotSpam
function ClassifyText(input: string) -> SpamType {
    client "openai/gpt-4o-mini"
    prompt #"
        Please classify the following text as either 'Spam' or 'NotSpam': 
        
        {{ ctx.output_format }}

        {{ _.role("system") }}
        
        {{ _.role("user") }}

        {{ input }}
    "#
}

// Test the classifier


test BasicSpamTest {
    functions [ClassifyText]
    args {
        input "Congratulations! You've won a free iPhone! Click here to claim your prize."
    }
}

test BasicNotSpamTest {
    functions [ClassifyText]
    args {
        input "Hello Dennis, I hope you are having a great day! I wanted to check in on the project status and see if you need any assistance."
    }
}
