// This module creates the WebSocket API Gateway and a DynamoDB table for connections.

resource "aws_dynamodb_table" "connections" {
  name           = "${var.project_name}-websocket-connections"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "connectionId"

  attribute {
    name = "connectionId"
    type = "S"
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-connections-table"
    }
  )
}

resource "aws_apigatewayv2_api" "websocket" {
  name                       = "${var.project_name}-websocket-api"
  protocol_type              = "WEBSOCKET"
  route_selection_expression = "$request.body.action"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-websocket-api"
    }
  )
}

# Note: The Lambda functions for connect, disconnect, and message handling
# would be created separately and integrated here. For now, we are just
# provisioning the API Gateway and DynamoDB resources.
# Integrations would be added like this:
/*
resource "aws_apigatewayv2_integration" "connect" {
  api_id           = aws_apigatewayv2_api.websocket.id
  integration_type = "AWS_PROXY"
  integration_uri  = var.connect_lambda_invoke_arn
}

resource "aws_apigatewayv2_route" "connect" {
  api_id    = aws_apigatewayv2_api.websocket.id
  route_key = "$connect"
  target    = "integrations/${aws_apigatewayv2_integration.connect.id}"
}
*/

resource "aws_apigatewayv2_stage" "prod" {
  api_id      = aws_apigatewayv2_api.websocket.id
  name        = "prod"
  auto_deploy = true
}