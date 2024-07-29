import json
import boto3
from boto3.dynamodb.conditions import Key

def lambda_handler(event, context):
    # Initialize a session using Amazon DynamoDB
    dynamodb = boto3.resource('dynamodb')
    
    # Select your DynamoDB table
    table = dynamodb.Table('Resumes')
    
    # Fetch the resume with ID = 1
    response = table.query(
        KeyConditionExpression=Key('id').eq("1")
    )
    
    # Check if the item exists
    if 'Items' in response and len(response['Items']) > 0:
        resume = response['Items'][0]
        return {
            'statusCode': 200,
            'body': json.dumps(resume)
        }
    else:
        return {
            'statusCode': 404,
            'body': json.dumps({'error': 'Resume not found'})
        }