# API Documentation
## Base URL
The base URL for the API refer runbook.

### Endpoints

#### 1. Select Ticket
- Endpoint: /select_ticket
- Method: GET
- Description: This endpoint retrieves a token for ticket selection.
Response:

```
Status Code: 200 OK
Response Body:

{
  "token": "a_unique_token_value"
}
```
#### 2. Buy Ticket
- Endpoint: /buy_ticket
- Method: POST
- Description: This endpoint is used to buy a ticket for a specific flight.
```
Request Body:

{
  "flight_num": "flight_num",
  "token": "a_unique_token_value"
}
```
flight_num (string): The flight number for which the ticket is being purchased.
token (string): The token obtained from the "Select Ticket" endpoint.
```
Response:

Status Code: 200 OK
```
#### 3. Confirm Purchase
- Endpoint: /confirm_purchase
- Method: POST
- Description: This endpoint is used to confirm the ticket purchase.
```
Request Body:

{
  "flight_num": "flight_num",
  "token": "a_unique_token_value"
}
```
flight_num (string): The flight number for which the purchase is being confirmed.
token (string): The token obtained from the "Select Ticket" endpoint.
```
Response:

Status Code: 200 OK
```