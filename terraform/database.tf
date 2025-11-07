# DB Subnet Group 
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]

  tags = {
    Name = "DB Subnet Group"
  }
}

# DB Instance
resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro" 
  db_name              = "mydashboarddb"
  username             = "admin"        
  password             = "Password123!"
  skip_final_snapshot  = true
  publicly_accessible = false 
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id] 

  tags = {
    Name = "devops-db"
  }
}