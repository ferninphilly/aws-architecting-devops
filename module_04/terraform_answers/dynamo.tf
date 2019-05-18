resource "aws_dynamodb_table" "badmovie-dynamodb-table" {
  name = "BadMovies"
  read_capacity = 5
  write_capacity = 5
  hash_key = "Title"
  range_key = "Date"

  attribute = [
    {
      name = "Title"
      type = "S"
    },
    {
      name = "Date"
      type = "N"
    }]
}

resource "aws_iam_role_policy" "dynamodb-lambda-policy"{
  name = "dynamodb_lambda_policy"
  role = "${aws_iam_role.lambda_exec.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:*"
      ],
      "Resource": "${aws_dynamodb_table.badmovie-dynamodb-table.arn}"
    }
  ]
}
EOF
}

