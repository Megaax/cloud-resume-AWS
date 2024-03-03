import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('viewstable')

def lambda_handler(event, context):
    response = table.get_item(
        Key={
            'id': '0'
        }
    )

    # Corrected the case of 'Item' and 'views' to match DynamoDB response
    item = response.get('Item')

    if item is not None:
        views_str = item.get('views', '0')
        
        try:
            views = int(views_str)
        except ValueError:
            views = 0
        
        views += 1
        print("Updated views:", views)

        response = table.put_item(
            Item={
                'id': '0',
                'views': str(views)  # Convert 'views' back to string before saving
            }
        )

        return {
            'statusCode': 200,
            'body': json.dumps({'views': views})
        }
    else:
        return {
            'statusCode': 404,
            'body': 'Item not found'
        }
