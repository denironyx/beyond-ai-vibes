class Email {
    subject string @description("The subject of the email")
    body string @description("The body content of the email")
    from_address string @description("The sender's email address")
}

template_string ChainOfThought(action: string?) #"
    Before you answer, please explain your reasoning step-by-step.
    {% if action %}{{ action }}{% endif %}
    
    For example:
    If we think step by step we can see that ...
    Therefore the output is:
    {
      ... // schema
    }
"#


function GetOrderInfo(email: Email) -> OrderInfo {
  client "openai/gpt-4o"
  prompt #"
    extract everything from this email.


    {{ ctx.output_format }}

    Outline some relevant information before you answer.
    Example:
    - ...
    - ...
    ...
    {
      ... // schema
    }

    {{ _.role('user') }}

    Sender: {{email.from_address}}
    Email Subject: {{email.subject}}
    Email Body: {{email.body}}
  "#
}


// function GetOrderInfo(email: Email) -> OrderInfo {
//   // Specify a client as provider/model-name
//   // you can use custom LLM params with a custom client name from clients.baml like "client CustomHaiku"
//   client "openai/gpt-4o" // Set OPENAI_API_KEY to use this client.
//   prompt #"
//     Extract everything from this email.

//     {{ ctx.output_format }}

//     {{ ChainOfThought("focus on things related to shipping") }}

//     Before you answer, please explain your reasoning step by step.

//     For example:
//     If we think step by step we can see that ... 

//     Therefore the output is:
//     {
//     ... // schema
//     }
    
//     {{ _.role("user") }}

//     Sender: {{ email.from_address }}
//     Email Subject: {{ email.subject }}
//     Email Body: {{ email.body }}
//   "#
// }




class OrderInfo {
    order_status "ORDERED" | "SHIPPED" | "DELIVERED" | "CANCELLED"
    tracking_number string?
    estimated_delivery_date string?
}

test Test1 {
    functions [GetOrderInfo]
    args {
        email {
            from_address "hello@amazon.com"
            subject "Your Amazon Order Confirmation of 'Wood Dowel Rods...' has shipped!"
            body #"
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
            "#

        }
    }
}