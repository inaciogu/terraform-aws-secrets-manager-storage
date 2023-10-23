variable "secrets" {
  type = list(object({
    name        = string
    description = string
    values      = map(string)
  }))
}
