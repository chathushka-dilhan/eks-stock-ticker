output "websocket_api_endpoint" {
  description = "The endpoint URL for the WebSocket API."
  value       = aws_apigatewayv2_stage.prod.invoke_url
}

output "connections_table_name" {
  description = "The name of the DynamoDB table for WebSocket connections."
  value       = aws_dynamodb_table.connections.name
}