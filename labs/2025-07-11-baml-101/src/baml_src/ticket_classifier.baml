// Multi-Lable Classification

// Define the labels Enum and Schema
enum TicketLabel {
    ACCOUNT
    BILLING
    GENERAL_QUERY
}

class TicketClassification {
    labels TicketLabel[]
}


// Create the Multi-Label Classification function

function ClassifyTicket(ticket: string) -> TicketLabel[] {
    // Specify a client as provider/model-name
    // you can use custom LLM params with a custom client name from clients.baml like "client CustomHaiku"
    client "openai/gpt-4o-mini" // Set OPENAI_API_KEY to use this client.
    prompt #"
        You are a support agent at a tech company. Analyze the support ticket and select all applicable labels from the following list:
                 
        {{ ctx.output_format }}

        {{ _.role("user") }}

        {{ ticket }}
    "# 
}


// Test the Multi-Label Classification function

test ClassifyTicketSingleLabel {
    functions [ClassifyTicket]
    args {
        ticket "I have a question about my account settings."
    }
}

test ClassifyTicketMultipleLabels {
    functions [ClassifyTicket]
    args {
        ticket "My Account is locked and I need help with billing issues."
    }
}