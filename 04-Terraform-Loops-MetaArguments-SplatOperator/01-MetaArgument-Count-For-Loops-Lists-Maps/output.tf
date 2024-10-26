# Terraform Output Values
/* Concepts Covered
1. For Loop with List
2. For loop with Map
3. For loop with Map Advanced
4. Legacy Splat Operator (latest) - Return List
5. Latest Generalized Splat operator - Returns the list
*/

#output - for loop with list

output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

#output - For loop with map

output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.myec2vm: c => instance.public_dns}
}

#Output - for loop with map advanced
output "name" {
  description = "For loop with map - advanced"
  value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
}

#Output latest Generalized Splat Operator - Returns the list
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value = aws_instance.myec2vm[*].public_dns
}