resource "aws_secretsmanager_secret" "cve_app" {
  name                    = "cve/app"
  recovery_window_in_days = 0 # dev: allows destroy + recreate with the same name
}

resource "aws_secretsmanager_secret_version" "cve_app" {
  secret_id = aws_secretsmanager_secret.cve_app.id
  secret_string = jsonencode({
    DATABASE_URL = "postgresql+psycopg://${aws_db_instance.cve.username}:${random_password.db.result}@${aws_db_instance.cve.address
    }:5432/${aws_db_instance.cve.db_name}?sslmode=require"
    NVD_API_KEY = var.nvd_api_key
  })
} 